using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FSDP.DATA;
using Microsoft.AspNet.Identity;

namespace FSDP.UI.Controllers
{
    public class LessonViewsController : Controller
    {
        private FSDPDbEntities db = new FSDPDbEntities();

        // GET: LessonViews
        [Authorize(Roles = "Admin, Manager, Employee")]
        public ActionResult Index()
        {
            var userID = User.Identity.GetUserId();
            var lessonViews = db.LessonViews.Include(l => l.AspNetUser).Include(l => l.Lesson);
            if (User.IsInRole("Employee"))
            {
                lessonViews = db.LessonViews.Include(l => l.AspNetUser).Include(l => l.Lesson)
                    .Where(x => x.UserID == userID);
            }
            
            return View(lessonViews.ToList());
        }

        // GET: LessonViews/Details/5
        [Authorize(Roles = "Admin, Manager, Employee")]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LessonView lessonView = db.LessonViews.Find(id);
            if (lessonView == null)
            {
                return HttpNotFound();
            }
            if (User.IsInRole("Employee"))
            {
                var userId = User.Identity.GetUserId();
                if (userId == lessonView.UserID)
                {
                    return View(lessonView);
                }
                else
                {
                    return RedirectToAction("Index");
                }
            }
            return View(lessonView);
        }

        // GET: LessonViews/Create

        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            ViewBag.UserID = new SelectList(db.AspNetUsers, "Id", "FirstName");
            ViewBag.LessonID = new SelectList(db.Lessons, "LessonID", "LessonTitle");
            return View();
        }

        // POST: LessonViews/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LessonViewID,UserID,LessonID,DateViewed")] LessonView lessonView)
        {
            if (ModelState.IsValid)
            {
                db.LessonViews.Add(lessonView);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.UserID = new SelectList(db.AspNetUsers, "Id", "FirstName", lessonView.UserID);
            ViewBag.LessonID = new SelectList(db.Lessons, "LessonID", "LessonTitle", lessonView.LessonID);
            return View(lessonView);
        }

        // GET: LessonViews/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LessonView lessonView = db.LessonViews.Find(id);
            if (lessonView == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserID = new SelectList(db.AspNetUsers, "Id", "FirstName", lessonView.UserID);
            ViewBag.LessonID = new SelectList(db.Lessons, "LessonID", "LessonTitle", lessonView.LessonID);
            return View(lessonView);
        }

        // POST: LessonViews/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LessonViewID,UserID,LessonID,DateViewed")] LessonView lessonView)
        {
            if (ModelState.IsValid)
            {
                db.Entry(lessonView).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserID = new SelectList(db.AspNetUsers, "Id", "FirstName", lessonView.UserID);
            ViewBag.LessonID = new SelectList(db.Lessons, "LessonID", "LessonTitle", lessonView.LessonID);
            return View(lessonView);
        }

        // GET: LessonViews/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LessonView lessonView = db.LessonViews.Find(id);
            if (lessonView == null)
            {
                return HttpNotFound();
            }
            return View(lessonView);
        }

        // POST: LessonViews/Delete/5
        [Authorize(Roles = "Admin")]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LessonView lessonView = db.LessonViews.Find(id);
            db.LessonViews.Remove(lessonView);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
