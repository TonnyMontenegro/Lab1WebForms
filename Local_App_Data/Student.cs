using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Lab1WebForms.Local_App_Data
{
    public class Student
    {
        public string ID { get; set; }
        public string Names { get; set; }
        public string Surnames { get; set; }
        public float IP { get; set; }
        public float IIP { get; set; }
        public float SIST { get; set; }
        public float NF { get; set; }
        //public byte[] ProfilePicture { get; set; }

        public Student(string iD, string names, string surnames,
                       float iP, float iIP, float sIST)
        {
            ID = iD;
            Names = names;
            Surnames = surnames;
            IP = iP;
            IIP = iIP;
            SIST = sIST;
            NF = iP + iIP + sIST;
        }

        public override string ToString()
        {
            return Names + " " + Surnames + " — " + NF;
        }

        public Dictionary<string, string> AsSource()
        {
            Dictionary<string, string> source = new Dictionary<string, string>
            {
                { nameof(ID), ID },
                { nameof(Names), Names },
                { nameof(Surnames), Surnames },
                { nameof(IP), IP.ToString("N2") },
                { nameof(IIP), IIP.ToString("N2") },
                { nameof(SIST), SIST.ToString("N2") },
                { nameof(NF), NF.ToString("N2") }
            };

            return source;
        }
    }
}