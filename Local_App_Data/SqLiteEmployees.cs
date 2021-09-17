using System.Collections.Generic;
using System.Linq;

namespace Lab1WebForms.Local_App_Data
{
    public class SqLiteEmployees
    {
        public SqLiteEmployees()
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

        public bool Exists(string ID)
        {
            using (var dbContext = new EmployeesDbContext())
            {
                return dbContext.EmployeeData.Find(ID) != null;
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

        public double SalaryAvg()
        {
            using (var dbContext = new EmployeesDbContext())
            {
                return dbContext.EmployeeData.Average(emp => emp.Salary);
            }
        }

        public bool IncreaseSalary(float percent)
        {
            using (var dbContext = new EmployeesDbContext())
            {
                double salaryAvg = dbContext.EmployeeData.Average(emp => emp.Salary);

                dbContext.EmployeeData.ToList().ForEach(emp =>
                    emp.Salary *= (emp.Salary < salaryAvg) ? (1 + (percent / 100)) : 1);
                return dbContext.SaveChanges() > 0;
            }
        }

        public List<Employee> ToSortedList()
        {
            using (var dbContext = new EmployeesDbContext())
            {
                return dbContext.EmployeeData.OrderBy(e => e.Salary).ToList();
            }
        }
    }
}