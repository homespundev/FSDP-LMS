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
using FSDP.UI.Models;

namespace FSDP.UI.Controllers
{
    public class LessonsController : Controller
    {
        private FSDPDbEntities db = new FSDPDbEntities();
        // GET: Lessons
        [Authorize(Roles = "Admin, Manager, Employee")]
        public ActionResult Index()
        {
            var lessons = db.Lessons.Include(l => l.Courses);
            return View(lessons.ToList());
        }

        // GET: Lessons/Details/5
        [HttpGet]
        [Authorize(Roles = "Admin, Manager, Employee")]
        public ActionResult Details(int? id)
        {
            Lesson lesson = db.Lessons.Find(id);

            if (lesson.VideoUrl != null)
            {

                var CompleteYouTubeURL = lesson.VideoUrl;
                var v = CompleteYouTubeURL.IndexOf("v=");
                var amp = CompleteYouTubeURL.IndexOf("&", v);
                string vid;
                // if the video id is the last value in the url
                if (amp == -1)
                {
                    vid = CompleteYouTubeURL.Substring(v + 2);
                    // if there are other parameters after the video id in the url
                }
                else
                {
                    vid = CompleteYouTubeURL.Substring(v + 2, amp - (v + 2));
                }
                ViewBag.VideoID = vid;
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            if (lesson == null)
            {
                return HttpNotFound();
            }
            //if (User.IsInRole("Employee"))
            //{
            //    string userID = User.Identity.GetUserId();
            //    var lessonViews = db.LessonViews.Where(x => x.LessonID == id && x.UserID == userID && x.Lesson.IsActive);
            //    int lessonViewsCount = lessonViews.Count();
            //    if (lessonViewsCount == 0)
            //    {
            //        LessonView lessonView = new LessonView()
            //        {
            //            UserID = userID,
            //            LessonID = (int)id,
            //            DateViewed = DateTime.Now
            //        };
            //        db.LessonViews.Add(lessonView);
            //        db.SaveChanges();
            //        var courseCompletion = db.CourseCompletions.Where(x => x.UserID == userID && x.CourseID == lesson.CourseID);
            //        if (courseCompletion.Count() == 0)
            //        {
            //            var lessonsCompleted = db.LessonViews.Where(x => x.UserID == userID && x.Lesson.CourseID == lesson.CourseID).Count();
            //            var courseLessons = db.Lessons.Where(x => x.CourseID == lesson.CourseID).Count();
            //            if (lessonsCompleted == courseLessons)
            //            {
            //                CourseCompletion userCourseCompletion = new CourseCompletion()
            //                {
            //                    UserID = userID,
            //                    CourseID = lesson.CourseID,
            //                    DateCompleted = DateTime.Now
            //                };
            //                db.CourseCompletions.Add(userCourseCompletion);
            //                db.SaveChanges();
            //            }
            //        }

            //    }

            //}
            return View(lesson);
        }

        [HttpPost]
        [Authorize(Roles = "Admin, Manager, Employee")]
        public ActionResult Details(int? id, string txtAnswer)
        {
            Lesson lesson = db.Lessons.Find(id);
            string userAnswer = Convert.ToString(txtAnswer);
            if (userAnswer == lesson.QuizAnswer)
            {
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

                return new JavaScriptResult { Script = "alert('You answered correctly and have completed this lesson!');" };
            }
            else
            {
                return new JavaScriptResult { Script = "alert('You did not answer correctly. Please try again.');" };
            }
        }



        //[Authorize(Roles = "Admin, Manager, Employee")]
        //public ActionResult Quiz(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Quiz quiz = db.Quizs.Find(id);
        //    if (quiz == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(quiz);
        //}

        //[HttpPost]
        //[Authorize(Roles = "Admin, Manager, Employee")]
        //public ActionResult Quiz(int? id, string userAnswer)
        //{
        //    Quiz quiz = db.Quizs.Find(id);
        //    Lesson lesson = (from l in db.Lessons join lq in db.Lessons. );
        //    string strName = Convert.ToString(userAnswer);
        //    if (strName == quiz.CorrectAnswer)
        //    {
        //        if (User.IsInRole("Employee"))
        //        {
        //            string userID = User.Identity.GetUserId();
        //            var lessonViews = db.LessonViews.Where(x => x.LessonID == id && x.UserID == userID && x.Lesson.IsActive);
        //            int lessonViewsCount = lessonViews.Count();
        //            if (lessonViewsCount == 0)
        //            {
        //                LessonView lessonView = new LessonView()
        //                {
        //                    UserID = userID,
        //                    LessonID = (int)id,
        //                    DateViewed = DateTime.Now
        //                };
        //                db.LessonViews.Add(lessonView);
        //                db.SaveChanges();
        //                var courseCompletion = db.CourseCompletions.Where(x => x.UserID == userID && x.CourseID == lesson.CourseID);
        //                if (courseCompletion.Count() == 0)
        //                {
        //                    var lessonsCompleted = db.LessonViews.Where(x => x.UserID == userID && x.Lesson.CourseID == lesson.CourseID).Count();
        //                    var courseLessons = db.Lessons.Where(x => x.CourseID == lesson.CourseID).Count();
        //                    if (lessonsCompleted == courseLessons)
        //                    {
        //                        CourseCompletion userCourseCompletion = new CourseCompletion()
        //                        {
        //                            UserID = userID,
        //                            CourseID = lesson.CourseID,
        //                            DateCompleted = DateTime.Now
        //                        };
        //                        db.CourseCompletions.Add(userCourseCompletion);
        //                        db.SaveChanges();
        //                    }
        //                }

        //            }

        //        }
        //    }
        //}
        // GET: Lessons/Create
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "CourseName");
            return View();
        }

