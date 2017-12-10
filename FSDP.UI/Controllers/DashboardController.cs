using FSDP.DATA;
using FSDP.DOMAIN.Repositories;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FSDP.UI.Models;

namespace FSDP.UI.Controllers
{
    public class DashboardController : Controller
    {
        // GET: Dashboard
        private FSDPDbEntities db = new FSDPDbEntities();
        private UnitOfWork uow = new UnitOfWork();

        [Authorize(Roles = "Admin, Manager, Employee")]
        public ActionResult Index()
        {
            var user = User.Identity.GetUserId();
            var completeUserCourses = db.CourseCompletions.Where(c => c.UserID == user);
            int coursesUserCompletedThisYear = completeUserCourses.Where(y => y.DateCompleted.Year == DateTime.Now.Year).Count();
            ViewBag.UserCompletedThisYear = coursesUserCompletedThisYear;
            ViewBag.CompleteCourses = completeUserCourses.Count();
            ViewBag.lessonsCompleted = db.LessonViews.Where(x => x.UserID == user && x.Lesson.CourseID == 1).Count();
            ViewBag.courseLessons = db.Lessons.Where(x => x.CourseID == 1).Count();
            return View();
        }
    }
}