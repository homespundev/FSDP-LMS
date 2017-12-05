using System.Data.Entity;
using FSDP.DATA;

namespace FSDP.DOMAIN.Repositories
{
    public class LessonViewRepository : GenericRepository<LessonView>
    {
        public LessonViewRepository(DbContext db) : base(db) { }

    }
}