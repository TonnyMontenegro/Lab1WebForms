<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegEmployee.aspx.cs" Inherits="Lab1WebForms.RegEmployee" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <style>
            .centered {
                margin-left: auto;
                margin-right: auto;
            }
        </style>

    <div class="jumbotron Mcard border border-primary">

        <h2 class="text-light text-center">Formulario de registro para trabajadores <i class="fas fa-user-tie fa-xl"></i></h2>
        <hr>
        <div class="container" style="width:300px">
            <div class="card text-light Pcard Spaced border-dark bg-Scard rounded-lg">
                <div class="card-body Spaced">
                    <div class="form-group">
                        <label for="txt_Names" class="text-light">Nombres</label>
                        <asp:TextBox ID="txt_Names" class="form-control" placeholder="John" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txt_Surnames" class="text-light">Apellidos</label>
                        <asp:TextBox ID="txt_Surnames" class="form-control" placeholder="Doe" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="card-body Spaced">
                    <div class="form-group">
                        <label for="txt_ID" class="text-light">Cedula</label>
                        <asp:TextBox ID="txt_ID" class="form-control" placeholder="000-0000-0007D" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txt_Childs" class="text-light">Numero de hijos</label>
                        <asp:TextBox ID="txt_Childs" class="form-control" placeholder="0" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txt_Salary" class="text-light">Salario</label>
                        <asp:TextBox ID="txt_Salary" class="form-control" placeholder="14800" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>

        <div class="container" style="width:300px">
            <div class="card text-light Pcard Spaced border-dark bg-Scard rounded-lg">
                <h4> Foto de perfil </h4>
                <div class="card card-img bg-transparent centered" style="padding: 10px; width: 16vw;">
                    <asp:Image ID="img_container_worker" runat="server" CssClass="img-thumbnail" ImageAlign="Middle" style="height: 13.3vw"/>
                </div>
                <asp:FileUpload ID="img_input" runat="server"/>
            </div>
        </div>

        <div class="col-sm">
            <asp:Button type="button" ID="btn_Submit" class="btn btn-primary btn-lg" Text="Registrar Trabajador" runat="server" OnClick="Btn_Submit_Click"></asp:Button>
            </div>
        </div>

</asp:Content>
