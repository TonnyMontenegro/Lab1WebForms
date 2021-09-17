using System;

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

                lbl_GlobalAvg.Text = "Promedio Global:&emsp;&emsp;" + Global.Students.GlobalAvg().ToString("N2") + " %";
                lbl_BestStd.Text = "Mejor estudiante:&emsp;&emsp;" + Global.Students.Best().ToString();

                panel_Avg.Visible = panel_Best.Visible = true;
                panel_warning.Visible = false;
            }
            else
            {
                txt_ID.Visible = panel_Avg.Visible = panel_Best.Visible = btn_Search.Visible
                    = btn_Delete.Visible = btn_Modify.Visible = btn_Sort.Visible = false;
                panel_warning.Visible = true;
            }
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            if (!validator_id_exists.IsValid || string.IsNullOrEmpty(txt_ID.Text)) return;
            try
            {
                gvw_StudentData.DataSource = null;
                gvw_StudentData.DataSource = Global.Students.Get(txt_ID.Text)?.AsSource();
                gvw_StudentData.DataBind();

                txt_ID.Text = string.Empty;
                btn_RestoreTable.Visible = true;
            }
            catch (Exception) { } //TODO
        }

        protected void BtnModify_Click(object sender, EventArgs e)
        {
            if (!validator_id_exists.IsValid || string.IsNullOrEmpty(txt_ID.Text)) return;

            RegStd.Action = InputModes.UPDATE;
            RegStd.IDTarget = txt_ID.Text;
            Response.Redirect("/RegStd");
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            if (!validator_id_exists.IsValid || string.IsNullOrEmpty(txt_ID.Text)) return;
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
            // Evita que se muestre el mensaje aunque haya algo erróneo escrito
            validator_id_exists.IsValid = true;
            gvw_StudentData.DataSource = null;
            gvw_StudentData.DataSource = Global.Students.ToSortedList();
            gvw_StudentData.DataBind();

            lbl_NoData.Text = "Esta visualización no se encuentra aplicada en el registro";
            btn_RestoreTable.Visible = panel_warning.Visible = true;
        }

        protected void BtnRestore_Click(object sende, EventArgs e)
        {
            validator_id_exists.IsValid = true;
            RefreshData();
        }

        protected void IDValidation(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            args.IsValid = Global.Students.Exists(args.Value);
        }
    }
}