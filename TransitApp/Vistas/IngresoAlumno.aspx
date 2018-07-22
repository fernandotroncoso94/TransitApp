<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/GuardiaNav.Master" AutoEventWireup="true" CodeBehind="IngresoAlumno.aspx.cs" Inherits="TransitApp.Vistas.IngresoAlumno" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        
     <div class="col-sm-2">
         <asp:Label ID="LbRut" runat="server" Text="" CssClass="hidden"></asp:Label>
     </div>
        <div class="col-sm-8">
         
    


          <asp:Panel ID="PanelAgregar" CssClass="panel panel-success" runat="server">

                        <div class="panel-heading">
                            <h1 class="text-center primary-text" ><strong>INGRESO</strong></h1>
                            <h5 class="text-center primary-text"><strong>El alumno y la Bicicleta ya deben estar registrados en TransitApp</strong></h5>
                        </div>
                        <div class="panel-body">

        <div class="input-group input-group-lg">
        <asp:Label ID="Label1" runat="server" CssClass="input-group-addon text-info" Text="Rut:"></asp:Label>
        <asp:TextBox ID="txtRut" CssClass="form-control" runat="server"></asp:TextBox>
        </div><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="G1"  Display="Dynamic" ControlToValidate="txtRut" ForeColor="Red" ErrorMessage="*Falta Rut Alumno." ></asp:RequiredFieldValidator>         
        

        <br />
        <div class="input-group input-group-lg">
            
        <asp:Label ID="Label2" runat="server" CssClass="input-group-addon" Text="ID Bicicleta:"></asp:Label>
        <asp:TextBox ID="txtIDBici" CssClass="form-control" runat="server"></asp:TextBox>
        </div>    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtIDBici" ValidationGroup="G1" runat="server" ValidationExpression="^[0-9]*" ErrorMessage="*Sólo números, sin espacios." ForeColor="red"></asp:RegularExpressionValidator>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="G1"  Display="Dynamic" ControlToValidate="txtIDBici" ForeColor="Red" ErrorMessage="*Falta ID de la Bicicleta." ></asp:RequiredFieldValidator>            

                            </div>
        <div class="panel-footer">
        
            <div class="btn-group btn-group-lg"> 
        <asp:LinkButton ID="BtnOtraBicicleta" CssClass="btn btn-warning btn-lg" OnClick="BtnOtraBicicleta_Click" runat="server">Viene en otra bicicleta?    <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span></asp:LinkButton> 
        <asp:LinkButton ID="btnIngresar" CssClass="btn btn-success btn-lg" OnClick="btnIngresar_Click"  runat="server">Ingresar    <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span></asp:LinkButton>
        </div>
            <asp:Panel ID="Panel_error" runat="server" CssClass="hidden">
                 <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong>Error</strong> Intente nuevamente.
        </asp:Panel><br />
        <asp:Label ID="lbRespuesta" runat="server" Text="" CssClass="hidden"></asp:Label>
    </div>

              </asp:Panel>
            </div>
        <div class="col-sm-2"></div>





                           <%--OTRA BICICLETA --%>

                    <asp:Panel Style="display: none" ID="PanelOtraBicicleta_PopupControlID" CssClass="modal-dialog" role="document" runat="server">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">

                                <div class="modal-header">
                                    <asp:LinkButton ID="LinkButton2" runat="server" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span> 
                                    </asp:LinkButton>
                                    <h2 class="modal-title text-danger" id="myModalLabelO"><strong> ATENCION!<//strong></h2>
                                </div>

                                <div class="modal-body">

                                    <h1 class="text-center text-danger">EL ALUMNO VIENE EN UNA BICICLETA DIFERENTE</h1>
                                    <br />
                                    <div class="alert alert-warning">
                                        <h2>Agregar un comentario si desea ingresarlo de todas maneras...</h2>
                                        <asp:TextBox ID="txtComentario" CssClass="form-control" Font-Size="Larger" runat="server">
                                        </asp:TextBox>
                                        
                                    </div>


                                </div>

                                <div class="modal-footer">
                                    <asp:LinkButton ID="Button2" CssClass="btn btn-danger btn-lg"  runat="server">No Ingresar <span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"></span></asp:LinkButton>

                                    <asp:LinkButton ID="BtnOtraBici" CssClass="btn btn-success btn-lg"  OnClick="BtnCambiarDeBicicleta_Click" runat="server">Ingresar en la nueva Bicicleta <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span></asp:LinkButton>
                                   



                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                  <asp:Button ID="Button4" runat="server" CssClass="hidden" Text="Button" />
                    


    
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender3" BackgroundCssClass="text-primary" TargetControlID="Button4" PopupControlID="PanelOtraBicicleta_PopupControlID" OkControlID="LinkButton2" CancelControlID="Button2" runat="server">
    </ajaxToolkit:ModalPopupExtender>







     </div>
   

</asp:Content>
