<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="GettingStarted.aspx.cs" Inherits="GettingStarted" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

   <div class="row">
      <div class="col-md-12">
         <h2>Getting started</h2>
         
         <ol>
            <li><p>Install <strong>APQuery.net Library Package</strong> from <strong>Nuget</strong>. Search as the key "APQuery".</p></li>
            <li><p>Install <strong>APQuery.net Add-in</strong> from <strong>Expanded and updated</strong>. Visual Studio Menu -> Tools -> Expanded and updated. Search as the key "APQuery".</p></li>
            <li>
               <p>Right click contextmenu on <strong>App_Data</strong> folder. Click <strong>Add</strong> -> <strong>SQL Server Database</strong>,</p>
               <img class="wizard" src="~/assets/images/new_db.jpg" runat="server" />
               <p>and create "aspnet-DemoInWebsite" db.</p>
               <img class="wizard" src="~/assets/images/new_db2.jpg" runat="server" />
            </li>
            <li>
               <p>Right click contextmenu on <strong>App_Code</strong> folder. Click <strong>New .apgen file</strong> item.</p>
               <img class="wizard" src="~/assets/images/new_gen_file.jpg" runat="server" />
            </li>
            <li>
               <p>Edit the <strong>Business.apgen</strong> file.</p>
<pre><code><span style="color:blue;">&lt;</span><span style="color:#a31515;">businessModel</span><span style="color:blue;">&nbsp;</span><span style="color:red;">autoSyncDatabase</span><span style="color:blue;">=</span>&quot;<span style="color:blue;">true</span>&quot;<span style="color:blue;">&nbsp;</span><span style="color:red;">autoInitDatabase</span><span style="color:blue;">=</span>&quot;<span style="color:blue;">false</span>&quot;<span style="color:blue;">&gt;</span>
  <span style="color:blue;">&lt;</span><span style="color:#a31515;">provider</span>
    <span style="color:red;">name</span><span style="color:blue;">=</span>&quot;<span style="color:blue;">DefaultAPDalProvider</span>&quot;
    <span style="color:red;">type</span><span style="color:blue;">=</span>&quot;<span style="color:blue;">Symber.Web.Data.SqlAPDalProvider</span>&quot;
    <span style="color:red;">connectionString</span><span style="color:blue;">=</span>&quot;<span style="color:blue;">Data&nbsp;Source=(LocalDb)\v11.0;Initial&nbsp;Catalog=aspnet-DemoInWebsite;AttachDbFilename=|DataDirectory|\aspnet-DemoInWebsite.mdf;Integrated&nbsp;Security=SSPI</span>&quot;
    <span style="color:red;">providerName</span><span style="color:blue;">=</span>&quot;<span style="color:blue;">System.Data.SqlClient</span>&quot;<span style="color:blue;">/&gt;</span>
</code></pre>
               <p>Set the <code>autoSyncDatabase</code> is true, to allow APQuery.net automatic synchronization database structure.</p>
               <p>Set the <code>connectionString</code> above.</p>
            </li>
            <li>
               <p>Edit the <strong>Global.asax</strong> file.</p>
<pre><code><span style="color:blue;">void</span>&nbsp;Application_Start(<span style="color:blue;">object</span>&nbsp;sender,&nbsp;<span style="color:#2b91af;">EventArgs</span>&nbsp;e)
{
   <span style="color:#2b91af;">APGenManager</span>.SyncAndInitData();
   
   <span style="color:#2b91af;">RouteConfig</span>.RegisterRoutes(<span style="color:#2b91af;">RouteTable</span>.Routes);
   <span style="color:#2b91af;">BundleConfig</span>.RegisterBundles(<span style="color:#2b91af;">BundleTable</span>.Bundles);
}</code></pre>
               <p>Add <code>APGenManager.SyncAndInitData()</code>, the method will synchronization and initiazation database when the project running.</p>
            </li>
            <li>
               <p>OK! Let's start to run the project, then we look at the database.</p>
               <img class="wizard" src="~/assets/images/syncdb.jpg" runat="server" />
               <p>We can see, the APQuery.net synchronize the database structure depend on the <strong>Business.apgen</strong> file.</p>
            </li>
            <li>
               <p>Edit the <strong>Business.apgen</strong> file.</p>
