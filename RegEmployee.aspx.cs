using System;
using System.Web.UI;
using Lab1WebForms.Local_App_Data;

namespace Lab1WebForms
{
    public partial class RegEmployee : Page
    {
        public static InputModes Action;
        public static string IDTarget { get; set; }
        private static byte[] swap;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Intento de solucionar #4, funciona parcialmente
            if (!IsPostBack &&
               AppRelativeVirtualPath.Contains(Request.UrlReferrer?.AbsolutePath ?? string.Empty))
            {
                Action = InputModes.REGISTER;
            }

            // Empieza con la imagen por defecto
            if (!IsPostBack)
            {
                img_container_worker.ImageUrl = Miscellany.B64EmployeeIcon;
            }

            if (Action == InputModes.UPDATE && !IsPostBack)
            {
                Employee emp = Global.Employees.Get(IDTarget);
                txt_ID.Text = emp.DNI;
                txt_Names.Text = emp.Names;
                txt_Surnames.Text = emp.Surnames;
                txt_Childs.Text = emp.ChildCount.ToString();
                txt_Salary.Text = emp.Salary.ToString("F2");
                txt_ID.Enabled = txt_Names.Enabled = txt_Surnames.Enabled
                    = txt_Childs.Enabled = img_input.Enabled = img_label.Visible = false;
                
                img_container_worker.ImageUrl = Miscellany.ToBase64(emp.ProfilePicture);
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
                if (Global.Employees.Exists(txt_ID.Text))
                {
                    Notify(valid: false,
                        "Ya existe un empleado con cédula " + txt_ID.Text);
                    return;
                }

                Employee e = new Employee(
                    txt_ID.Text, txt_Names.Text, txt_Surnames.Text,
                    (string.IsNullOrEmpty(txt_Childs.Text) ? 0 : int.Parse(txt_Childs.Text)),
                    double.Parse(txt_Salary.Text))
                {
                    ProfilePicture = swap ?? Miscellany.EmployeIconData
                };
                Global.Employees.Add(e);

                Notify(valid: true,
                    $"Se ha registrado a {txt_Names.Text} {txt_Surnames.Text} ({txt_ID.Text})");

                // Restaura la imagen por defecto
                img_container_worker.ImageUrl = Miscellany.B64EmployeeIcon;
                ClearFields();
            }
            catch (Exception) { }
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

        protected void Upload(object sender, EventArgs e)
        {
            string[] typeFilters = new string[] { ".jpg", ".jpeg", ".png", ".bmp", ".webp", ".tiff", ".gif" };
            img_label.Text = img_input.FileName;

            foreach (var type in typeFilters)
            {
                if (img_input.FileName.EndsWith(type))
                {
                    swap = img_input.FileBytes;
                    img_container_worker.ImageUrl = Miscellany.ToBase64(swap);
                    lbl_invalid.Visible = false;
                    return;
                }
            }
            swap = null;
            img_container_worker.ImageUrl = string.Empty;
            lbl_invalid.Visible = true;
            return;
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