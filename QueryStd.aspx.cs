using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab1WebForms
{
    public partial class QueryStd : System.Web.UI.Page
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
            gvw_StudentData.DataSource = null;
            gvw_StudentData.DataBind();
            btn_RestoreTable.Visible = false;

            if (!Global.Students.IsEmpty())
            {
                gvw_StudentData.DataSource = Global.Students.GetData();
                gvw_StudentData.DataBind();

                lbl_GlobalAvg.Text = "Promedio Global:\t" + Global.Students.GlobalAvg().ToString("N2") + " %";
                lbl_BestStd.Text = "Mejor estudiante:\t" + Global.Students.Best().ToString();
            }
            else
            {
                lbl_BestStd.Text = lbl_GlobalAvg.Text = string.Empty;
            }
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                gvw_StudentData.DataSource = null;
                gvw_StudentData.DataSource = Global.Students.Get(txt_ID.Text).AsSource();
                gvw_StudentData.DataBind();

                txt_ID.Text = string.Empty;
                btn_RestoreTable.Visible = true;
            }
            catch (Exception) { } //TODO
        }

        protected void BtnModify_Click(object sender, EventArgs e)
        {
            RegStd.Action = InputModes.UPDATE;
            RegStd.IDTarget = txt_ID.Text;
            Response.Redirect("/RegStd");
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                Global.Students.Delete(txt_ID.Text);
                txt_ID.Text = string.Empty;
                RefreshData();
            }
            catch (Exception) { } //TODO
        }

        protected void BtnSort_Click(object sender, EventArgs e)
        {
            Global.Students.Sort();
        }

        protected void BtnRestore_Click(object sende, EventArgs e)
        {
            RefreshData();
        }
    }
}