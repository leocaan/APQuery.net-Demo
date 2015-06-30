using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class orm_DeptAdd : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}

	protected void AddButton_Click(object sender, EventArgs e)
	{
		var data = new Department(){
			DeptName = DeptName.Text,
			Phone = Phone.Text
		};

		data.Insert();

		// - or -
		// APBplDef.DepartmentBpl.Insert(data);

		Response.Redirect("DeptDetails?id=" + data.DepartmentId);
	}
}