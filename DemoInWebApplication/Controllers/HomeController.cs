using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DemoInWebApplication.Controllers
{
	public class HomeController : Controller
	{
		public ActionResult Index()
		{
			return View();
		}

		public ActionResult GettingStarted()
		{
			return View();
		}

		public ActionResult LearnOrm()
		{
			return View();
		}

		public ActionResult LearnSQLExpression()
		{
			return View();
		}
	}
}