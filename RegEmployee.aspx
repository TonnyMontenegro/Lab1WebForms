<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegEmployee.aspx.cs" Inherits="Lab1WebForms.RegEmployee" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron Mcard border border-primary">

        <h2 class="text-light text-center">Formulario de registro para trabajadores <i class="fas fa-user-tie fa-xl"></i></h2>
        <hr>
        <div class="container-fluid" >
            <div class="row">
                <div class="col-sm-7">
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <div class="container py-2">
                                    <label for="txt_Names" class="text-light">Nombres</label>
                                    <asp:TextBox ID="txt_Names" class="form-control" placeholder="John" runat="server"></asp:TextBox>
                                </div>
                                <div class="container py-2">
                                    <label for="txt_Surnames" class="text-light">Apellidos</label>
                                    <asp:TextBox ID="txt_Surnames" class="form-control" placeholder="Doe" runat="server"></asp:TextBox>
                                </div>
                                <div class="container py-2">
                                    <label for="txt_ID" class="text-light">Cedula</label>
                                    <asp:TextBox ID="txt_ID" class="form-control" placeholder="000-0000-0007D" runat="server"></asp:TextBox>
                                </div>
                                <div class="container py-2">
                                    <label for="txt_Childs" class="text-light">Numero de hijos</label>
                                    <asp:TextBox ID="txt_Childs" class="form-control" placeholder="0" runat="server"></asp:TextBox>
                                </div>
                                <div class="container py-2">
                                    <label for="txt_Salary" class="text-light">Salario</label>
                                    <asp:TextBox ID="txt_Salary" class="form-control" placeholder="14800" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col justify-content-center" style="align-content:center">
                    <div class="container py-4" >
                        <div class="card text-light Scard border-dark rounded-lg" style="width: 20vw;">
                            <div class=" text-dark bg-Scard rounded-lg">
                                <h4 class="centered">Foto de perfil </h4>
                                <div class="card card-img bg-transparent tumb" style="padding: 5px; width: 20vw; height: 20vw;">
                                    <asp:Image ID="img_container_worker" runat="server" CssClass="img-thumbnail" ImageAlign="Middle" Style="height: 19vw" />
                                </div>
                                <asp:FileUpload ID="img_input" CssClass="text-size-1" runat="server" />
                            </div>
                        </div>
                    </div>
                    <div class="container py-2">
                        <asp:Button type="button" ID="btn_Submit" class="btn btn-primary btn-lg L-20" Text="Registrar Trabajador" runat="server" OnClick="Btn_Submit_Click"></asp:Button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
