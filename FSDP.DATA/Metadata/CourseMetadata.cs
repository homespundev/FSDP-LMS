using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FSDP.DATA
{
    class CourseMetadata
    {
        [Required(ErrorMessage = "* Required")]
        [StringLength(200, ErrorMessage = "* Not to exceed 200 characters")]
        [Display(Name = "Course")]
        public string CourseName { get; set; }

        [DisplayFormat(NullDisplayText = "N/A")]
        [UIHint("MultilineText")]
        [Display(Name = "Description")]
        [StringLength(500, ErrorMessage = "* Not to exceed 500 characters")]
        public string CourseDescription { get; set; }

        [Display(Name = "Active?")]
        public bool IsActive { get; set; }

        [DisplayFormat(NullDisplayText = "N/A")]
        public string CourseImage { get; set; }
    }

    [MetadataType(typeof(CourseMetadata))]
    public partial class Course { }
}
