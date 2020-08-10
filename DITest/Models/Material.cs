using System;
using System.Collections.Generic;

namespace DITest.Models
{
    public partial class Material
    {
        public Material()
        {
            MaterialInventoryTable = new HashSet<MaterialInventory>();
        }

        public int Id { get; set; }
        public string MaterialName { get; set; }
        public string MaterialNum { get; set; }
        public string ItemNum { get; set; }
        public string Type { get; set; }
        public int? Count { get; set; }

        public virtual ICollection<MaterialInventory> MaterialInventoryTable { get; set; }
    }
}
