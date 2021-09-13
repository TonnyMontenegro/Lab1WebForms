using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lab1WebForms.Local_App_Data;

namespace Lab1WebForms
{
    public enum InputModes { REGISTER, UPDATE }

    public partial class RegStd : System.Web.UI.Page
    {
        public static InputModes Action;
        public static string IDTarget { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Action == InputModes.UPDATE && !IsPostBack)
            {
                Student s = Global.Students.Get(IDTarget);
                txt_ID.Text = s.ID;
                txt_Names.Text = s.Names;
                txt_Surnames.Text = s.Surnames;
                txt_IP.Text = s.IP.ToString("N2");
                txt_IIP.Text = s.IIP.ToString("N2");
                txt_SIST.Text = s.SIST.ToString("N2");
                txt_ID.Enabled = txt_Names.Enabled = txt_Surnames.Enabled = false;
                btn_Submit.Text = "Modificar";
            }
        }

        private void ClearFields()
        {
            txt_ID.Text = txt_Names.Text = txt_Surnames.Text
            = txt_IP.Text = txt_IIP.Text = txt_SIST.Text = string.Empty;
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
                Response.Redirect("/QueryStd");
            }
        }

        private void Register()
        {
            try
            {
                Global.Students.Add(new Student(
                    txt_ID.Text, txt_Names.Text, txt_Surnames.Text,
                    float.Parse(txt_IP.Text), float.Parse(txt_IIP.Text), float.Parse(txt_SIST.Text)
                    ));
                ClearFields();
            }
            catch (Exception) { }
        }

        private void Update()
        {
            try
            {
                Global.Students.UpdateScores(IDTarget,
                    float.Parse(txt_IP.Text), float.Parse(txt_IIP.Text), float.Parse(txt_SIST.Text));
                Action = InputModes.REGISTER;
            }
            catch (Exception) { }
        }
    }
}