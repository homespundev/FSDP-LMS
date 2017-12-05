using System.Data.Entity;
using FSDP.DATA;

namespace FSDP.DOMAIN.Repositories
{
    public class LessonRepository : GenericRepository<Lesson>
    {
        public LessonRepository(DbContext db) : base(db) { }

    }
}