<pre><code><span style="color:blue;">&lt;</span><span style="color:#a31515;">businessModel</span><span style="color:blue;">&nbsp;</span><span style="color:red;">autoSyncDatabase</span><span style="color:blue;">=</span>&quot;<span style="color:blue;">true</span>&quot;<span style="color:blue;">&nbsp;</span><span style="color:red;">autoInitDatabase</span><span style="color:blue;">=</span>&quot;<span style="color:blue;">true</span>&quot;<span style="color:blue;">&gt;</span>
</code></pre>
               <p>Set the <code>autoInitDatabase</code> is true, to allow APQuery.net automatic initialize database records.</p>
            </li>
            <li>
               <p>Add a <strong>APDalDef.init.cs</strong> file in <strong>App_code</strong> folder to initialize database records from demo.</p>
<pre><code><span style="color:blue;">public</span>&nbsp;<span style="color:blue;">partial</span>&nbsp;<span style="color:blue;">class</span>&nbsp;<span style="color:#2b91af;">DepartmentDal</span>&nbsp;:&nbsp;<span style="color:#2b91af;">DepartmentDalBase</span>
{
   <span style="color:blue;">public</span>&nbsp;<span style="color:blue;">override</span>&nbsp;<span style="color:#2b91af;">List</span>&lt;<span style="color:#2b91af;">Department</span>&gt;&nbsp;GetInitData()
   {
      <span style="color:#2b91af;">List</span>&lt;<span style="color:#2b91af;">Department</span>&gt;&nbsp;list&nbsp;=&nbsp;<span style="color:blue;">new</span>&nbsp;<span style="color:#2b91af;">List</span>&lt;<span style="color:#2b91af;">Department</span>&gt;();
 
      <span style="color:blue;">for</span>&nbsp;(<span style="color:blue;">int</span>&nbsp;i&nbsp;=&nbsp;1;&nbsp;i&nbsp;&lt;=&nbsp;5;&nbsp;i++)
      {
         list.Add(<span style="color:blue;">new</span>&nbsp;<span style="color:#2b91af;">Department</span>(){
            DepartmentId&nbsp;=&nbsp;i,
            ParentId&nbsp;=&nbsp;0,
            DeptName&nbsp;=&nbsp;<span style="color:#2b91af;">String</span>.Format(<span style="color:#a31515;">&quot;MainDept-{0:D2}&quot;</span>,&nbsp;i),
            Phone&nbsp;=&nbsp;<span style="color:#2b91af;">String</span>.Format(<span style="color:#a31515;">&quot;000-000-{0:D4}&quot;</span>,&nbsp;i)
         });
      }
 
      <span style="color:blue;">for</span>&nbsp;(<span style="color:blue;">int</span>&nbsp;i&nbsp;=&nbsp;11;&nbsp;i&nbsp;&lt;=&nbsp;50;&nbsp;i++)
      {
         list.Add(<span style="color:blue;">new</span>&nbsp;<span style="color:#2b91af;">Department</span>()
         {
            DepartmentId&nbsp;=&nbsp;i,
            ParentId&nbsp;=&nbsp;1,
            DeptName&nbsp;=&nbsp;<span style="color:#2b91af;">String</span>.Format(<span style="color:#a31515;">&quot;SubDept-{0:D2}&quot;</span>,&nbsp;i),
            Phone&nbsp;=&nbsp;<span style="color:#2b91af;">String</span>.Format(<span style="color:#a31515;">&quot;000-000-{0:D4}&quot;</span>,&nbsp;i)
         });
      }
 
      <span style="color:blue;">return</span>&nbsp;list;
   }</code></pre>
            </li>
            <li>
               <p>OK! Let's start to run the project again, then we can see the records already exists.</p>
               <img class="wizard" src="~/assets/images/initdb.jpg" runat="server" />
            </li>
				<li>
					Nice, Let's begin to learning more. Please view <a href="LearnOrm">Learning the usage of ORM</a> and <a href="LearnSQLExpression">Learning the usage of SQLExpression</a>.
				</li>
         </ol>

      </div>
 
   </div>

</asp:Content>

