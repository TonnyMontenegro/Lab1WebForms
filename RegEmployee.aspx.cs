using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lab1WebForms.Local_App_Data;

namespace Lab1WebForms
{
    public partial class RegEmployee : Page
    {
        public static InputModes Action;
        public static string IDTarget { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Action == InputModes.UPDATE && !IsPostBack)
            {
                Employee emp = Global.Employess.Get(IDTarget);
                txt_ID.Text = emp.DNI;
                txt_Names.Text = emp.Names;
                txt_Surnames.Text = emp.Surnames;
                txt_Childs.Text = emp.ChildCount.ToString();
                txt_Salary.Text = emp.Salary.ToString("C2");
                txt_ID.Enabled = txt_Names.Enabled = txt_Surnames.Enabled
                    = txt_Childs.Enabled = img_input.Enabled = false;

                img_container_worker.ImageUrl = Miscellany.ToBase64String(emp.ProfilePicture) ?? "";
                btn_Submit.Text = "Modificar";
            }

        }

        private void ClearFields()
        {
            txt_ID.Text = txt_Names.Text = txt_Surnames.Text
            = txt_Childs.Text = txt_Salary.Text = string.Empty;
        }

        protected void Btn_Submit_Click(object sender, EventArgs e)
        {
            if (Action == InputModes.REGISTER)
            {
                Register();
            }
            else if (Action == InputModes.UPDATE)
            {
                Update();
                Response.Redirect("/QueryEmployee");
            }
        }

        private void Register()
        {
            try
            {
                Employee e = new Employee(
                    txt_ID.Text, txt_Names.Text, txt_Surnames.Text,
                    int.Parse(txt_Childs.Text), double.Parse(txt_Salary.Text));

                if (img_input.HasFile)
                {
                    e.ProfilePicture = img_input.FileBytes;
                }

                Global.Employess.Add(e);
                ClearFields();
            }
            catch (Exception) { }
        }

        private void Update()
        {
            try
            {
                Global.Employess.UpdateSalary(txt_ID.Text, double.Parse(txt_Salary.Text));
                Action = InputModes.REGISTER;
            }
            catch (Exception) { }
        }
    }
}