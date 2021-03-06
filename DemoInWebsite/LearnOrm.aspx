﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="LearnOrm.aspx.cs" Inherits="LearnOrm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">


	<div class="row">
		<div class="col-md-12">
			<h2>Learning the usage of ORM</h2>
			<hr />

			<div class="panel panel-default">
				<div class="panel-body">
					<p>You can get ORM demo <a href="orm/home" target="_blank"><strong style="font-size:150%">here</strong></a>.</p>
				</div>
			</div>
	
			<h4>Insert department</h4>
<pre><code><span style="color:blue;">var</span>&nbsp;data&nbsp;=&nbsp;<span style="color:blue;">new</span>&nbsp;<span style="color:#2b91af;">Department</span>()&nbsp;{&nbsp;DeptName&nbsp;=&nbsp;<span style="color:#a31515;">&quot;HR&quot;</span>,&nbsp;Phone&nbsp;=&nbsp;<span style="color:#a31515;">&quot;000-111-1111&quot;</span>&nbsp;};
<span style="color:green;">// usage 1</span>
data.Insert();
<span style="color:green;">// usage 2</span>
<span style="color:#2b91af;">APBplDef</span>.<span style="color:#2b91af;">DepartmentBpl</span>.Insert(data);
</code></pre>

			<h4>Delete a department</h4>
<pre><code><span style="color:green;">//&nbsp;usage&nbsp;1</span>
<span style="color:#2b91af;">Department</span>.PrimaryDelete(1&nbsp;<span style="color:green;">/*&nbsp;DepartmentId&nbsp;*/</span>);
<span style="color:green;">//&nbsp;usage&nbsp;2</span>
<span style="color:#2b91af;">APBplDef</span>.<span style="color:#2b91af;">DepartmentBpl</span>.PrimaryDelete(1);
</code></pre>

			<h4>Condition delete departments</h4>
			<pre><code><span style="color:green;">//&nbsp;short&nbsp;name</span>
<span style="color:blue;">var</span>&nbsp;t&nbsp;=&nbsp;<span style="color:#2b91af;">APDBDef</span>.Department;
 
<span style="color:green;">//&nbsp;usage&nbsp;1</span>
<span style="color:#2b91af;">Department</span>.ConditionDelete(t.ParentId&nbsp;!=&nbsp;0&nbsp;&amp;&nbsp;t.Phone&nbsp;==&nbsp;<span style="color:#a31515;">&quot;&quot;</span>);
<span style="color:green;">//&nbsp;usage&nbsp;2</span>
<span style="color:#2b91af;">APBplDef</span>.<span style="color:#2b91af;">DepartmentBpl</span>.ConditionDelete(t.ParentId&nbsp;!=&nbsp;0&nbsp;&amp;&nbsp;t.Phone&nbsp;==&nbsp;<span style="color:#a31515;">&quot;&quot;</span>);
</code></pre>

			<h4>Get a department with primary key and update it</h4>
			<pre><code><span style="color:green;">//&nbsp;usage&nbsp;1</span>
<span style="color:blue;">var</span>&nbsp;data&nbsp;=&nbsp;<span style="color:#2b91af;">Department</span>.PrimaryGet(1);
data.Phone&nbsp;=&nbsp;<span style="color:#a31515;">&quot;new&nbsp;phone&quot;</span>;
data.Update();
<span style="color:green;">//&nbsp;usage&nbsp;2</span>
<span style="color:blue;">var</span>&nbsp;data&nbsp;=&nbsp;<span style="color:#2b91af;">APBplDef</span>.<span style="color:#2b91af;">DepartmentBpl</span>.PrimaryGet(1);
data.Phone&nbsp;=&nbsp;<span style="color:#a31515;">&quot;new&nbsp;phone&quot;</span>;
<span style="color:#2b91af;">APBplDef</span>.<span style="color:#2b91af;">DepartmentBpl</span>.Update(data);
</code></pre>

			<h4>Partial update</h4>
			<pre><code><span style="color:green;">//&nbsp;usage&nbsp;1</span>
<span style="color:#2b91af;">Department</span>.UpdatePartial(1,&nbsp;<span style="color:blue;">new</span>&nbsp;{&nbsp;phone&nbsp;=&nbsp;<span style="color:#a31515;">&quot;new&nbsp;phone&quot;</span>&nbsp;});
<span style="color:green;">//&nbsp;usage&nbsp;2</span>
<span style="color:#2b91af;">APBplDef</span>.<span style="color:#2b91af;">DepartmentBpl</span>.UpdatePartial(1,&nbsp;<span style="color:blue;">new</span>&nbsp;{&nbsp;phone&nbsp;=&nbsp;<span style="color:#a31515;">&quot;new&nbsp;phone&quot;</span>&nbsp;});
</code></pre>

			<h4>Condition query and order</h4>
			<pre><code><span style="color:green;">//&nbsp;short&nbsp;name</span>
