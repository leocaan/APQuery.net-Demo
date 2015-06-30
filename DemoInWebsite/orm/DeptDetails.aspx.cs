using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class orm_DeptDetails : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			Bind();
		}
	}

	protected void EditButton_Click(object sender, EventArgs e)
	{
		int id = Int32.Parse(Request["id"]);

		Response.Redirect("DeptEdit?id=" + id);
	}

	protected void Bind()
	{
		int id = Int32.Parse(Request["id"]);

		var data = Department.PrimaryGet(id);

		// - or -
		// APBplDef.DepartmentBpl.PrimaryGet(id);

		DeptName.Text = data.DeptName;
		Phone.Text = data.Phone;
	}
}