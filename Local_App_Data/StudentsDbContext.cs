using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.EntityFrameworkCore;

namespace Lab1WebForms.Local_App_Data
{
    public class StudentsDbContext : DbContext
    {
        public DbSet<Student> StudentData { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlite(
                "Filename=./StudentsDB.db",
                option =>
                {
                    option.MigrationsAssembly(System.Reflection.Assembly.GetExecutingAssembly().FullName);
                });
            base.OnConfiguring(optionsBuilder);
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Student>().ToTable("Students");
            modelBuilder.Entity<Student>(entity =>
            {
                entity.HasKey(k => k.ID);
                entity.HasIndex(i => i.Names);
            });
            base.OnModelCreating(modelBuilder);
        }
    }
}