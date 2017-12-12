using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FSDP.DATA
{
    class ClassDateMetadata
    {
        //public int ClassDateID { get; set; }
        public int StoreClassID { get; set; }

        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        [Display(Name = "Date")]
        public System.DateTime DateTime { get; set; }
        public Nullable<byte> ClassLimit { get; set; }
    }

    [MetadataType(typeof(ClassDateMetadata))]
    public partial class ClassDate
    {
        [Display(Name="Class")]
        public string NameDate { get { return StoreClass.ClassName + " on " + $"{DateTime:d}"; } }
    }
}
