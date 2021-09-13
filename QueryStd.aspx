<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QueryStd.aspx.cs" Inherits="Lab1WebForms.QueryStd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron Mcard border border-primary">
        <h2 class="text-light text-center">Estadisticas y edicion de registros para estudiantes <i class="fas fa-user-graduate fa-xl"></i></h2>
        <hr>

        <div class="container-fluid">
            <div class="row">
                <div class="col-sm">
                    <asp:TextBox ID="txt_ID" runat="server" CssClass="form-control" placeholder="2021-0007F"></asp:TextBox>
                </div>
                <div class="col-sm text-center">
                    <asp:Button ID="Button1" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="BtnSearch_Click" />
                </div>
                <div class="col-sm text-center">
                    <asp:Button ID="btn_Modify" runat="server" Text="Modificar" CssClass="btn btn-primary" OnClick="BtnModify_Click" />
                </div>
                <div class="col-sm text-center">
                    <asp:Button ID="btn_Delete" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClick="BtnDelete_Click" />
                </div>
                <div class="col-sm">
                    <asp:Button ID="btn_sort" runat="server" Text="Ordenar estudiantes" CssClass="btn btn-primary" OnClick="BtnSort_Click" />
                </div>
                <div class="col-sm">
                    <asp:Button ID="btn_RestoreTable" runat="server" Text="Todos los registros" CssClass="btn btn-primary" Visible="False" OnClick="BtnRestore_Click" />
                </div>
            </div>

            <div class="row justify-content-md-center">
                <div class="col-4">
                    <div style="padding: 10%">
                        <span class="badge badge-dark">
                            <asp:Label ID="lbl_GlobalAvg" runat="server"></asp:Label>
                        </span>
                    </div>

                </div>

                <div class="col-4">
                    <div style="padding: 10%">
                        <span class="badge badge-dark">
                            <asp:Label ID="lbl_BestStd" runat="server"></asp:Label>
                        </span>
                    </div>

                </div>



                <div class="table-responsive">
                    <asp:GridView ID="gvw_StudentData" runat="server" CssClass="table table-striped table-dark table-hover">
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
