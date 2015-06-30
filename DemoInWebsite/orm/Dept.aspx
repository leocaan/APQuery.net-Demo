<%@ Page Title="" Language="C#" MasterPageFile="~/Orm.master" AutoEventWireup="true" CodeFile="Dept.aspx.cs" Inherits="orm_Dept" %>
<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager"%>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">


	<asp:UpdatePanel runat="server">
		<ContentTemplate>
			<h2>Department Search</h2>
			<div class="row">
				<div class="col-md-12">
					<div class="form-inline">
						<div class="form-group">
							<asp:Label runat="server" AssociatedControlID="DeptName" CssClass="col-md-4 control-label">Name :</asp:Label>
							<div class="col-md-8">
								<asp:TextBox runat="server" ID="DeptName" CssClass="form-control" />
							</div>
						</div>
						<div class="form-group">
							<asp:Label runat="server" AssociatedControlID="Phone" CssClass="col-md-4 control-label">Phone: </asp:Label>
							<div class="col-md-8">
								<asp:TextBox runat="server" ID="Phone" CssClass="form-control" />
							</div>
						</div>
						<div class="form-group">
							<div>
								<asp:Button ID="SearchButton" runat="server" Text="Search" CssClass="btn btn-default" OnClick="SearchButton_Click" />
								<a href="DeptAdd" class="btn btn-default">Add new Department</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br />

			<div class="row">
				<div class="col-md-12">
					<table class="table">
						<tr>
							<th>Department ID</th>
							<th>Department Name</th>
							<th>Phone</th>
							<th>Actions</th>
						</tr>
				<asp:Repeater ID="rptr" runat="server">
					<ItemTemplate>
						<tr>
							<td><%# Eval("DepartmentId") %></td>
							<td><%# Eval("DeptName") %></td>
							<td><%# Eval("Phone") %></td>
							<td>
								<a href='<%# "DeptDetails.aspx?id=" + Eval("DepartmentId") %>'>Details</a> |
								<a href='<%# "DeptEdit.aspx?id=" + Eval("DepartmentId") %>'>Edit</a>
							</td>
						</tr>
					</ItemTemplate>
				</asp:Repeater>
					</table>
				</div>
			</div>


			<div class="paging">
				<webdiyer:AspNetPager id="Paging" runat="server"
					Width="100%" HorizontalAlign="center"
					AlwaysShowFirstLastPageNumber="true" PagingButtonSpacing="10"
					OnPageChanged="Paging_PageChanged"></webdiyer:AspNetPager>
			</div>


		</ContentTemplate>
	</asp:UpdatePanel>



</asp:Content>

