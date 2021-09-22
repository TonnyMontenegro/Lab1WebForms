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
                                <div class="col-sm">
                                    <label for="txt_ID" class="text-light">Cedula</label>
                                    <asp:TextBox ID="txt_ID" CssClass="form-control" placeholder="003-190787-0007D" runat="server" />
                                    <%-- Validadores --%>
                                    <asp:RequiredFieldValidator ID="validator_id" runat="server" 
                                        ForeColor="Red"  ErrorMessage="*" ControlToValidate="txt_ID" />
                                    <asp:RegularExpressionValidator ID="validator_regex_id" runat="server"
                                        ErrorMessage="La cédula no es válida" ForeColor="Yellow" ControlToValidate="txt_ID"
                                        ValidationExpression="[0-9]{3}-[0-9]{6}-[0-9]{4}[A-Z]"/>
                                </div>
                                <div class="col-sm">
                                    <label for="txt_Names" class="text-light">Nombres</label>
                                    <asp:TextBox ID="txt_Names" CssClass="form-control" placeholder="John" runat="server" />
                                    <%-- Validadores --%>
                                    <asp:RequiredFieldValidator ID="validator_names" runat="server"
                                        ForeColor="Red" ErrorMessage="*" ControlToValidate="txt_Names"/>
                                </div>
                                <div class="col-sm">
                                    <label for="txt_Surnames" class="text-light">Apellidos</label>
                                    <asp:TextBox ID="txt_Surnames" CssClass="form-control" placeholder="Doe" runat="server" />
                                    <%-- Validadores --%>
                                    <asp:RequiredFieldValidator ID="validator_snames" runat="server"
                                        ForeColor="Red" ErrorMessage="*" ControlToValidate="txt_Surnames"/>
                                </div>
                                <div class="col-sm">
                                    <label for="txt_Childs" class="text-light">Numero de hijos</label>
                                    <asp:TextBox ID="txt_Childs" CssClass="form-control" placeholder="0" runat="server" />
                                    <%-- Validador --%>
                                    <asp:RangeValidator ID="validator_range_childs" runat="server" Type="Integer" MinimumValue="0"
                                        ForeColor="Yellow" ErrorMessage="Debe ser un número entero mayor a 0" ControlToValidate="txt_Childs" MaximumValue="2147483647"/>
                                </div>
                                <div class="col-sm">
                                    <label for="txt_Salary" class="text-light">Salario</label>
                                    <asp:TextBox ID="txt_Salary" CssClass="form-control" placeholder="14800" runat="server" />
                                    <%-- Validadores --%>
                                    <asp:RangeValidator ID="validator_range_sal" runat="server" Type="Double" MinimumValue="0"
                                        ForeColor="Yellow" ErrorMessage="Debe ser un número mayor a 0" ControlToValidate="txt_Salary" MaximumValue="9999999999999999" />
                                    <asp:RequiredFieldValidator ID="validator_salary" runat="server"
                                        ForeColor="Red" ErrorMessage="*" ControlToValidate="txt_Salary"/>
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
                                    <img id="img_Profile" src="<%= ImgSwap %>"" class="img-thumbnail" style="height: 19vw"
                                        alt="Si no selecciona una imagen, se cargará una por defecto"/>
                                </div>
                                <div class="custom-file">
                                    <label class="custom-file-label" id="lbl_ImgName" for="file">Elegir archivo</label>
                                    <input class="custom-file-input" type="file" accept="image/*" name="input_ImageFile" onchange="loadFile(event)">
                                </div>
                                <asp:Label ID="lbl_invalid" runat="server" Text="No es una imagen válida" Visible="false" ForeColor="Red" />
                            </div>
                        </div>
                    </div>

                    <div class="container py-2">
                        <asp:Button ID="btn_Submit" CssClass="btn btn-primary btn-lg L-20" Text="Registrar Trabajador" runat="server" OnClick="Btn_Submit_Click" />
                        <asp:Button ID="btn_Cancel" runat="server" Text="Cancelar" Visible="false"
                            CssClass="btn btn-danger btn-lg L-20" Style="margin-top: 2vh" OnClick="Btn_Cancel_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%-- Metodo depende de la validacion #3 --%>
    <script language="javascript">
        function checkMode() {
            if ("<%= Action.ToString() %>" == "UPDATE") {
                document.getElementById('lbl_ImgName').style.display = 'none';
            }
        }

        function loadFile(fileInput) {
            if (fileInput.value != '') {
                var image = document.getElementById('img_Profile');
                var imageLabel = document.getElementById('lbl_ImgName');
                image.src = URL.createObjectURL(fileInput.target.files[0]);
                imageLabel.innerText = fileInput.target.files[0].name;
            }
        }

        window.onload = checkMode;
    </script>
</asp:Content>
