﻿using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace AssestManagementWebApi.Models;

public partial class AssetContext : DbContext
{
    public AssetContext()
    {
    }

    public AssetContext(DbContextOptions<AssetContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Asset> Assets { get; set; }

    public virtual DbSet<AssetDefinition> AssetDefinitions { get; set; }

    public virtual DbSet<AssetType> AssetTypes { get; set; }

    public virtual DbSet<PurchaseOrder> PurchaseOrders { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<User> Users { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=.; Initial catalog=Asset; Integrated Security=True; TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Asset>(entity =>
        {
            entity.HasKey(e => e.AssetId).HasName("PK__Assets__434923529DEC269E");

            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Status).HasMaxLength(50);

            entity.HasOne(d => d.AssetDefinition).WithMany(p => p.Assets)
                .HasForeignKey(d => d.AssetDefinitionId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Assets_AssetDefinition");

            entity.HasOne(d => d.PurchaseOrder).WithMany(p => p.Assets)
                .HasForeignKey(d => d.PurchaseOrderId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Assets_PurchaseOrder");
        });

        modelBuilder.Entity<AssetDefinition>(entity =>
        {
            entity.HasKey(e => e.AssetDefinitionId).HasName("PK__AssetDef__02A2EFC51D06FEC9");

            entity.ToTable("AssetDefinition");

            entity.Property(e => e.AssetName).HasMaxLength(100);

            entity.HasOne(d => d.AssetType).WithMany(p => p.AssetDefinitions)
                .HasForeignKey(d => d.AssetTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_AssetDefinition_AssetType");
        });

        modelBuilder.Entity<AssetType>(entity =>
        {
            entity.HasKey(e => e.AssetTypeId).HasName("PK__AssetTyp__FD33C2C23A1FAE4F");

            entity.ToTable("AssetType");

            entity.Property(e => e.TypeName).HasMaxLength(100);
        });

        modelBuilder.Entity<PurchaseOrder>(entity =>
        {
            entity.HasKey(e => e.PurchaseOrderId).HasName("PK__Purchase__036BACA4AA1A1F84");

            entity.ToTable("PurchaseOrder");

            entity.Property(e => e.Status).HasMaxLength(100);

            entity.HasOne(d => d.AssetDefinition).WithMany(p => p.PurchaseOrders)
                .HasForeignKey(d => d.AssetDefinitionId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PurchaseOrder_AssetDefinition");
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.HasKey(e => e.RoleId).HasName("PK__Roles__8AFACE1A65912D01");

            entity.Property(e => e.RoleName).HasMaxLength(50);
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.UserId).HasName("PK__Users__1788CC4CA4269443");

            entity.HasIndex(e => e.Username, "UQ__Users__536C85E4A82D6419").IsUnique();

            entity.Property(e => e.PasswordHash).HasMaxLength(255);
            entity.Property(e => e.Username).HasMaxLength(50);

            entity.HasOne(d => d.Role).WithMany(p => p.Users)
                .HasForeignKey(d => d.RoleId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Users_Roles");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