        // POST: Lessons/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LessonID,LessonTitle,CourseID,Introduction,VideoUrl,PdfFileName,IsActive,LessonImage,QuizQuestion,QuizAnswer")] Lesson lesson, HttpPostedFileBase lessonPdf)
        {
            if (ModelState.IsValid)
            {
                string pdfName = "nopdf.pdf";
                if (lessonPdf != null)
                {
                    string ext = pdfName.Substring(pdfName.LastIndexOf('.'));
                    string goodExt = ".pdf";
                    if (goodExt.Contains(ext.ToLower()))
                    {
                        pdfName = Guid.NewGuid() + ext;
                        string pathForTheSaving = Server.MapPath("~/Content/Lessons/Pdf/");
                        lessonPdf.SaveAs(pathForTheSaving + pdfName);
                    }
                }
                else
                {
                    pdfName = "nopdf.pdf";
                }
                lesson.PdfFileName = pdfName;
                db.Lessons.Add(lesson);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "CourseName", lesson.CourseID);
            return View(lesson);
        }

        // GET: Lessons/Edit/5
        [Authorize(Roles = "Admin")]
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
        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LessonID,LessonTitle,CourseID,Introduction,VideoUrl,PdfFileName,IsActive,LessonImage,QuizQuestion,QuizAnswer")] Lesson lesson, HttpPostedFileBase lessonPdf)
        {
            if (ModelState.IsValid)
            {
                if (lessonPdf != null)
                {
                    string pdfName = lessonPdf.FileName;
                    string ext = pdfName.Substring(pdfName.LastIndexOf('.'));
                    string goodExt = ".pdf";
                    if (goodExt.Contains(ext.ToLower()))
                    {
                        pdfName = Guid.NewGuid() + ext;
                        lessonPdf.SaveAs(Server.MapPath("~/Content/Lessons/Pdf/" + pdfName));
                        lesson.PdfFileName = pdfName;
                    }
                }
                db.Entry(lesson).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "CourseName", lesson.CourseID);
            return View(lesson);
        }

        // GET: Lessons/Delete/5
        [Authorize(Roles = "Admin")]
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
        [Authorize(Roles = "Admin")]
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
