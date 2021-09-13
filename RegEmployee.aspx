<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegEmployee.aspx.cs" Inherits="Lab1WebForms.RegEmployee" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron Mcard border border-primary">

        <h2 class="text-light text-center">Formulario de registro para trabajadores <i class="fas fa-user-tie fa-xl"></i></h2>
        <hr>
        <div class="container-fluid">
            <div class="form-row">
                <div class="col-sm">
                    <label for="txt_Names" class="text-light">Nombres</label>
                    <asp:TextBox ID="txt_Names" class="form-control" placeholder="John" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm">
                    <label for="txt_Surnames" class="text-light">Apellidos</label>
                    <asp:TextBox ID="txt_Surnames" class="form-control" placeholder="Doe" runat="server"></asp:TextBox>
                </div>
            </div>

            <div class="form-row">
                <div class="col-sm">
                    <label for="txt_ID" class="text-light">Cedula</label>
                    <asp:TextBox ID="txt_ID" class="form-control" placeholder="000-0000-0007D" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm">
                    <label for="txt_Childs" class="text-light">Numero de hijos</label>
                    <asp:TextBox ID="txt_Childs" class="form-control" placeholder="0" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm">
                    <label for="txt_Salary" class="text-light">Salario</label>
                    <asp:TextBox ID="txt_Salary" class="form-control" placeholder="14800" runat="server"></asp:TextBox>
                </div>
            </div>

            <div style="margin-bottom: 2%;">
                <asp:Label ID="LabelStd" class="text-light" runat="server" Text=" "></asp:Label>
            </div>

            <div class="row">
                <div class="col-sm">
                    <div class="input-group mb-3">
                        <div class="custom-file text-light">
                            <asp:FileUpload ID="img_input" runat="server" ></asp:FileUpload>
                        </div>
                    </div>
                    <div class="col-sm">
                        <asp:Image ID="img_container_worker" runat="server" />
                    </div>
                </div>
                <div class="col-sm">
                    <asp:Button type="button" ID="btn_Submit" class="btn btn-primary btn-lg" Text="Registrar Trabajador" runat="server" OnClick="Btn_Submit_Click"></asp:Button>
                </div>



            </div>


        </div>

    </div>

</asp:Content>
