using System.Collections.Generic;
using System.Linq;

namespace Lab1WebForms.Local_App_Data
{
    public class SqLiteStudents
    {
        public SqLiteStudents()
        {
            CreateDb();
        }

        private void CreateDb()
        {
            using (var dbContext = new StudentsDbContext())
            {
                dbContext.Database.EnsureCreated();
            }
        }

        public bool IsEmpty()
        {
            using (var dbContext = new StudentsDbContext())
            {
                return dbContext.StudentData.Count() == 0;
            }
        }

        public bool Exists(string ID)
        {
            using (var dbContext = new StudentsDbContext())
            {
                return dbContext.StudentData.Find(ID) != null;
            }
        }
        
        public List<Student> GetData()
        {
            using (var dbContext = new StudentsDbContext())
            {
                return dbContext.StudentData.ToList();
            }
        }

        public Student Get(string ID)
        {
            using (var dbContext = new StudentsDbContext())
            {
                return dbContext.StudentData.Find(ID);
            }
        }

        public bool Add(Student s)
        {
            using (var dbContext = new StudentsDbContext())
            {
                dbContext.StudentData.Add(s);
                return dbContext.SaveChanges() > 0;
            }
        }

        public bool Delete(string ID)
        {
            using (var dbContext = new StudentsDbContext())
            {
                dbContext.StudentData.Remove(
                    dbContext.StudentData.Find(ID));
                return dbContext.SaveChanges() > 0;
            }
        }

        public bool UpdateScores(string ID, float ip, float iip, float sist)
        {
            using (var dbContext = new StudentsDbContext())
            {
                Student std = dbContext.StudentData.Find(ID);
                std.IP = ip;
                std.IIP = iip;
                std.SIST = sist;
                std.NF = ip + iip + sist;

                dbContext.StudentData.Update(std);
                return dbContext.SaveChanges() > 0;
            }
        }

        public float GlobalAvg()
        {
            using (var dbContext = new StudentsDbContext())
            {
                return dbContext.StudentData.Average(std => std.NF);
            }
        }

        public Student Best()
        {
            using (var dbContext = new StudentsDbContext())
            {
                float maxScore = dbContext.StudentData.Max(std => std.NF);
                return dbContext.StudentData.First(std => std.NF == maxScore);
            }
        }

        public List<Student> ToSortedList()
        {
            using (var dbContext = new StudentsDbContext())
            {
                return dbContext.StudentData.OrderBy(s => s.NF).ToList();
            }
        }
    }
}