<%@ Page Title="Consultas - Estudiantes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QueryStd.aspx.cs" Inherits="Lab1WebForms.QueryStd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron Mcard border border-primary">
        <h2 class="text-light text-center">Estadisticas y edicion de registros para estudiantes <i class="fas fa-user-graduate fa-xl"></i></h2>
        <hr>

        <div class="container-fluid">
            <div class="row justify-content-md-center">
                <div class="col-md-auto">
                    <asp:UpdatePanel ID="up_id_exists" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="txt_ID" runat="server" CssClass="form-control" placeholder="2021-0007F" />
                            <%-- Validadores --%>
                            <asp:RegularExpressionValidator ID="validador_regex_id" runat="server"
                                ForeColor="Yellow" ErrorMessage="El carnet no es válido" ControlToValidate="txt_ID"
                                ValidationExpression="20[0-2][0-9]-[0-9]{4}[A-Z]" />
                            <asp:CustomValidator ID="validator_id_exists" runat="server"
                                ForeColor="Red" ErrorMessage="El carnet no existe"
                                ControlToValidate="txt_ID" OnServerValidate="IDValidation">
                            </asp:CustomValidator>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="col-md-auto">
                    <asp:Button ID="btn_Search" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="BtnSearch_Click" />
                </div>
                <div class="col-md-auto">
                    <asp:Button ID="btn_Modify" runat="server" Text="Modificar" CssClass="btn btn-primary" OnClick="BtnModify_Click" />
                </div>
                <div class="col-md-auto">
                    <asp:Button ID="btn_Delete" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClick="BtnDelete_Click" />
                </div>
                <div class="col-md-auto">
                    <asp:Button ID="btn_Sort" runat="server" Text="Ordenar estudiantes" CssClass="btn btn-primary" OnClick="BtnSort_Click" />
                </div>
            </div>

            <asp:UpdatePanel ID="up_DataArea" runat="server" >
                <ContentTemplate>
                    <div class="row justify-content-md-center">
                        <div class="col-md-auto">
                            <asp:Button ID="btn_RestoreTable" runat="server" Text="Todos los registros" CssClass="btn btn-secondary" Visible="False" OnClick="BtnRestore_Click" />
                        </div>
                    </div>

                    <div class="row justify-content-md-center">
                        <asp:Panel ID="panel_Avg" runat="server" CssClass="col-4">
                            <div style="padding: 10%">
                                <span class="badge badge-dark">
                                    <asp:Label ID="lbl_GlobalAvg" runat="server"></asp:Label>
                                </span>
                            </div>
                        </asp:Panel>

                        <asp:Panel ID="panel_Best" runat="server" CssClass="col-4">
                            <div style="padding: 10%">
                                <span class="badge badge-dark">
                                    <asp:Label ID="lbl_BestStd" runat="server"></asp:Label>
                                </span>
                            </div>
                        </asp:Panel>

                        <div class="table-responsive">
                            <asp:GridView ID="gvw_StudentData" runat="server" CssClass="table table-striped table-dark table-hover" />
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btn_Search" EventName="Click"/>
                    <asp:AsyncPostBackTrigger ControlID="btn_Modify" EventName="Click"/>
                    <asp:AsyncPostBackTrigger ControlID="btn_Delete" EventName="Click"/>
                    <asp:AsyncPostBackTrigger ControlID="btn_RestoreTable" EventName="Click"/>
                </Triggers>
            </asp:UpdatePanel>

            <asp:UpdatePanel ID="up_WarningMessage" runat="server">
                <ContentTemplate>
                    <asp:Panel ID="panel_warning" runat="server"
                        CssClass="card bg-dark" BorderColor="Yellow"
                            Style="width:36vw; text-align: center; margin-left: auto; margin-right: auto">
                        <asp:Label ID="lbl_Warning" runat="server" Text="Sin datos para mostrar"
                            Font-Bold="True" Font-Size="Medium" ForeColor="Yellow" />
                    </asp:Panel>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btn_Sort" EventName="Click"/>
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
