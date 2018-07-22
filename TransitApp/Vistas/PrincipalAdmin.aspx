<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/AdminNav.Master" AutoEventWireup="true" CodeBehind="PrincipalAdmin.aspx.cs" Inherits="TransitApp.Vistas.PrincipalAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1"  runat="server">
    <br /><br /><br />
      <div class="site-wrapper-inner">
        <div class="col-sm-6">

        <h2 class="text-success text-center"><strong> Bienvenido</strong></h2>
            <asp:Label ID="LbNombre" CssClass="text-success text-center" runat="server" Font-Size="X-Large"></asp:Label>
    <h3 class="text-center text-success"><strong>Por favor, seleccione alguna de las opciones disponibles en la barra superior.</strong></h3>
             
      
            <asp:Image ID="Image1"  ImageUrl="~/img/Logo_sm2.png" style="opacity: 0.8;" CssClass="img-responsive center-block" runat="server"/>
    
        <img src="../img/inacap.png" width="100" style="opacity: 0.5;" class="center-block" />
    </div>
          </div>
    <div class="col-sm-6"></div>

            
</asp:Content>
