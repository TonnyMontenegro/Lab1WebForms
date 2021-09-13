<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QueryEmployee.aspx.cs" Inherits="Lab1WebForms.QueryEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron Mcard border border-primary">
        <h2 class="text-light text-center">Estadisticas y edicion de registros para trabajadores <i class="fas fa-user-graduate fa-xl"></i></h2>
        <hr>

        <div class="container-fluid">
            <div class="row justify-content-md-center">
                <div class="col-md-auto">
                    <asp:TextBox ID="txt_ID" runat="server" CssClass="form-control" placeholder="001-000000-0007F"></asp:TextBox>
                </div>
                <div class="col-md-auto">
                    <asp:Button ID="Button1" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="BtnSearch_Click"/>
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
                    <asp:Button ID="btn_salary" runat="server" Text="Aumentar salario" CssClass="btn btn-primary" OnClick="BtnIncrease_Click"/>
                </div>
            </div>
            <div class="row justify-content-md-center">
                <div class="col-md-auto">
                    <asp:Button ID="btn_RestoreTable" runat="server" Text="Todos los registros" CssClass="btn btn-primary" Visible="False" OnClick="BtnRestore_Click"/>
                </div>
            </div>

            <div class="row justify-content-md-center">

                <div class="col-4">
                    <div style="padding: 10%">
                        <span class="badge badge-dark">
                            <asp:Label ID="Promedio_salario" Visible="false" runat="server"></asp:Label>
                        </span>
                    </div>

                </div>



                <div class="table-responsive">
                    <asp:GridView ID="gvw_WorkerData" runat="server" CssClass="table table-striped table-dark table-hover">
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
