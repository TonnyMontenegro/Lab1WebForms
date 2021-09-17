﻿using System;
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
            //Intento de solucionar #3, funciona parcialmente
            if (!IsPostBack &&
               AppRelativeVirtualPath.Contains(Request.UrlReferrer?.AbsolutePath ?? string.Empty))
            {
                Action = InputModes.REGISTER;
            }

            if (Action == InputModes.UPDATE && !IsPostBack)
            {
                Student s = Global.Students.Get(IDTarget);
                txt_ID.Text = s.ID;
                txt_Names.Text = s.Names;
                txt_Surnames.Text = s.Surnames;
                txt_IP.Text = s.IP.ToString("F2");
                txt_IIP.Text = s.IIP.ToString("F2");
                txt_SIST.Text = s.SIST.ToString("F2");
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
                if (Global.Students.Exists(txt_ID.Text))
                {
                    Notify(valid: false,
                        "Ya existe un estudiante con carnet " + txt_ID.Text);
                    return;
                }

                Global.Students.Add(
                    new Student(txt_ID.Text, txt_Names.Text, txt_Surnames.Text,
                                (string.IsNullOrEmpty(txt_IP.Text) ? 0 : float.Parse(txt_IP.Text)),
                                (string.IsNullOrEmpty(txt_IIP.Text) ? 0 : float.Parse(txt_IIP.Text)),
                                (string.IsNullOrEmpty(txt_SIST.Text) ? 0 : float.Parse(txt_SIST.Text))));
                Notify(valid: true,
                    $"Se ha registrado a {txt_Names.Text} {txt_Surnames.Text} ({txt_ID.Text})");
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