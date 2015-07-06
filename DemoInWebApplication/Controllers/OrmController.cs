using Symber.Web.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DemoInWebApplication.Controllers
{
	public class OrmController : Controller
	{
		//
		// Index

		public ActionResult Index()
		{
			return View();
		}


		//
		// Deptartment Search

		public ActionResult Dept()
		{
			return View();
		}

		[HttpPost]
		public ActionResult Dept(string deptName, string phone, int page = 1)
		{
			// sort name
			var t = APDBDef.Department;


			// condition
			APSqlWherePhrase where = (deptName != "") ? t.DeptName.Match(deptName) : null;
			if (phone != "")
				if (where == null)
					where = t.Phone.Match(phone);
				else
					where &= t.Phone.Match(phone);

			var list = Department.ConditionQuery(where, null, 10, (page - 1) * 10);

			// - or -
			// var list = APBplDef.DepartmentBpl.ConditionQuery(where, null, 10, (page - 1) * 10);

			var total = Department.ConditionQueryCount(where);
			ViewBag.PageCount = (total + 9) / 10;

			return View(list);
		}


		//
		// Add new Department

		public ActionResult DeptAdd()
		{
			return View();
		}

		[HttpPost]
		public ActionResult DeptAdd(Department model)
		{
			model.Insert();

			// - or -
			// APBplDef.DepartmentBpl.Insert(model);

			return RedirectToAction("DeptDetails", new { id = model.DepartmentId });
		}


		//
		// Department Details

		public ActionResult DeptDetails(int id)
		{
			var model = Department.PrimaryGet(id);

			// - or -
			//APBplDef.DepartmentBpl.PrimaryGet(id);

			return View(model);
		}


		// 
		// Edit the Department

		public ActionResult DeptEdit(int id)
		{
			var model = Department.PrimaryGet(id);

			return View(model);
		}

		[HttpPost]
		public ActionResult DeptEdit(int id, Department model)
		{
			Department.UpdatePartial(id, new { model.DeptName, model.Phone });

			// - or -
			//APBplDef.DepartmentBpl.UpdatePartial(id, new { model.DeptName, model.Phone });

			return RedirectToAction("DeptDetails", new { id = id });
		}


		//
		// Employee List

		public ActionResult Empl()
		{

			var list = Employee.GetAll();

			// - or -
			// var list = APBplDef.EmployeeBpl.GetAll();

			return View(list);
		}
	}
}