<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QueryEmployee.aspx.cs" Inherits="Lab1WebForms.QueryEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron Mcard border border-primary">
        <h2 class="text-light text-center">Estadisticas y edicion de registros para trabajadores <i class="fas fa-user-graduate fa-xl"></i></h2>
        <hr>

        <div class="container-fluid">
            <div class="row justify-content-md-center">
                <div class="col-md-auto">
                    <asp:TextBox ID="txt_ID" runat="server" CssClass="form-control" placeholder="001-000000-0007F"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="validator_regex_id" runat="server"
                        ErrorMessage="La cédula no es válida" ForeColor="Yellow" ControlToValidate="txt_ID"
                        ValidationExpression="[0-9]{3}-[0-9]{6}-[0-9]{4}[A-Z]"/>
                    <asp:CustomValidator ID="validator_id_exists" runat="server"
                        ForeColor="Red" ErrorMessage="La cédula no existe"
                        ControlToValidate="txt_ID" OnServerValidate="IDValidation"/>
                </div>
                <div class="col-md-auto">
                    <asp:Button ID="btn_Search" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="BtnSearch_Click"/>
                </div>
                <div class="col-md-auto">
                    <asp:Button ID="btn_Modify" runat="server" Text="Modificar" CssClass="btn btn-primary" OnClick="BtnModify_Click"/>
                </div>
                <div class="col-md-auto">
                    <asp:Button ID="btn_Delete" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClick="BtnDelete_Click"/>
                </div>
                <div class="col-md-auto">
                    <asp:Button ID="btn_Sort" runat="server" Text="Ordenar" CssClass="btn btn-primary" OnClick="BtnSort_Click"/>
                </div>
                <div class="col-md-auto">
                    <asp:Button ID="btn_Salary" runat="server" Text="Aumentar salario" CssClass="btn btn-primary" OnClick="BtnIncrease_Click"/>
                </div>
            </div>
            <div class="row justify-content-md-center">
                <div class="col-md-auto">
                    <asp:Button ID="btn_RestoreTable" runat="server" Text="Todos los registros" CssClass="btn btn-secondary" Visible="False" OnClick="BtnRestore_Click"/>
                </div>
            </div>

            <div class="row justify-content-md-center">
                <asp:Panel ID="panel_Avg" runat="server" CssClass="col-4">
                    <div style="padding: 10%">
                        <span class="badge badge-dark">
                            <asp:Label ID="lbl_SalayAvg" runat="server"></asp:Label>
                        </span>
                    </div>
                </asp:Panel>

                <div class="table-responsive">
                    <asp:GridView ID="gvw_WorkerData" runat="server" CssClass="table table-striped table-dark table-hover">
                    </asp:GridView>
                </div>

                <asp:Panel ID="panel_warning" runat="server"
                    CssClass="card bg-dark" BorderColor="Yellow" Style="width:36vw; text-align: center">
                    <asp:Label ID="lbl_NoData" runat="server" Text="Sin datos para mostrar"
                        Font-Bold="True" Font-Size="Medium" ForeColor="Yellow" />
                </asp:Panel>
            </div>
        </div>
    </div>

</asp:Content>
