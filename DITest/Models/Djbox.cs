using System;
using System.Collections.Generic;

namespace DITest.Models
{
    public partial class Djbox
    {
        public int Id { get; set; }
        public int CabinetId { get; set; }
        public int BoxId { get; set; }
        public string BoxType { get; set; }
        public string IsLocked { get; set; }
        public string IsBind { get; set; }
        public string IsLongBind { get; set; }
        public string IsSnapBind { get; set; }
        public string IsFree { get; set; }
        public string BindFeature { get; set; }
        public string BindObject { get; set; }
        public string BindObjectFormat { get; set; }
        public string BindObjectProof { get; set; }
        public string BindUserName { get; set; }
        public string Remarks { get; set; }
        public int Count { get; set; }
    }
}
