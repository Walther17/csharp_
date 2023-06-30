using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace WebApplication11231212.Models;

public partial class CursosSa2Context : DbContext
{
    public CursosSa2Context()
    {
    }

    public CursosSa2Context(DbContextOptions<CursosSa2Context> options)
        : base(options)
    {
    }

    public virtual DbSet<Curso> Cursos { get; set; }

    public virtual DbSet<Estudiante> Estudiantes { get; set; }

    public virtual DbSet<Profesore> Profesores { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {

    }
      
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Curso>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__cursos__3213E83FEA12C89D");

            entity.ToTable("cursos");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Descripcion)
                .HasMaxLength(500)
                .HasColumnName("descripcion");
            entity.Property(e => e.IdProfesor).HasColumnName("id_profesor");
            entity.Property(e => e.Nombre)
                .HasMaxLength(100)
                .HasColumnName("nombre");

            entity.HasOne(d => d.oProfesor).WithMany(p => p.Cursos)
                .HasForeignKey(d => d.IdProfesor)
                .HasConstraintName("FK_ID_PROFESOR");
        });

        modelBuilder.Entity<Estudiante>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__estudian__3213E83F29C31107");

            entity.ToTable("estudiantes");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Apellido)
                .HasMaxLength(100)
                .HasColumnName("apellido");
            entity.Property(e => e.Edad).HasColumnName("edad");
            entity.Property(e => e.IdCurso).HasColumnName("id_curso");
            entity.Property(e => e.Nombre)
                .HasMaxLength(100)
                .HasColumnName("nombre");

            entity.HasOne(d => d.oCurso).WithMany(p => p.Estudiantes)
                .HasForeignKey(d => d.IdCurso)
                .HasConstraintName("FK_ID_CURSO");
        });

        modelBuilder.Entity<Profesore>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__profesor__3213E83F92A3BB10");

            entity.ToTable("profesores");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Apellido)
                .HasMaxLength(100)
                .HasColumnName("apellido");
            entity.Property(e => e.Nombre)
                .HasMaxLength(100)
                .HasColumnName("nombre");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
