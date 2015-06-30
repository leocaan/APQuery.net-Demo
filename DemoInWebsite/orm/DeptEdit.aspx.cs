using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class orm_DeptEdit : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			Bind();
		}

	}

	protected void SaveButton_Click(object sender, EventArgs e)
	{
		int id = Int32.Parse(Request["id"]);

		// partial update
		Department.UpdatePartial(id, new { DeptName = DeptName.Text, Phone = Phone.Text });
		
		// - or -
		// APBplDef.DepartmentBpl.UpdatePartial(id, new { DeptName = DeptName.Text, Phone = Phone.Text });





		//
		// you can also complete update
		//

		/*

		var data = APBplDef.DepartmentBpl.PrimaryGet(id);
		data.DeptName = DeptName.Text;
		data.Phone = Phone.Text;

		data.Update();

		// - or -
		APBplDef.DepartmentBpl.Update(data);

		 */





		Response.Redirect("DeptDetails?id=" + id);
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