using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.IO;

namespace Lab1WebForms.Local_App_Data
{
    public static class Miscellany
    {
        /*public static byte[] ToByteArray(Stream input)
        {
            using (var content = new MemoryStream())
            {
                input.CopyTo(content);
                return content.ToArray();
            }
        }

        public static Image ToImage(byte[] binaryPicture)
        {
            try
            {
                using (var ms = new MemoryStream(binaryPicture))
                {
                    return Image.FromStream(ms);
                }
            }
            catch (ArgumentException e)
            {
                Console.Write(e.Message);
                return null;
            }
        }*/

        public static string ToBase64String(byte[] binaryPicture)
        {
            return "data:image/jpg;base64," + Convert.ToBase64String(binaryPicture);
        }
    }
}