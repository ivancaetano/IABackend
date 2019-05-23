namespace IACarros.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class CARDB : DbContext
    {
        public CARDB()
            : base("name=CARDB")
        {
            this.Configuration.LazyLoadingEnabled = true;
        }

        public virtual DbSet<cartb001_modelo> cartb001_modelo { get; set; }
        public virtual DbSet<cartb002_marca> cartb002_marca { get; set; }
        public virtual DbSet<cartb003_categoria> cartb003_categoria { get; set; }
        public virtual DbSet<cartb004_versao> cartb004_versao { get; set; }
        public virtual DbSet<cartb005_ano_versao> cartb005_ano_versao { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<cartb001_modelo>()
                .Property(e => e.no_modelo)
                .IsUnicode(false);

            modelBuilder.Entity<cartb001_modelo>()
                .HasMany(e => e.cartb004_versao)
                .WithRequired(e => e.cartb001_modelo)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<cartb002_marca>()
                .Property(e => e.no_marca)
                .IsUnicode(false);

            modelBuilder.Entity<cartb002_marca>()
                .HasMany(e => e.cartb001_modelo)
                .WithRequired(e => e.cartb002_marca)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<cartb003_categoria>()
                .Property(e => e.no_categoria)
                .IsUnicode(false);

            modelBuilder.Entity<cartb003_categoria>()
                .HasMany(e => e.cartb004_versao)
                .WithRequired(e => e.cartb003_categoria)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<cartb004_versao>()
                .Property(e => e.no_versao)
                .IsUnicode(false);

            modelBuilder.Entity<cartb004_versao>()
                .Property(e => e.vr_peso_potencia)
                .HasPrecision(10, 2);

            modelBuilder.Entity<cartb004_versao>()
                .Property(e => e.vr_peso_torque)
                .HasPrecision(10, 2);

            modelBuilder.Entity<cartb004_versao>()
                .Property(e => e.vr_economia)
                .HasPrecision(10, 2);

            modelBuilder.Entity<cartb004_versao>()
                .Property(e => e.vr_conforto)
                .HasPrecision(10, 2);

            modelBuilder.Entity<cartb004_versao>()
                .Property(e => e.ic_nacionalidade)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<cartb004_versao>()
                .Property(e => e.ic_combustivel)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<cartb004_versao>()
                .Property(e => e.ic_cambio)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<cartb004_versao>()
                .HasMany(e => e.cartb005_ano_versao)
                .WithRequired(e => e.cartb004_versao)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<cartb005_ano_versao>()
                .Property(e => e.vr_preco)
                .HasPrecision(10, 2);
        }
    }
}
