using System;
using System.Collections.Generic;

namespace DITest.Models
{
    public partial class UserInfo
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public string CardNo { get; set; }
        public string CardNo2 { get; set; }
        public string Position { get; set; }
        public string BoxIds { get; set; }
        public string Counts { get; set; }
        public int? FingerId { get; set; }
        public int? BoxId { get; set; }
        public string PassWord { get; set; }
        public string PhoneNo { get; set; }
        public string MaterialNames { get; set; }
        public string Department { get; set; }
        public string DateTime { get; set; }
    }
}
