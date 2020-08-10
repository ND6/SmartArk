using System;
using System.Collections.Generic;

namespace DITest.Models
{
    public partial class Faceprint
    {
        public int Id { get; set; }
        public long Faceid { get; set; }
        public int Userid { get; set; }
    }
}
