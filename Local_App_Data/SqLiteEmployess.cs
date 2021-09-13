using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Lab1WebForms.Local_App_Data
{
    public class SqLiteEmployess
    {
        public SqLiteEmployess()
        {
            CreateDb();
        }

        private void CreateDb()
        {
            using (var dbContext = new EmployeesDbContext())
            {
                dbContext.Database.EnsureCreated();
            }
        }

        public bool IsEmpty()
        {
            using (var dbContext = new EmployeesDbContext())
            {
                return dbContext.EmployeeData.Count() == 0;
            }
        }

        public List<Employee> GetData()
        {
            using (var dbContext = new EmployeesDbContext())
            {
                return dbContext.EmployeeData.ToList();
            }
        }

        public Employee Get(string DNI)
        {
            using (var dbContext = new EmployeesDbContext())
            {
                return dbContext.EmployeeData.Find(DNI);
            }
        }

        public bool Add(Employee e)
        {
            using (var dbContext = new EmployeesDbContext())
            {
                dbContext.EmployeeData.Add(e);
                return dbContext.SaveChanges() > 0;
            }
        }

        public bool Delete(string DNI)
        {
            using (var dbContext = new EmployeesDbContext())
            {
                dbContext.EmployeeData.Remove(
                    dbContext.EmployeeData.Find(DNI));
                return dbContext.SaveChanges() > 0;
            }
        }

        public bool UpdateSalary(string DNI, double salary)
        {
            using (var dbContext = new EmployeesDbContext())
            {
                dbContext.EmployeeData.Find(DNI).Salary = salary;
                return dbContext.SaveChanges() > 0;
            }
        }

        public bool IncreaseSalary(float percent)
        {
            // Esto tampoco lo he probado así porque no hay .Foreach
            // En teoria podría funcionar

            using (var dbContext = new EmployeesDbContext())
            {
                double salaryAvg = dbContext.EmployeeData.Average(emp => emp.Salary);
                for (int i=0; i<dbContext.EmployeeData.Count(); i++)
                {
                    dbContext.EmployeeData.ElementAt(i)
                        .Salary *= ((dbContext.EmployeeData.ElementAt(i).Salary < salaryAvg)
                                    ? (1 + (percent / 100)) : 1);
                }
                return dbContext.SaveChanges() > 0;
            }
        }

        public bool Sort()
        {
            // E igualmente tampoco he probado esto
            using (var dbContext = new EmployeesDbContext())
            {
                dbContext.EmployeeData.OrderBy(e => e.Salary);
                return dbContext.SaveChanges() > 0;
            }
        }
    }
}