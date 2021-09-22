<%@ Page Title="Registro de estudiantes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegStd.aspx.cs" Inherits="Lab1WebForms.RegStd" %>

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
        <h2 class="text-light text-center">Formulario de registro para estudiantes <i class="fas fa-user-graduate fa-xl"></i></h2>
        <hr>
        <asp:Panel ID="panel_message" runat="server" CssClass="card notify bg-dark" BorderColor="#2CBA20" Visible="False">
                <asp:Label ID="lbl_message" runat="server" Text="Notificaciones" Font-Bold="True" Font-Size="Medium" ForeColor="#2CBA20" />
        </asp:Panel>

        <div class="container-fluid">
            <div class="form-row">
                <div class="col-sm">
                    <label for="txt_ID" class="text-light">Carnet</label>
                    <asp:TextBox ID="txt_ID" CssClass="form-control" placeholder="2021-0007X" runat="server" />
                    <%-- Validadores --%>
                    <asp:RequiredFieldValidator ID="validator_id" runat="server" 
                        ForeColor="Red"  ErrorMessage="*" ControlToValidate="txt_ID" />
                    <asp:RegularExpressionValidator ID="validador_regex_id" runat="server"
                        ForeColor="Yellow" ErrorMessage="El carnet no es válido" ControlToValidate="txt_ID"
                        ValidationExpression="20[0-2][0-9]-[0-9]{4}[A-Z]" />
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
                    <asp:TextBox ID="txt_Surnames" CssClass="form-control" placeholder="Doe" runat="server"/>
                    <%-- Validadores --%>
                    <asp:RequiredFieldValidator ID="validator_snames" runat="server"
                        ForeColor="Red" ErrorMessage="*" ControlToValidate="txt_Surnames"/>
                </div>
            </div>


            <div class="form-row">
                <div class="col-sm">
                    <label for="txt_IP" class="text-light">Primer parcial</label>
                    <asp:TextBox ID="txt_IP" CssClass="form-control" placeholder="0 - 35" runat="server" />
                    <%-- Validador --%>
                    <asp:RangeValidator ID="validator_range_ip" runat="server" ControlToValidate="txt_IP"
                        ErrorMessage="El valor debe estar entre 0 y 35" Type="Double"
                        MinimumValue="0" MaximumValue="35" ForeColor="Yellow" />
                </div>
                <div class="col-sm">
                    <label for="txt_IIP" class="text-light">Segundo parcial</label>
                    <asp:TextBox ID="txt_IIP" CssClass="form-control" placeholder="0 - 35" runat="server" />
                    <%-- Validador --%>
                    <asp:RangeValidator ID="validator_range_iip" runat="server" ControlToValidate="txt_IIP"
                        ErrorMessage="El valor debe estar entre 0 y 35" Type="Double"
                        MinimumValue="0" MaximumValue="35" ForeColor="Yellow" />
                </div>
                <div class="col-sm">
                    <label for="txt_SIST" class="text-light">Sistematicos</label>
                    <asp:TextBox ID="txt_SIST" CssClass="form-control" placeholder="0 - 30" runat="server" />
                    <%-- Validador --%>
                    <asp:RangeValidator ID="validator_range_sist" runat="server" ControlToValidate="txt_SIST"
                        ErrorMessage="El valor debe estar entre 0 y 30" Type="Double"
                        MinimumValue="0" MaximumValue="30" ForeColor="Yellow" />
                </div>
            </div>

            <div>
                <asp:Button type="button" ID="btn_Submit" runat="server"
                    Text="Registrar Estudiante"  CssClass="btn btn-primary btn-lg" OnClick="Btn_Submit_Click" />
                <asp:Button ID="btn_Cancel" runat="server" Text="Cancelar" Visible="false"
                    CssClass="btn btn-danger btn-lg" Style="margin-left: 5vw" OnClick="Btn_Cancel_Click" />
            </div>
        </div>
    </div>
</asp:Content>
