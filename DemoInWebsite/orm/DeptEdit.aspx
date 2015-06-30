﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Orm.master" AutoEventWireup="true" CodeFile="DeptEdit.aspx.cs" Inherits="orm_DeptEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">


	<h2>Edit Department.</h2>
	
	<div class="row">
		<div class="col-md-6">
			<div class="form-horizontal">
				<div class="form-group">
					<asp:Label runat="server" AssociatedControlID="DeptName" CssClass="col-md-4 control-label">Department Name</asp:Label>
					<div class="col-md-8">
						<asp:TextBox runat="server" ID="DeptName" CssClass="form-control" />
					</div>
				</div>
				<div class="form-group">
					<asp:Label runat="server" AssociatedControlID="Phone" CssClass="col-md-4 control-label">Phone</asp:Label>
					<div class="col-md-8">
						<asp:TextBox runat="server" ID="Phone" CssClass="form-control" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-offset-4 col-md-8">
						<asp:Button ID="SaveButton" runat="server" Text="Save" CssClass="btn btn-default" OnClick="SaveButton_Click" />
					</div>
				</div>
			</div>
		</div>
	 </div>


</asp:Content>

