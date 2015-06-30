<%@ Page Title="" Language="C#" MasterPageFile="~/Orm.master" AutoEventWireup="true" CodeFile="DeptDetails.aspx.cs" Inherits="orm_DeptDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">



	<h2>Details of the Department.</h2>
	
	<div class="row">
		<div class="col-md-6">
			<div class="form-horizontal">
				<div class="form-group">
					<asp:Label runat="server" CssClass="col-md-4 control-label">Department Name</asp:Label>
					<div class="col-md-8">
						<asp:Label runat="server" ID="DeptName" CssClass="form-control" />
					</div>
				</div>
				<div class="form-group">
					<asp:Label runat="server" CssClass="col-md-4 control-label">Phone</asp:Label>
					<div class="col-md-8">
						<asp:Label runat="server" ID="Phone" CssClass="form-control" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-offset-4 col-md-8">
						<asp:Button ID="EditButton" runat="server" Text="Edit" CssClass="btn btn-default" OnClick="EditButton_Click" />
					</div>
				</div>
			</div>
		</div>
	 </div>

</asp:Content>

