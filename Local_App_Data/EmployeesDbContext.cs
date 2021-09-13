using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.EntityFrameworkCore;

namespace Lab1WebForms.Local_App_Data
{
    public class EmployeesDbContext : DbContext
    {
        public DbSet<Employee> EmployeeData { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlite(
                "Filename=./EmployeesDB.db",
                option =>
                {
                    option.MigrationsAssembly(System.Reflection.Assembly.GetExecutingAssembly().FullName);
                });
            base.OnConfiguring(optionsBuilder);
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Employee>().ToTable("Employees");
            modelBuilder.Entity<Employee>(entity =>
            {
                entity.HasKey(k => k.DNI);
                entity.HasIndex(i => i.Names);
            });
            base.OnModelCreating(modelBuilder);
        }
    }
}