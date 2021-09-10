using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using Lab1WebForms.Local_App_Data;

namespace Lab1WebForms
{
    public class Global : HttpApplication
    {
        public static StudentList Students { get; set; }

        void Application_Start(object sender, EventArgs e)
        {
            //Código que se ejecuta al iniciar la aplicación
            Students = new StudentList();
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
    }
}