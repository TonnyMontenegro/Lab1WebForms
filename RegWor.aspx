<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegWor.aspx.cs" Inherits="Lab1WebForms.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron Mcard border border-primary">

        <h2 class="text-light text-center">Formulario de registro para trabajadores <i class="fas fa-user-tie fa-xl"></i></h2>
        <hr>
        <div class="container-fluid">
            <div class="form-row">
                <div class="col-sm">
                    <label for="TXTNombres" class="text-light">Nombres</label>
                    <asp:TextBox ID="TXTNombres" class="form-control" placeholder="John" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm">
                    <label for="TXTApellidos" class="text-light">Apellidos</label>
                    <asp:TextBox ID="TXTApellidos" class="form-control" placeholder="Doe" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-row">
                <div class="col-sm">
                    <label for="TXTcedula" class="text-light">Cedula</label>
                    <asp:TextBox ID="TXTcedula" class="form-control" placeholder="000-0000-0007D" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm">
                    <label for="TXTnHijos" class="text-light">Numero de hijos</label>
                    <asp:TextBox ID="TXTnHijos" class="form-control" placeholder="0" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm">
                    <label for="TXTsalario" class="text-light">Salario</label>
                    <asp:TextBox ID="TXTsalario" class="form-control" placeholder="14800" runat="server"></asp:TextBox>
                </div>
            </div>

            <div style="margin-bottom: 2%;">
                <asp:Label ID="LabelStd" class="text-light" runat="server" Text=" "></asp:Label>
            </div>

            <div class="row">
                <div class="col-sm">
                    <div class="input-group mb-3">
                        <div class="custom-file">
                            <asp:FileUpload type="file" class="custom-file-input" ID="img_input" runat="server" aria-describedby="inputGroupFileAddon01"></asp:FileUpload>
                            <label class="custom-file-label" for="img_input">elegir una imagen</label>
                        </div>
                    </div>
                    <div class="col-sm">
                        <asp:Image ID="img_container_worker" runat="server" />
                    </div>
                </div>
                <div class="col-sm">
                    <asp:Button type="button" ID="BTNregistrarTrabajador" class="btn btn-primary btn-lg" Text="Registrar Trabajador" runat="server"></asp:Button>
                </div>



            </div>


        </div>

    </div>

</asp:Content>
