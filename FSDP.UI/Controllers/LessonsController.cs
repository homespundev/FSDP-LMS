﻿using System;
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
    public class LessonsController : Controller
    {
        private FSDPDbEntities db = new FSDPDbEntities();

        // GET: Lessons
        public ActionResult Index()
        {
            var lessons = db.Lessons.Include(l => l.Cours);
            return View(lessons.ToList());
        }

        // GET: Lessons/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lesson lesson = db.Lessons.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }
            if (User.IsInRole("Employee"))
            {
                string userID = User.Identity.GetUserId();
                var lessonViews = db.LessonViews.Where(x => x.LessonID == id && x.UserID == userID && x.Lesson.IsActive);
                int lessonViewsCount = lessonViews.Count();
                if (lessonViewsCount == 0)
                {
                    LessonView lessonView = new LessonView()
                    {
                        UserID = userID,
                        LessonID = (int)id,
                        DateViewed = DateTime.Now
                    };
                    db.LessonViews.Add(lessonView);
                    db.SaveChanges();
                    var courseCompletion = db.CourseCompletions.Where(x => x.UserID == userID && x.CourseID == lesson.CourseID);
                    if (courseCompletion.Count() == 0)
                    {
                        var lessonsCompleted = db.LessonViews.Where(x => x.UserID == userID && x.Lesson.CourseID == lesson.CourseID).Count();
                        var courseLessons = db.Lessons.Where(x => x.CourseID == lesson.CourseID).Count();
                        if (lessonsCompleted == courseLessons)
                        {
                            CourseCompletion userCourseCompletion = new CourseCompletion()
                            {
                                UserID = userID,
                                CourseID = lesson.CourseID,
                                DateCompleted = DateTime.Now
                            };
                            db.CourseCompletions.Add(userCourseCompletion);
                            db.SaveChanges();
                        }
                    }
                    
                }
               
            }
            return View(lesson);
        }

        public ActionResult Quiz(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Quiz quiz = db.Quizs.Find(id);
            if (quiz == null)
            {
                return HttpNotFound();
            }
            return View(quiz);
        }
        // GET: Lessons/Create
        public ActionResult Create()
        {
            ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "CourseName");
            return View();
        }

        // POST: Lessons/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LessonID,LessonTitle,CourseID,Introduction,VideoUrl,PdfFileName,IsActive,LessonImage")] Lesson lesson)
        {
            if (ModelState.IsValid)
            {
                db.Lessons.Add(lesson);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "CourseName", lesson.CourseID);
            return View(lesson);
        }

        // GET: Lessons/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lesson lesson = db.Lessons.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }
            ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "CourseName", lesson.CourseID);
            return View(lesson);
        }

        // POST: Lessons/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LessonID,LessonTitle,CourseID,Introduction,VideoUrl,PdfFileName,IsActive,LessonImage")] Lesson lesson)
        {
            if (ModelState.IsValid)
            {
                db.Entry(lesson).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "CourseName", lesson.CourseID);
            return View(lesson);
        }

        // GET: Lessons/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lesson lesson = db.Lessons.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }
            return View(lesson);
        }

        // POST: Lessons/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Lesson lesson = db.Lessons.Find(id);
            db.Lessons.Remove(lesson);
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
