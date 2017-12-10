using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FSDP.DATA
{
    class LessonMetadata
    {
        [Required(ErrorMessage ="* Required")]
        [Display(Name ="Title")]
        [StringLength(200, ErrorMessage ="* Not to exceed 200 characters")]
        public string LessonTitle { get; set; }

        [Required(ErrorMessage = "* Required")]
        [Display(Name ="Course ID")]
        public int CourseID { get; set; }

        [DisplayFormat(NullDisplayText = "N/A")]
        [StringLength(300, ErrorMessage ="* Not to exceed 300 characters")]
        public string Introduction { get; set; }

        [DisplayFormat(NullDisplayText = "N/A")]
        [StringLength(250, ErrorMessage = "* Not to exceed 250 characters")]
        [Display(Name = "Video URL")]
        public string VideoUrl { get; set; }

        [DisplayFormat(NullDisplayText = "N/A")]
        [StringLength(100, ErrorMessage = "* Not to exceed 100 characters")]
        [Display(Name = "PDF File Name")]
        public string PdfFileName { get; set; }

        [Display(Name = "Active?")]
        public bool IsActive { get; set; }

        [DisplayFormat(NullDisplayText = "N/A")]
        [Display(Name = "Image")]
        public string LessonImage { get; set; }

        [Display(Name ="Quiz Question")]
        [StringLength(300, ErrorMessage = "* Not to exceed 300 characters")]
        public string QuizQuestion { get; set; }

        [Display(Name = "Quiz Question")]
        [StringLength(50, ErrorMessage = "* Not to exceed 50 characters")]
        public string QuizAnswer { get; set; }
    }
}
