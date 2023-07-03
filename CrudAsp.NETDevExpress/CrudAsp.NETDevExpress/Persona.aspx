<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Persona.aspx.cs" Inherits="CrudAsp.NETDevExpress.Persona" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Olimac Services</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxGridView Width="100%" ID="gridViewPersona" runat="server" DataSourceID="SqlDSPersonaa" AutoGenerateColumns="False" KeyFieldName="id">
                <SettingsEditing Mode="PopupEditForm"></SettingsEditing>

                <Settings ShowGroupPanel="True" ShowFilterRow="True"></Settings>

                <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True"></SettingsBehavior>
                <SettingsPopup>
                    <EditForm HorizontalAlign="WindowCenter" VerticalAlign="WindowCenter" Modal="True"></EditForm>
                </SettingsPopup>
                <SettingsSearchPanel Visible="True"></SettingsSearchPanel>
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" VisibleIndex="1">
                        <EditFormSettings Visible="False"></EditFormSettings>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="nombre" VisibleIndex="2"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="apellido" VisibleIndex="3"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="edad" VisibleIndex="4"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="domicilio" VisibleIndex="5"></dx:GridViewDataTextColumn>
                </Columns>
                <Toolbars>
                    <dx:GridViewToolbar ItemAlign="Right">
                        <Items>
                            <dx:GridViewToolbarItem Command="New" Name="New" BeginGroup="True" Text="New"></dx:GridViewToolbarItem>
                            <dx:GridViewToolbarItem Name="Edit" Text="Edit" BeginGroup="True" Command="Edit"></dx:GridViewToolbarItem>
                            <dx:GridViewToolbarItem Name="Delete" Text="Delete" Command="Delete"></dx:GridViewToolbarItem>
                        </Items>
                    </dx:GridViewToolbar>
                </Toolbars>
            </dx:ASPxGridView>
            <asp:SqlDataSource runat="server" ID="SqlDSPersonaa" ConnectionString='<%$ ConnectionStrings:practicas_safsConnectionString %>' SelectCommand="SELECT [id], [nombre], [apellido], [edad], [domicilio] FROM [tabla_persona]" InsertCommand="INSERT  INTO tabla_persona (  nombre, apellido, domicilio, edad )
 VALUES ( 	   @nombre, @apellido, @domicilio,   @edad )"
                UpdateCommand="update  tabla_persona set    nombre = @nombre, apellido = @apellido, domicilio = @domicilio, edad = @edad 
where id = @id"
                DeleteCommand="delete from tabla_persona where id = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="nombre"></asp:Parameter>
                    <asp:Parameter Name="apellido"></asp:Parameter>
                    <asp:Parameter Name="domicilio"></asp:Parameter>
                    <asp:Parameter Name="edad"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nombre"></asp:Parameter>
                    <asp:Parameter Name="apellido"></asp:Parameter>
                    <asp:Parameter Name="domicilio"></asp:Parameter>
                    <asp:Parameter Name="edad"></asp:Parameter>
                    <asp:Parameter Name="id"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
    </form>
</body>
</html>

