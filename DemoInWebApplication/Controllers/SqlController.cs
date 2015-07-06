using Symber.Web.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DemoInWebApplication.Controllers
{
	public class SqlController : Controller
	{
		APDBDef db;

		public SqlController()
		{
			db = new APDBDef();
		}

		protected override void Dispose(bool disposing)
		{
			db.Close();
			base.Dispose(disposing);
		}


		//
		// Index

		public ActionResult Index()
		{
			return View();
		}

		public ActionResult Asterisk()
		{
			// short name
			var t = APDBDef.Department;
			var query = APQuery.select(t.Asterisk)
				.from(t)
				.where(t.ParentId == 0)
				.order_by(t.ParentId.Desc);

			ViewBag.List = db.Query(query, r =>
			{
				return new
				{
					id = t.DepartmentId.GetValue(r),
					name = t.DeptName.GetValue(r),
					phone = t.Phone.GetValue(r)
				};
			}).ToList();

			return View();
		}

		public ActionResult ColumnAlias()
		{
			// short name
			var t = APDBDef.Department;
			var query = APQuery
				.select(t.DepartmentId, t.DeptName.As("name"), t.Phone.As("department phone"))
				.from(t)
				.where(t.ParentId == 0)
				.order_by(t.ParentId.Desc);

			ViewBag.List = db.Query(query, r =>
			{
				return new
				{
					id = t.DepartmentId.GetValue(r),
					name = t.DeptName.GetValue(r, "name"),
					phone = t.Phone.GetValue(r, "department phone")
				};
			}).ToList();

			return View();
		}

		public ActionResult Multitable()
		{
			// short name
			var t = APDBDef.Employee;
			var d = APDBDef.Department;
			var query = APQuery
				.select(t.EmployeeId, d.DeptName, t.Name, t.Birthday, t.Email)
				.from(t, d.JoinInner(t.DepartmentId == d.DepartmentId))
				.order_by(t.Name.Asc);

			ViewBag.List = db.Query(query, r =>
			{
				return new
				{
					id = t.EmployeeId.GetValue(r),
					dept = d.DeptName.GetValue(r),
					name = t.Name.GetValue(r),
					birthday = t.Birthday.GetValue(r).ToShortDateString(),
					email = t.Email.GetValue(r)
				};
			}).ToList();

			return View();
		}

		public ActionResult SelfRelationship()
		{
			// short name
			var t = APDBDef.Department;
			var p = APDBDef.Department.As("parent");
			var query = APQuery
				.select(t.DepartmentId, t.DeptName, p.DeptName.As("ParentName"))
				.from(t, p.JoinLeft(t.ParentId == p.DepartmentId))
				.take(10);

			ViewBag.List = db.Query(query, r =>
			{
				return new
				{
					id = t.DepartmentId.GetValue(r),
					name = t.DeptName.GetValue(r),
					pname = t.DeptName.GetValue(r, "ParentName")
				};
			}).ToList();
			
			return View();
		}

		public ActionResult Subquery()
		{
			// short name
			var t = APDBDef.Department;
			var e = APDBDef.Employee;
			var query = APQuery
				.select(t.DepartmentId, t.DeptName)
				.from(t)
				.where(t.DepartmentId.In(APQuery
					.select(e.DepartmentId).distinct()
					.from(e)
				));

			ViewBag.List = db.Query(query, r =>
			{
				return new
				{
					id = t.DepartmentId.GetValue(r),
					name = t.DeptName.GetValue(r),
				};
			}).ToList();
			
			return View();
		}

		public ActionResult Paging()
		{
			// short name
			var t = APDBDef.Department;
			var query = APQuery
				.select(t.DepartmentId, t.DeptName)
				.from(t)
				.where(t.ParentId != 0)
				.primary(t.DepartmentId) // it's very important
				.take(10).skip(10);

			int total = db.ExecuteSizeOfSelect(query);
			ViewBag.List = db.Query(query, r =>
			{
				return new
				{
					id = t.DepartmentId.GetValue(r),
					name = t.DeptName.GetValue(r),
				};
			}).ToList();
	
			return View();
		}

		public ActionResult Aggregation()
		{
			// short name
			var t = APDBDef.Department;
			var e = APDBDef.Employee;
			var query = APQuery
				.select(t.DepartmentId, t.DeptName, e.EmployeeId.Count().As("count"))
				.from(t, e.JoinLeft(t.DepartmentId == e.DepartmentId))
				.group_by(t.DepartmentId, t.DeptName, e.EmployeeId)
				.having(e.EmployeeId.Count() > 0);


			ViewBag.List = db.Query(query, r =>
			{
				return new
				{
					id = t.DepartmentId.GetValue(r),
					name = t.DeptName.GetValue(r),
					count = r.GetInt32(r.GetOrdinal("count"))
				};
			}).ToList();

			return View();
		}

		public ActionResult DateGroup()
		{
			// short name
			var t = APDBDef.Employee;
			var query = APQuery
				.select(
					t.Birthday.DateGroup(APSqlDateGroupMode.Month).As("Birthday"),
					new APSqlAggregationExpr(t.Birthday.DateGroup(APSqlDateGroupMode.Month), APSqlAggregationType.COUNT))
				.from(t)
				.group_by(t.Birthday.DateGroup(APSqlDateGroupMode.Month));


			ViewBag.List = db.Query(query, r =>
			{
				return new
				{
					birthday = t.Birthday.GetValue(r).ToString("yyyy-MM"),
					count = r.GetInt32(1)
				};
			}).ToList();

			return View();
		}
	}
}