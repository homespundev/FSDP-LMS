//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FSDP.DATA
{
    using System;
    using System.Collections.Generic;
    
    public partial class ClassSignUp
    {
        public int ClassSignUpID { get; set; }
        public int StoreClassID { get; set; }
        public string UserID { get; set; }
        public System.DateTime ClassDate { get; set; }
    
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual StoreClass StoreClass { get; set; }
    }
}
