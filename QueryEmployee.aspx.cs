using System;

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

            if (!Global.Employees.IsEmpty())
            {
                gvw_WorkerData.DataSource = Global.Employees.GetData();
                gvw_WorkerData.DataBind();

                lbl_SalayAvg.Text = "Promedio de Salario:&emsp;&emsp;" + Global.Employees.SalaryAvg().ToString("C2");

                panel_Avg.Visible = true;
                panel_warning.Visible = false;
            }
            else
            {
                txt_ID.Visible = btn_Salary.Visible = btn_Search.Visible = panel_Avg.Visible
                    = btn_Delete.Visible = btn_Modify.Visible = btn_Sort.Visible = false;
                panel_warning.Visible = true;
            }
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            if (!validator_id_exists.IsValid || string.IsNullOrEmpty(txt_ID.Text)) return;
            try
            {
                gvw_WorkerData.DataSource = null;
                gvw_WorkerData.DataSource = Global.Employees.Get(txt_ID.Text).AsSource();
                gvw_WorkerData.DataBind();

                txt_ID.Text = string.Empty;
                btn_RestoreTable.Visible = true;
            }
            catch (Exception) { } //TODO
        }

        protected void BtnModify_Click(object sender, EventArgs e)
        {
            if (!validator_id_exists.IsValid || string.IsNullOrEmpty(txt_ID.Text)) return;

            RegEmployee.Action = InputModes.UPDATE;
            RegEmployee.IDTarget = txt_ID.Text;
            Response.Redirect("/RegEmployee");
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            if (!validator_id_exists.IsValid || string.IsNullOrEmpty(txt_ID.Text)) return;
            try
            {
                Global.Employees.Delete(txt_ID.Text);
                txt_ID.Text = string.Empty;
                RefreshData();
            }
            catch (Exception) { } //TODO
        }

        protected void BtnIncrease_Click(object sender, EventArgs e)
        {
            validator_id_exists.IsValid = true;
            var result = Global.Employees.IncreaseSalary(percent: 10);
            RefreshData();
        }

        protected void BtnSort_Click(object sender, EventArgs e)
        {
            validator_id_exists.IsValid = true;
            gvw_WorkerData.DataSource = null;
            gvw_WorkerData.DataSource = Global.Employees.ToSortedList();
            gvw_WorkerData.DataBind();

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
            args.IsValid = Global.Employees.Exists(args.Value);
        }
    }
}