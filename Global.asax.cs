using System;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using Lab1WebForms.Local_App_Data;

namespace Lab1WebForms
{
    public class Global : HttpApplication
    {
        //public static StudentList Students { get; set; }
        public static SqLiteStudents Students { get; set; }
        public static SqLiteEmployees Employees { get; set; }

        void Application_Start(object sender, EventArgs e)
        {
            //Código que se ejecuta al iniciar la aplicación
            Students = new SqLiteStudents();
            Employees = new SqLiteEmployees();

            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
    }
}