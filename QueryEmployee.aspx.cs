using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lab1WebForms.Local_App_Data;

namespace Lab1WebForms
{
    public partial class QueryEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RefreshData();
            }
        }

        private void RefreshData()
        {
            gvw_WorkerData.DataSource = null;
            gvw_WorkerData.DataBind();
            btn_RestoreTable.Visible = false;

            if (!Global.Employess.IsEmpty())
            {
                gvw_WorkerData.DataSource = Global.Employess.GetData();
                gvw_WorkerData.DataBind();
            }
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                gvw_WorkerData.DataSource = null;
                gvw_WorkerData.DataSource = Global.Employess.Get(txt_ID.Text).AsSource();
                gvw_WorkerData.DataBind();

                txt_ID.Text = string.Empty;
                btn_RestoreTable.Visible = true;
            }
            catch (Exception) { } //TODO
        }

        protected void BtnModify_Click(object sender, EventArgs e)
        {
            RegEmployee.Action = InputModes.UPDATE;
            RegEmployee.IDTarget = txt_ID.Text;
            Response.Redirect("/RegEmployee");
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                Global.Employess.Delete(txt_ID.Text);
                txt_ID.Text = string.Empty;
                RefreshData();
            }
            catch (Exception) { } //TODO
        }

        protected void BtnSort_Click(object sender, EventArgs e)
        {
            Global.Employess.Sort();
        }

        protected void BtnIncrease_Click(object sender, EventArgs e)
        {
            Global.Employess.IncreaseSalary(10);
        }

        protected void BtnRestore_Click(object sende, EventArgs e)
        {
            RefreshData();
        }
    }
}