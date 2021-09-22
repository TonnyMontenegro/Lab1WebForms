using System;
using System.Web.UI;
using Lab1WebForms.Local_App_Data;

namespace Lab1WebForms
{
    public partial class RegEmployee : Page
    {
        public static InputModes Action;
        public static string IDTarget { get; set; }
        public string ImgSwap { get; set; }

        protected void Page_Init(object sender, EventArgs e)
        {
            // Permite la comunicacion con el fileinput
            Form.Enctype = "multipart/form-data";

            if (Action == InputModes.UPDATE && !IsPostBack)
            {
                Employee emp = Global.Employees.Get(IDTarget);
                txt_ID.Text = emp.DNI;
                txt_Names.Text = emp.Names;
                txt_Surnames.Text = emp.Surnames;
                txt_Childs.Text = emp.ChildCount.ToString();
                txt_Salary.Text = emp.Salary.ToString("F2");
                txt_ID.Enabled = txt_Names.Enabled
                    = txt_Surnames.Enabled = txt_Childs.Enabled =  false;

                ImgSwap = Miscellany.ToBase64(emp.ProfilePicture);
                btn_Submit.Text = "Modificar";
                btn_Cancel.Visible = true;
            }else
            {
                ImgSwap = Miscellany.B64EmployeeIcon;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
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

        protected void Btn_Cancel_Click(object sender, EventArgs e)
        {
            Action = InputModes.REGISTER;
            Response.Redirect(Request.RawUrl);
        }

        private void Register()
        {
            try
            {
                if (Global.Employees.Exists(txt_ID.Text))
                {
                    Notify(valid: false,
                        "Ya existe un empleado con cédula " + txt_ID.Text);
                    return;
                }
                var imageFile = (Request.Files.Count == 0) ? null : Request.Files[0];

                Employee e = new Employee(
                    txt_ID.Text, txt_Names.Text, txt_Surnames.Text,
                    (string.IsNullOrEmpty(txt_Childs.Text) ? 0 : int.Parse(txt_Childs.Text)),
                    double.Parse(txt_Salary.Text))
                {
                    ProfilePicture = (string.IsNullOrEmpty(imageFile?.FileName ?? string.Empty)) ?
                        Miscellany.EmployeIconData : Miscellany.ToByteArray(imageFile.InputStream)
                };
                Global.Employees.Add(e);

                Notify(valid: true,
                    $"Se ha registrado a {txt_Names.Text} {txt_Surnames.Text} ({txt_ID.Text})");

                ClearFields();
            }
            catch (Exception)
            {
                Notify(valid: false, "Ha ocurrido un error desconocido");
            }
        }

        private void Update()
        {
            try
            {
                Global.Employees.UpdateSalary(txt_ID.Text, double.Parse(txt_Salary.Text));
                // TODO por si llegamos a necesitar actualizar la foto de perfil
                Action = InputModes.REGISTER;
            }
            catch (Exception) { }
        }

        private void Notify(bool valid, string message)
        {
            panel_message.Visible = true;
            if (valid)
                panel_message.BorderColor = lbl_message.ForeColor = System.Drawing.Color.FromArgb(44, 186, 32);
            else
                panel_message.BorderColor = lbl_message.ForeColor = System.Drawing.Color.Red;

            lbl_message.Text = message;
        }
    }
}