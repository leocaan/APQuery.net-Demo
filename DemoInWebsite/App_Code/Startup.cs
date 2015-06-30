using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DemoInWebsite.Startup))]
namespace DemoInWebsite
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
