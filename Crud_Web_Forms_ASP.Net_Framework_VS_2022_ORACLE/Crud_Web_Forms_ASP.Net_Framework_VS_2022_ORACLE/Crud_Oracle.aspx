<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Crud_Oracle.aspx.cs" Inherits="Crud_Web_Forms_ASP.Net_Framework_VS_2022_ORACLE.Crud_Oracle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Crud Oracle</title>
</head>
<body>
    <nav class="navbar navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand">Olimac Services</a>
    <form class="d-flex">
      <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success" type="submit">Search</button>
    </form>
  </div>
</nav>
    <form id="form1" runat="server">
     <div class="mb-3">
    <asp:Label runat="server" id="exampleLabelEmail1" class="form-label">Email address</asp:Label>
    <asp:TextBox runat="server" type="email" class="form-control" id="exampleInputEmail1"  ></asp:TextBox>  
  </div>
  <div class="mb-3">
    <asp:Label runat="server" id="exampleLabelPassword1" class="form-label">Password</asp:Label>
    <asp:TextBox  runat="server"  class="form-control" id="exampleInputPassword1"></asp:TextBox>
  </div>
  
  <asp:Button  runat="server" OnClick="btnSubmit"  class="btn btn-primary"/> 
    </form>


</body>
</html>


<!--
    Instalar el paquete de NuGet Oracle.ManagedDataAccess
    >
