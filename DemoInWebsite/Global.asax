<%@ Application Language="C#" %>
<%@ Import Namespace="DemoInWebsite" %>
<%@ Import Namespace="System.Web.Optimization" %>
<%@ Import Namespace="System.Web.Routing" %>
<%@ Import Namespace="Symber.Web.Compilation" %>

<script runat="server">

void Application_Start(object sender, EventArgs e)
{
	APGenManager.SyncAndInitData();
		
	RouteConfig.RegisterRoutes(RouteTable.Routes);
	BundleConfig.RegisterBundles(BundleTable.Bundles);
}

</script>
