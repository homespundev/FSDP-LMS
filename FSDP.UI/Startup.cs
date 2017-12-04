using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(FSDP.UI.Startup))]
namespace FSDP.UI
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
