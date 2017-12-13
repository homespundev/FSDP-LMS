using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FSDP.DATA
{
    class StoreClassMetadata
    {
        [Display(Name = "Class")]
        public string ClassName { get; set; }
        [Display(Name = "Description")]
        public string ClassDescription { get; set; }
    }

    [MetadataType(typeof(StoreClassMetadata))]
    public partial class StoreClass { }
}
