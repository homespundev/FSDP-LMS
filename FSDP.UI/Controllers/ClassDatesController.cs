using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FSDP.DATA;

namespace FSDP.UI.Controllers
{
    public class ClassDatesController : Controller
    {
        private FSDPDbEntities db = new FSDPDbEntities();

        // GET: ClassDates
        [Authorize(Roles = "Admin, Manager, Employee")]
        public ActionResult Index()
        {
            var classDates = db.ClassDates.Include(c => c.StoreClass);
            return View(classDates.ToList());
        }

        [Authorize(Roles = "Admin, Manager, Employee")]
        // GET: ClassDates/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ClassDate classDate = db.ClassDates.Find(id);
            if (classDate == null)
            {
                return HttpNotFound();
            }
            return View(classDate);
        }

        // GET: ClassDates/Create
        [Authorize(Roles = "Admin, Manager")]
        public ActionResult Create()
        {
            ViewBag.StoreClassID = new SelectList(db.StoreClasses, "StoreClassID", "ClassName");
            return View();
        }

        // POST: ClassDates/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles = "Admin, Manager")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ClassDateID,StoreClassID,DateTime")] ClassDate classDate)
        {
            if (ModelState.IsValid)
            {
                db.ClassDates.Add(classDate);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.StoreClassID = new SelectList(db.StoreClasses, "StoreClassID", "ClassName", classDate.StoreClassID);
            return View(classDate);
        }

        // GET: ClassDates/Edit/5
        [Authorize(Roles = "Admin, Manager")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ClassDate classDate = db.ClassDates.Find(id);
            if (classDate == null)
            {
                return HttpNotFound();
            }
            ViewBag.StoreClassID = new SelectList(db.StoreClasses, "StoreClassID", "ClassName", classDate.StoreClassID);
            return View(classDate);
        }

        // POST: ClassDates/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles = "Admin, Manager")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ClassDateID,StoreClassID,DateTime")] ClassDate classDate)
        {
            if (ModelState.IsValid)
            {
                db.Entry(classDate).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.StoreClassID = new SelectList(db.StoreClasses, "StoreClassID", "ClassName", classDate.StoreClassID);
            return View(classDate);
        }

        // GET: ClassDates/Delete/5
        [Authorize(Roles = "Admin, Manager")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ClassDate classDate = db.ClassDates.Find(id);
            if (classDate == null)
            {
                return HttpNotFound();
            }
            return View(classDate);
        }

        // POST: ClassDates/Delete/5
        [Authorize(Roles = "Admin, Manager")]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ClassDate classDate = db.ClassDates.Find(id);
            db.ClassDates.Remove(classDate);
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
