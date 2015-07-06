using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DemoInWebApplication.Startup))]
namespace DemoInWebApplication
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
