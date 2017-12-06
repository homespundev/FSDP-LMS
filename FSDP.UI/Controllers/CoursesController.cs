﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FSDP.DATA;
using System.Drawing;
using FSDP.DOMAIN.Services;
using FSDP.DOMAIN.Repositories;

namespace FSDP.UI.Controllers
{
    public class CoursesController : Controller
    {
        private FSDPDbEntities db = new FSDPDbEntities();
        private UnitOfWork uow = new UnitOfWork();

        // GET: Courses
        public ActionResult Index()
        {
            return View(db.Courses.ToList());
        }

        // GET: Courses/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Course course = db.Courses.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }
            return View(course);
        }

        // GET: Courses/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Courses/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CourseID,CourseName,CourseDescription,IsActive,CourseImage")] Course course, HttpPostedFileBase courseImg)
        {
            if (ModelState.IsValid)
            {
                string imageName = "noimage.jpg";
                if (courseImg != null)
                {
                    imageName = courseImg.FileName;
                    string ext = imageName.Substring(imageName.LastIndexOf('.'));
                    string[] goodExts = { ".jpeg", ".jpg", ".png", ".gif" };
                    if (goodExts.Contains(ext.ToLower()))
                    {
                        imageName = Guid.NewGuid() + ext;
                        string pathForTheSaving = Server.MapPath("~/Content/Image/Courses/");
                        courseImg.SaveAs(pathForTheSaving +  imageName);
                        Image convertedImage = Image.FromStream(courseImg.InputStream);
                        int maxImageSize = 500;
                        int maxThumbSize = 100;
                        ImageService.ResizeImage(pathForTheSaving, imageName, convertedImage, maxImageSize, maxThumbSize);
                    }
                }
                else
                {
                    imageName = "noimage.jpg";
                }
                course.CourseImage = imageName;
                uow.CourseRepository.Add(course);
                //db.Courses.Add(course);
                //db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(course);
        }

        // GET: Courses/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Course course = db.Courses.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }
            return View(course);
        }

        // POST: Courses/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CourseID,CourseName,CourseDescription,IsActive,CourseImage")] Course course, HttpPostedFileBase courseImage)
        {
            if (ModelState.IsValid)
            {
                if (courseImage != null)
                {
                    string imageName = courseImage.FileName;
                    string ext = imageName.Substring(imageName.LastIndexOf('.'));
                    string [] goodExts = { ".jpeg", ".jpg", ".png", ".gif" };
                    if (goodExts.Contains(ext.ToLower()))
                    {
                        imageName = Guid.NewGuid() + ext;
                        courseImage.SaveAs(Server.MapPath("~/Content/Image/Courses/" + imageName));
                        course.CourseImage = imageName;
                    }
                }
                uow.CourseRepository.Update(course);
                return RedirectToAction("Index");
            }
            return View(course);
        }

        // GET: Courses/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Course course = db.Courses.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }
            return View(course);
        }

        // POST: Courses/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Course course = db.Courses.Find(id);
            db.Courses.Remove(course);
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
