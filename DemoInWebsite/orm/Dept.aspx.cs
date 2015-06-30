using Symber.Web.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Wuqi.Webdiyer;

public partial class orm_Dept : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			Bind();
		}
	}

	protected void SearchButton_Click(object sender, EventArgs e)
	{
		Bind();
	}


	protected void Paging_PageChanged(object sender, EventArgs e)
	{
		Bind();
	}

	protected void Bind()
	{
		var name = DeptName.Text.Trim();
		var phone = Phone.Text.Trim();

		// sort name
		var t = APDBDef.Department;


		// condition
		APSqlWherePhrase where = (name != "") ? t.DeptName.Match(name) : null;
		if (phone != "")
			if (where == null)
				where = t.Phone.Match(phone);
			else
				where &= t.Phone.Match(phone);

		var list = Department.ConditionQuery(where, null, 10, (Paging.CurrentPageIndex - 1) * 10);

		// - or -
		// var list = APBplDef.DepartmentBpl.ConditionQuery(where, null, 10, (Paging.CurrentPageIndex - 1) * 10);


		rptr.DataSource = list;
		rptr.DataBind();

		Paging.RecordCount = Department.ConditionQueryCount(where);
	}

}