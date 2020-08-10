using System;
using System.Collections.Generic;

namespace DITest.Models
{
    public partial class OpenBoxRecord
    {
        public int Id { get; set; }
        public string CabinetNo { get; set; }
        public int BoxId { get; set; }
        public string BindUserName { get; set; }
        public string BindObject { get; set; }
        public string OpenTarget { get; set; }
        public string DateTime { get; set; }
        public int Count { get; set; }
    }
}
