using FSDP.DATA;
using FSDP.DOMAIN.Repositories;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FSDP.UI.Controllers
{
    public class DashboardController : Controller
    {
        // GET: Dashboard
        private FSDPDbEntities db = new FSDPDbEntities();
        private UnitOfWork uow = new UnitOfWork();

        public ActionResult Index()
        {
            var user = User.Identity.GetUserId();
            var roles2 = db.AspNetRoles.Where(r => r.Name == "Employee");
                return View();
        }
    }
}