using System;
using System.Collections.Generic;

namespace DITest.Models
{
    public partial class MaterialInventory
    {
        public int Id { get; set; }
        public int MaterialId { get; set; }
        public string MaterialName { get; set; }
        public string MaterialNum { get; set; }
        public string InternalFileNo { get; set; }
        public string AssetNo { get; set; }
        public string Remarks { get; set; }
        public int? Count { get; set; }
        public int? BoxId { get; set; }
        public int? CabinetId { get; set; }

        public virtual Material Material { get; set; }
    }
}
