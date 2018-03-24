using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(alibabu.Startup))]
namespace alibabu
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
