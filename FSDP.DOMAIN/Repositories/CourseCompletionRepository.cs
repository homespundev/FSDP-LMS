using System.Data.Entity;
using FSDP.DATA;

namespace FSDP.DOMAIN.Repositories
{
    public class CourseCompletionRepository : GenericRepository<CourseCompletion>
    {
        public CourseCompletionRepository(DbContext db) : base(db) { }

    }
}