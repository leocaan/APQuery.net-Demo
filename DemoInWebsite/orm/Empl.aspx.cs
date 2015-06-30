using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class orm_Empl : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			Bind();
		}

	}

	protected void Bind()
	{

		var list = Employee.GetAll();

		// - or -
		// var list = APBplDef.EmployeeBpl.GetAll();


		rptr.DataSource = list;
		rptr.DataBind();
	}
}