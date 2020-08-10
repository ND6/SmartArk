using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace DITest.Models
{
    public partial class ClientDBContext : DbContext
    {
        public ClientDBContext()
        {
        }

        public ClientDBContext(DbContextOptions<ClientDBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Djbox> DjboxTable { get; set; }
        public virtual DbSet<Djcabinet> DjcabinetTable { get; set; }
        public virtual DbSet<Djcard> DjcardTable { get; set; }
        public virtual DbSet<Faceprint> FaceTable { get; set; }
        public virtual DbSet<MaterialInventory> MaterialInventoryTable { get; set; }
        public virtual DbSet<Material> MaterialTable { get; set; }
        public virtual DbSet<OpenBoxRecord> OpenBoxRecordTable { get; set; }
        public virtual DbSet<UserInfo> UserInfoTable { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=192.168.10.171;Database=STD_DB;User Id=sa;Password=123456;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Djbox>(entity =>
            {
                entity.ToTable("DJBoxTable");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.BindFeature)
                    .HasColumnName("bindFeature")
                    .HasMaxLength(50);

                entity.Property(e => e.BindObject)
                    .HasColumnName("bindObject")
                    .HasMaxLength(50);

                entity.Property(e => e.BindObjectFormat)
                    .HasColumnName("bindObjectFormat")
                    .HasMaxLength(50);

                entity.Property(e => e.BindObjectProof)
                    .HasColumnName("bindObjectProof")
                    .HasMaxLength(50);

                entity.Property(e => e.BindUserName)
                    .HasColumnName("bindUserName")
                    .HasMaxLength(50);

                entity.Property(e => e.BoxId).HasColumnName("boxId");

                entity.Property(e => e.BoxType)
                    .HasColumnName("boxType")
                    .HasMaxLength(10);

                entity.Property(e => e.CabinetId).HasColumnName("cabinetId");

                entity.Property(e => e.Count).HasColumnName("count");

                entity.Property(e => e.IsBind).HasMaxLength(10);

                entity.Property(e => e.IsFree).HasMaxLength(10);

                entity.Property(e => e.IsLocked).HasMaxLength(10);

                entity.Property(e => e.IsLongBind).HasMaxLength(10);

                entity.Property(e => e.IsSnapBind).HasMaxLength(10);

                entity.Property(e => e.Remarks)
                    .HasColumnName("remarks")
                    .HasMaxLength(100);
            });

            modelBuilder.Entity<Djcabinet>(entity =>
            {
                entity.ToTable("DJCabinetTable");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.BoxCount).HasColumnName("boxCount");

                entity.Property(e => e.CabinetNo)
                    .IsRequired()
                    .HasColumnName("cabinetNO")
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Djcard>(entity =>
            {
                entity.ToTable("DJCardTable");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.CardNo)
                    .HasColumnName("cardNO")
                    .HasMaxLength(50);

                entity.Property(e => e.Department)
                    .HasColumnName("department")
                    .HasMaxLength(50);

                entity.Property(e => e.UserName)
                    .HasColumnName("userName")
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Faceprint>(entity =>
            {
                entity.HasNoKey();

                entity.Property(e => e.Faceid).HasColumnName("faceid");

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .ValueGeneratedOnAdd();

                entity.Property(e => e.Userid).HasColumnName("userid");
            });

            modelBuilder.Entity<MaterialInventory>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.AssetNo)
                    .HasColumnName("assetNo")
                    .HasMaxLength(50);

                entity.Property(e => e.BoxId).HasColumnName("boxId");

                entity.Property(e => e.CabinetId).HasColumnName("cabinetId");

                entity.Property(e => e.Count).HasColumnName("count");

                entity.Property(e => e.InternalFileNo)
                    .HasColumnName("internalFileNo")
                    .HasMaxLength(50);

                entity.Property(e => e.MaterialId).HasColumnName("materialId");

                entity.Property(e => e.MaterialName)
                    .HasColumnName("materialName")
                    .HasMaxLength(50);

                entity.Property(e => e.MaterialNum)
                    .HasColumnName("materialNum")
                    .HasMaxLength(50);

                entity.Property(e => e.Remarks).HasColumnName("remarks");

                entity.HasOne(d => d.Material)
                    .WithMany(p => p.MaterialInventoryTable)
                    .HasForeignKey(d => d.MaterialId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_MaterialInventoryTable_MaterialTable");
            });

            modelBuilder.Entity<Material>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Count).HasColumnName("count");

                entity.Property(e => e.ItemNum)
                    .HasColumnName("itemNum")
                    .HasMaxLength(50);

                entity.Property(e => e.MaterialName)
                    .HasColumnName("materialName")
                    .HasMaxLength(50);

                entity.Property(e => e.MaterialNum)
                    .HasColumnName("materialNum")
                    .HasMaxLength(50);

                entity.Property(e => e.Type)
                    .HasColumnName("type")
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<OpenBoxRecord>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.BindObject)
                    .HasColumnName("bindObject")
                    .HasMaxLength(50);

                entity.Property(e => e.BindUserName)
                    .IsRequired()
                    .HasColumnName("bindUserName")
                    .HasMaxLength(50);

                entity.Property(e => e.BoxId).HasColumnName("boxId");

                entity.Property(e => e.CabinetNo)
                    .IsRequired()
                    .HasColumnName("cabinetNO")
                    .HasMaxLength(50);

                entity.Property(e => e.Count).HasColumnName("count");

                entity.Property(e => e.DateTime)
                    .IsRequired()
                    .HasColumnName("dateTime")
                    .HasMaxLength(50);

                entity.Property(e => e.OpenTarget)
                    .IsRequired()
                    .HasColumnName("openTarget")
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<UserInfo>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.BoxId).HasColumnName("boxId");

                entity.Property(e => e.BoxIds).HasColumnName("boxIds");

                entity.Property(e => e.CardNo)
                    .HasColumnName("cardNO")
                    .HasMaxLength(50);

                entity.Property(e => e.CardNo2)
                    .HasColumnName("cardNO2")
                    .HasMaxLength(50);

                entity.Property(e => e.Counts).HasColumnName("counts");

                entity.Property(e => e.DateTime)
                    .HasColumnName("dateTime")
                    .HasMaxLength(50);

                entity.Property(e => e.Department)
                    .HasColumnName("department")
                    .HasMaxLength(50);

                entity.Property(e => e.FingerId).HasColumnName("fingerId");

                entity.Property(e => e.MaterialNames).HasColumnName("materialNames");

                entity.Property(e => e.PassWord)
                    .HasColumnName("passWord")
                    .HasMaxLength(50);

                entity.Property(e => e.PhoneNo)
                    .HasColumnName("phoneNO")
                    .HasMaxLength(50);

                entity.Property(e => e.Position)
                    .HasColumnName("position")
                    .HasMaxLength(50);

                entity.Property(e => e.UserName)
                    .HasColumnName("userName")
                    .HasMaxLength(50);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
