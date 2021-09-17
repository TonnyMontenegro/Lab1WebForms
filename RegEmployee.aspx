<%@ Page Title="Registro de Empleados" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegEmployee.aspx.cs" Inherits="Lab1WebForms.RegEmployee" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .notify {
            margin-bottom: 2%;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
            width: 40vw;
        }
    </style>
    <div class="jumbotron Mcard border border-primary">

        <h2 class="text-light text-center">Formulario de registro para trabajadores <i class="fas fa-user-tie fa-xl"></i></h2>
        <hr>
        <asp:Panel ID="panel_message" runat="server" CssClass="card notify bg-dark" BorderColor="#2CBA20" Visible="False">
                <asp:Label ID="lbl_message" runat="server" Text="Notificaciones" Font-Bold="True" Font-Size="Medium" ForeColor="#2CBA20" />
        </asp:Panel>

        <div class="container-fluid" >
            <div class="row">
                <div class="col-sm-7">
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <%-- Error en el estilo deshabilitado (#2) --%>
                                <div class="container py-2">
                                    <label for="txt_ID" class="text-light">Cedula</label>
                                    <asp:TextBox ID="txt_ID" class="form-control" placeholder="003-190787-0007D" runat="server" />
                                    <%-- Validadores --%>
                                    <asp:RequiredFieldValidator ID="validator_id" runat="server" 
                                        ForeColor="Red"  ErrorMessage="*" ControlToValidate="txt_ID" />
                                    <asp:RegularExpressionValidator ID="validator_regex_id" runat="server"
                                        ErrorMessage="La cédula no es válida" ForeColor="Yellow" ControlToValidate="txt_ID"
                                        ValidationExpression="[0-9]{3}-[0-9]{6}-[0-9]{4}[A-Z]"/>
                                </div>
                                <div class="container py-2">
                                    <label for="txt_Names" class="text-light">Nombres</label>
                                    <asp:TextBox ID="txt_Names" class="form-control" placeholder="John" runat="server" />
                                    <%-- Validadores --%>
                                    <asp:RequiredFieldValidator ID="validator_names" runat="server"
                                        ForeColor="Red" ErrorMessage="*" ControlToValidate="txt_Names"/>
                                </div>
                                <div class="container py-2">
                                    <label for="txt_Surnames" class="text-light">Apellidos</label>
                                    <asp:TextBox ID="txt_Surnames" class="form-control" placeholder="Doe" runat="server" />
                                    <%-- Validadores --%>
                                    <asp:RequiredFieldValidator ID="validator_snames" runat="server"
                                        ForeColor="Red" ErrorMessage="*" ControlToValidate="txt_Surnames"/>
                                </div>
                                <div class="container py-2">
                                    <label for="txt_Childs" class="text-light">Numero de hijos</label>
                                    <asp:TextBox ID="txt_Childs" class="form-control" placeholder="0" runat="server" />
                                    <%-- Validador --%>
                                    <asp:RangeValidator ID="validator_range_childs" runat="server" Type="Integer" MinimumValue="0"
                                        ForeColor="Yellow" ErrorMessage="Debe ser un número entero mayor a 0" ControlToValidate="txt_Childs" MaximumValue="2147483647"/>
                                </div>
                                <div class="container py-2">
                                    <label for="txt_Salary" class="text-light">Salario</label>
                                    <asp:TextBox ID="txt_Salary" class="form-control" placeholder="14800" runat="server" />
                                    <%-- Validador --%>
                                    <asp:RangeValidator ID="validator_range_sal" runat="server" Type="Double" MinimumValue="0"
                                        ForeColor="Yellow" ErrorMessage="Debe ser un número mayor a 0" ControlToValidate="txt_Salary" MaximumValue="9999999999999999" />
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
                                    <asp:Image ID="img_container_worker" runat="server" CssClass="img-thumbnail" ImageAlign="Middle" Style="height: 19vw" EnableTheming="True" />
                                </div>
                                <div class="custom-file">
                                    <asp:FileUpload ID="img_input" ClientIDMode="Static" CssClass="custom-file-input" runat="server" onchange="UploadFile(this)"/>
                                    <asp:Label ID="img_label" runat="server" AssociatedControlID="img_input" CssClass="custom-file-label" Text="Elegir archivo" />
                                </div>
                                <asp:Label ID="lbl_invalid" runat="server" Text="No es una imagen válida" Visible="false" ForeColor="Red" />
                            </div>
                        </div>
                    </div>

                    <div class="container py-2">
                        <asp:Button type="button" ID="btn_Submit" class="btn btn-primary btn-lg L-20" Text="Registrar Trabajador" runat="server" OnClick="Btn_Submit_Click" />
                        <asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="Upload" Style="display: none" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%-- Metodo depende de la validacion #3 --%>
    <script language="javascript">
        function UploadFile(fileUpload) {
            Page_IsValid = true;
            if (fileUpload.value != '') {
                document.getElementById("<%=btnUpload.ClientID %>").click();
            }
        }
    </script>
</asp:Content>
