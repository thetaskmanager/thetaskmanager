//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace thetaskmanager
{
    using System;
    using System.Collections.Generic;
    
    public partial class Task
    {
        public int id { get; set; }
        public byte userID { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public byte groupID { get; set; }
        public byte typeID { get; set; }
        public System.DateTime date { get; set; }
    
        public virtual TaskGroup TaskGroup { get; set; }
        public virtual TaskType TaskType { get; set; }
        public virtual User User { get; set; }
    }
}
