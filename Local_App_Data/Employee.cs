using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Lab1WebForms.Local_App_Data
{
    public class Employee
    {
        public string DNI { get; set; }
        public string Names { get; set; }
        public string Surnames { get; set; }
        public double Salary { get; set; }
        public int ChildCount { get; set; }
        public byte[] ProfilePicture { get; set; }

        public Employee(string dNI, string names, string surnames, int childCount, double salary)
        {
            DNI = dNI;
            Names = names;
            Surnames = surnames;
            Salary = salary;
            ChildCount = childCount;
        }

        public Dictionary<string, string> AsSource()
        {
            Dictionary<string, string> source = new Dictionary<string, string>
            {
                { nameof(DNI), DNI },
                { nameof(Names), Names },
                { nameof(Surnames), Surnames },
                { nameof(ChildCount), ChildCount.ToString() },
                { nameof(Salary), Salary.ToString("C2") },
            };

            return source;
        }
    }
}