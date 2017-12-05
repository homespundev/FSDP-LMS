using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FSDP.DATA;
using System.Data.Entity;
using System.Linq.Expressions;
using LinqKit;

namespace FSDP.DOMAIN.Repositories
{
    public class GenericRepository<TEntity> : IGenericRepository<TEntity> where TEntity : class
    {
        internal DbContext db;
        public GenericRepository(DbContext context)
        {
            this.db = context;
        }
        public virtual List<TEntity> Get(string includeProperties = "")
        {
            IQueryable<TEntity> query = db.Set<TEntity>();

            foreach (var prop in includeProperties.Split
            (new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries))
            {
                query = query.Include(prop);
            }
            return query.ToList();
        }

        public TEntity Find(object id)
        {
            return db.Set<TEntity>().Find(id);
        }

        public void Add(TEntity entity)
        {
            db.Set<TEntity>().Add(entity);
            db.SaveChanges();
        }

        public void Update(TEntity entity)
        {
            db.Entry(entity).State = EntityState.Modified;
            db.SaveChanges();
        }

        public void Remove(TEntity entity)
        {
            db.Set<TEntity>().Remove(entity);
            db.SaveChanges();
        }
        public void Remove(object id)
        {
            var entity = db.Set<TEntity>().Find(id);
            Remove(entity);
        }
        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    db.Dispose();
                }
            }
            this.disposed = true;
        }

        //method we added to satisfy our interface implementation(IGenericRepository)


        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        public int CountRecords()
        {
            return Get().Count();
        }

        public IQueryable<TEntity> Search(Expression<Func<TEntity, bool>> predicate)
        {
            return db.Set<TEntity>().AsExpandable().Where(predicate);
        }
    }
}
