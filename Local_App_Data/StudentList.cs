using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;


// ****************************************************
//  NO USAR ESTA CLASE
//  Unicamente sirvió como modelo de local de pruebas
//  Ya no es necesaria y puede eliminarse en un futuro
// ****************************************************

namespace Lab1WebForms.Local_App_Data
{
    public class StudentList
    {
        public List<Student> Data { get; }
        public bool IsEmpty { get { return Data.Count == 0; } }

        public StudentList()
        {
            Data = new List<Student>();
        }

        public void Add(Student s)
        {
            if (Data.Exists(std => std.ID.Equals(s.ID)))
                throw new ArgumentException("The ID already exists");

            Data.Add(s);
        }

        public void Delete(string ID)
        {
            if (Data.RemoveAll(std => std.ID.Equals(ID)) == 0)
            {
                throw new ArgumentException("ID not found");
            }
        }

        public Student Get(string ID)
        {
            return Data.Find(std => std.ID.Equals(ID));
        }

        public void UpdateScores(string ID, float ip, float iip, float sist)
        {
            int index = Data.FindIndex(std => std.ID.Equals(ID));
            if (index == -1) throw new ArgumentException("ID not found");

            Data.ElementAt(index).IP = ip;
            Data.ElementAt(index).IIP = iip;
            Data.ElementAt(index).SIST = sist;
            Data.ElementAt(index).NF = ip + iip + sist;
        }

        private int CompareNF(Student a, Student b)
        {
            return a.NF.CompareTo(b.NF);
        }

        public void Sort()
        {
            Data.Sort(CompareNF);
        }

        public float GlobalAvg()
        {
            return Data.Average(std => std.NF);
        }

        public Student Best()
        {
            float maxScore = Data.Max(std => std.NF);
            return Data.Find(std => std.NF == maxScore);
        }
    }
}