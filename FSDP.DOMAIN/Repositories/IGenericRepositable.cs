using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FSDP.DOMAIN.Repositories
{
    public interface IGenericRepositable<TEntity> where TEntity : class
    {
        List<TEntity> Get(string includeProperties = "");
        TEntity Find(object id);
        void Add(TEntity entity);
        void Update(TEntity entity);
        void Remove(TEntity entity);
        void Remove(object id);
    }
}
