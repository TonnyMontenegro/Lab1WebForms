<%@ Page Title="Registro de estudiantes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegStd.aspx.cs" Inherits="Lab1WebForms.RegStd" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron Mcard border border-primary">

        <h2 class="text-light text-center">Formulario de registro para estudiantes <i class="fas fa-user-graduate fa-xl"></i></h2>
        <hr>
        <div class="container-fluid">
            <div class="form-row">
                <div class="col-sm">
                    <label for="txt_ID" class="text-light">Carnet</label>
                    <asp:TextBox ID="txt_ID" CssClass="form-control" placeholder="2021-0007X" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm">
                    <label for="txt_Names" class="text-light">Nombres</label>
                    <asp:TextBox ID="txt_Names" CssClass="form-control" placeholder="John" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm">
                    <label for="txt_Surnames" class="text-light">Apellidos</label>
                    <asp:TextBox ID="txt_Surnames" CssClass="form-control" placeholder="Doe" runat="server"></asp:TextBox>
                </div>
            </div>


            <div class="form-row">
                <div class="col-sm">
                    <label for="txt_IP" class="text-light">Primer parcial</label>
                    <asp:TextBox ID="txt_IP" CssClass="form-control" placeholder="35" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm">
                    <label for="txt_IIP" class="text-light">Segundo parcial</label>
                    <asp:TextBox ID="txt_IIP" CssClass="form-control" placeholder="35" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm">
                    <label for="txt_SIST" class="text-light">Sistematicos</label>
                    <asp:TextBox ID="txt_SIST" CssClass="form-control" placeholder="30" runat="server"></asp:TextBox>
                </div>
            </div>
            <div style="margin-bottom: 2%;">
                <asp:Label ID="LabelStd" CssClass="text-light" runat="server" Text=" "></asp:Label>
            </div>
            <div>
                <asp:Button type="button" ID="btn_Submit" CssClass="btn btn-primary btn-lg" Text="Registrar Estudiante" runat="server" OnClick="Btn_Submit_Click"></asp:Button>
            </div>


        </div>

    </div>

</asp:Content>
