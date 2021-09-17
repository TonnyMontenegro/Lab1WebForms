using System;
using System.Collections.Generic;
using System.Drawing;
using System.Web;
using System.IO;

namespace Lab1WebForms.Local_App_Data
{
    public static class Miscellany
    {
        private static readonly string EmployeeIconPath =
            HttpContext.Current.Server.MapPath("~/App_Data/EmployeeIcon.png");

        public static string B64EmployeeIcon
        {
            get { return ToBase64(EmployeIconData); }
        }

        public static byte[] EmployeIconData
        {
            get { return File.ReadAllBytes(EmployeeIconPath); }
        }

        public static string ToBase64(byte[] binaryPicture)
        {
            return "data:image/jpg;base64," + Convert.ToBase64String(binaryPicture);
        }
    }
}