<span style="color:blue;">var</span>&nbsp;t&nbsp;=&nbsp;<span style="color:#2b91af;">APDBDef</span>.Department;
 
<span style="color:green;">//&nbsp;usage&nbsp;1</span>
<span style="color:#2b91af;">Department</span>.ConditionQuery(t.ParentId&nbsp;!=&nbsp;<span style="color:blue;">null</span>&nbsp;&amp;&nbsp;(t.DeptName&nbsp;==&nbsp;<span style="color:#a31515;">&quot;HR&quot;</span>&nbsp;|&nbsp;t.DeptName&nbsp;==&nbsp;<span style="color:#a31515;">&quot;Sales&quot;</span>),&nbsp;t.DeptName.Desc);
<span style="color:green;">//&nbsp;usage&nbsp;2</span>
<span style="color:#2b91af;">APBplDef</span>.<span style="color:#2b91af;">DepartmentBpl</span>.ConditionQuery(t.ParentId&nbsp;!=&nbsp;<span style="color:blue;">null</span>&nbsp;&amp;&nbsp;(t.DeptName&nbsp;==&nbsp;<span style="color:#a31515;">&quot;HR&quot;</span>&nbsp;|&nbsp;t.DeptName&nbsp;==&nbsp;<span style="color:#a31515;">&quot;Sales&quot;</span>),&nbsp;t.DeptName.Desc);
</code></pre>

			<h4>Paging query</h4>
			<pre><code><span style="color:green;">//&nbsp;short&nbsp;name</span>
<span style="color:blue;">var</span>&nbsp;t&nbsp;=&nbsp;<span style="color:#2b91af;">APDBDef</span>.Department;
 
<span style="color:green;">//&nbsp;usage&nbsp;1</span>
<span style="color:blue;">int</span>&nbsp;total&nbsp;=&nbsp;<span style="color:#2b91af;">Department</span>.ConditionQueryCount(t.ParentId&nbsp;!=&nbsp;0);
<span style="color:blue;">var</span>&nbsp;list&nbsp;=&nbsp;<span style="color:#2b91af;">Department</span>.ConditionQuery(t.ParentId&nbsp;!=&nbsp;0,&nbsp;<span style="color:blue;">null</span>,&nbsp;<span style="color:green;">/*&nbsp;take&nbsp;*/</span>&nbsp;10,&nbsp;<span style="color:green;">/*&nbsp;skip&nbsp;*/</span>&nbsp;10);
<span style="color:green;">//&nbsp;usage&nbsp;2</span>
<span style="color:blue;">int</span>&nbsp;total&nbsp;=&nbsp;<span style="color:#2b91af;">APBplDef</span>.<span style="color:#2b91af;">DepartmentBpl</span>.ConditionQueryCount(t.ParentId&nbsp;!=&nbsp;0);
<span style="color:blue;">var</span>&nbsp;list&nbsp;=&nbsp;<span style="color:#2b91af;">APBplDef</span>.<span style="color:#2b91af;">DepartmentBpl</span>.ConditionQuery(t.ParentId&nbsp;!=&nbsp;0,&nbsp;<span style="color:blue;">null</span>,&nbsp;<span style="color:green;">/*&nbsp;take&nbsp;*/</span>&nbsp;10,&nbsp;<span style="color:green;">/*&nbsp;skip&nbsp;*/</span>&nbsp;10);
</code></pre>


			<h4>Transcation and Dal</h4>
			<pre><code><span style="color:blue;">using</span>&nbsp;(<span style="color:#2b91af;">APDBDef</span>&nbsp;db&nbsp;=&nbsp;<span style="color:blue;">new</span>&nbsp;<span style="color:#2b91af;">APDBDef</span>())
{
	db.BeginTrans();
 
	<span style="color:blue;">try</span>
	{
		db.DepartmentDal.PrimaryDelete(1);
		db.EmployeeDal.ConditionDelete(<span style="color:#2b91af;">APDBDef</span>.Employee.DepartmentId&nbsp;==&nbsp;1);
 
		db.Commit();
	}
	<span style="color:blue;">catch</span>
	{
		db.Rollback();
	}
}
</code></pre>
			<p>&nbsp;</p>


		</div>
	</div>

</asp:Content>

