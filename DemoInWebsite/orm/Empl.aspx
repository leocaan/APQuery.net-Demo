<%@ Page Title="" Language="C#" MasterPageFile="~/Orm.master" AutoEventWireup="true" CodeFile="Empl.aspx.cs" Inherits="orm_Empl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

	<asp:UpdatePanel runat="server">
		<ContentTemplate>
			<h2>Employee List</h2>

			<div class="row">
				<div class="col-md-12">
					<table class="table">
						<tr>
							<th>Employee ID</th>
							<th>Name</th>
							<th>Birthday</th>
							<th>Email</th>
						</tr>
				<asp:Repeater ID="rptr" runat="server">
					<ItemTemplate>
						<tr>
							<td><%# Eval("EmployeeId") %></td>
							<td><%# Eval("Name") %></td>
							<td><%# Eval("Birthday") %></td>
							<td><%# Eval("Email") %></td>
						</tr>
					</ItemTemplate>
				</asp:Repeater>
					</table>
				</div>
			</div>


		</ContentTemplate>
	</asp:UpdatePanel>

</asp:Content>

