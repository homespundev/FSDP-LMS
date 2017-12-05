using FSDP.DATA;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FSDP.DOMAIN.Repositories
{
    public interface IUnitofWork : IDisposable
    {
        CourseRepository CourseRepository { get; }
        CourseCompletionRepository CourseCompletionRepository { get;}
        LessonRepository LessonRepository { get;}
        LessonViewRepository LessonViewRepository { get; }
        void Save();
    }

    public class UnitOfWork : IUnitofWork
    {
        internal FSDPDbEntities context = new FSDPDbEntities();
        private CourseRepository _courseRepository;
        public CourseRepository CourseRepository
        {
            get
            {
                if (this._courseRepository == null)
                {
                    this._courseRepository = new CourseRepository(context);
                }
                return _courseRepository;
            }
        }
        private CourseCompletionRepository _courseCompletionRepository;
        public CourseCompletionRepository CourseCompletionRepository
        {
            get
            {
                if (this._courseCompletionRepository == null)
                {
                    this._courseCompletionRepository = new CourseCompletionRepository(context);
                }
                return _courseCompletionRepository;
            }
        }
        private LessonRepository _lessonRepository;
        public LessonRepository LessonRepository
        {
            get
            {
                if (this._lessonRepository == null)
                {
                    this._lessonRepository = new LessonRepository(context);
                }
                return _lessonRepository;
            }
        }
        private LessonViewRepository _lessonViewRepository;
        public LessonViewRepository LessonViewRepository
        {
            get
            {
                if (this._lessonViewRepository == null)
                {
                    this._lessonViewRepository = new LessonViewRepository(context);
                }
                return _lessonViewRepository;
            }
        }

        private bool disposed = false;
        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    context.Dispose();
                }
            }
            this.disposed = true;
        }
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }


        public void Save()
        {
            context.SaveChanges();
        }

    }
}
