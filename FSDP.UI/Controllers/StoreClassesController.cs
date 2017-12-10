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
    public class StoreClassesController : Controller
    {
        private FSDPDbEntities db = new FSDPDbEntities();

        // GET: StoreClasses
        public ActionResult Index()
        {
            return View(db.StoreClasses.ToList());
        }

        // GET: StoreClasses/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            StoreClass storeClass = db.StoreClasses.Find(id);
            if (storeClass == null)
            {
                return HttpNotFound();
            }
            return View(storeClass);
        }

        // GET: StoreClasses/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: StoreClasses/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "StoreClassID,ClassName,ClassDescription")] StoreClass storeClass)
        {
            if (ModelState.IsValid)
            {
                db.StoreClasses.Add(storeClass);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(storeClass);
        }

        // GET: StoreClasses/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            StoreClass storeClass = db.StoreClasses.Find(id);
            if (storeClass == null)
            {
                return HttpNotFound();
            }
            return View(storeClass);
        }

        // POST: StoreClasses/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "StoreClassID,ClassName,ClassDescription")] StoreClass storeClass)
        {
            if (ModelState.IsValid)
            {
                db.Entry(storeClass).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(storeClass);
        }

        // GET: StoreClasses/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            StoreClass storeClass = db.StoreClasses.Find(id);
            if (storeClass == null)
            {
                return HttpNotFound();
            }
            return View(storeClass);
        }

        // POST: StoreClasses/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            StoreClass storeClass = db.StoreClasses.Find(id);
            db.StoreClasses.Remove(storeClass);
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
