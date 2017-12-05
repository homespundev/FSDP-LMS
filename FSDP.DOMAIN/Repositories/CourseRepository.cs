using System.Data.Entity;
using FSDP.DATA;

namespace FSDP.DOMAIN.Repositories
{
    public class CourseRepository : GenericRepository<Course>
    {
        public CourseRepository(DbContext db) : base(db) { }

    }
}