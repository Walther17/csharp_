<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Crud_Web_Forms_ASP.Net_Framework_VS_2022.Pages.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Home
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">




      <form runat="server">

          <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Deseas eliminar este registro?
</h5> <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
        <asp:LinkButton runat="server"  class="btn btn-primary" ID="BtnDelete" OnClick="BtnDelete_Click">Sí</asp:LinkButton>
      </div>
      </div>
    </div>
  </div>
       
        <div class="mx-auto" style="width:300px">
            <h2>Listado de registros</h2>
        </div>
    
        <div class="container row">
            <div  >
            <asp:Button runat="server" ID="BtnCreate" CssClass="btn btn-success form-control-sm" Text="Create" OnClick="BtnCreate_Click"/>
                <br/>
                 <br/>  
                <asp:GridView style="width:123%!important" runat="server" ID="gvusuarios" class="table table-striped table-hover">
                    <Columns>
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button runat="server" Text="Read" CssClass="btn form-control-sm btn-info" ID="BtnRead" OnClick="BtnRead_Click"/>
                                <asp:Button runat="server" Text="Update" CssClass="btn form-control-sm btn-warning" ID="BtnUpdate" OnClick="BtnUpdate_Click"/>
                                <asp:LinkButton runat="server" CssClass="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">Eliminar</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</asp:Content>
 