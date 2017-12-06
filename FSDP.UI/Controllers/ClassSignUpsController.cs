﻿using System;
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
    public class ClassSignUpsController : Controller
    {
        private FSDPDbEntities db = new FSDPDbEntities();

        // GET: ClassSignUps
        public ActionResult Index()
        {
            var classSignUps = db.ClassSignUps.Include(c => c.AspNetUser).Include(c => c.StoreClass);
            return View(classSignUps.ToList());
        }

        // GET: ClassSignUps/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ClassSignUp classSignUp = db.ClassSignUps.Find(id);
            if (classSignUp == null)
            {
                return HttpNotFound();
            }
            return View(classSignUp);
        }

        // GET: ClassSignUps/Create
        public ActionResult Create()
        {
            ViewBag.UserID = new SelectList(db.AspNetUsers, "Id", "FirstName");
            ViewBag.StoreClassID = new SelectList(db.StoreClasses, "StoreClassID", "ClassName");
            return View();
        }

        // POST: ClassSignUps/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ClassSignUpID,StoreClassID,UserID,ClassDate")] ClassSignUp classSignUp)
        {
            if (ModelState.IsValid)
            {
                db.ClassSignUps.Add(classSignUp);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.UserID = new SelectList(db.AspNetUsers, "Id", "FirstName", classSignUp.UserID);
            ViewBag.StoreClassID = new SelectList(db.StoreClasses, "StoreClassID", "ClassName", classSignUp.StoreClassID);
            return View(classSignUp);
        }

        // GET: ClassSignUps/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ClassSignUp classSignUp = db.ClassSignUps.Find(id);
            if (classSignUp == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserID = new SelectList(db.AspNetUsers, "Id", "FirstName", classSignUp.UserID);
            ViewBag.StoreClassID = new SelectList(db.StoreClasses, "StoreClassID", "ClassName", classSignUp.StoreClassID);
            return View(classSignUp);
        }

        // POST: ClassSignUps/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ClassSignUpID,StoreClassID,UserID,ClassDate")] ClassSignUp classSignUp)
        {
            if (ModelState.IsValid)
            {
                db.Entry(classSignUp).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserID = new SelectList(db.AspNetUsers, "Id", "FirstName", classSignUp.UserID);
            ViewBag.StoreClassID = new SelectList(db.StoreClasses, "StoreClassID", "ClassName", classSignUp.StoreClassID);
            return View(classSignUp);
        }

        // GET: ClassSignUps/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ClassSignUp classSignUp = db.ClassSignUps.Find(id);
            if (classSignUp == null)
            {
                return HttpNotFound();
            }
            return View(classSignUp);
        }

        // POST: ClassSignUps/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ClassSignUp classSignUp = db.ClassSignUps.Find(id);
            db.ClassSignUps.Remove(classSignUp);
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