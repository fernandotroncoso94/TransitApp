<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/GuardiaNav.Master" AutoEventWireup="true" CodeBehind="SalidaAlumno.aspx.cs" Inherits="TransitApp.Vistas.SalidaAlumno" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="container text-center">
        

             <div class="col-sm-2"></div>
        <div class="col-sm-8">
         
    


          <asp:Panel ID="PanelSalida" CssClass="panel panel-danger" runat="server">

                        <div class="panel-heading">
                            <h1 class="text-center" ><strong>SALIDA</strong></h1>
                            <h5 class="text-center"><strong>El alumno y la Bicicleta ya deben estar registrados en TransitApp</strong></h5>
                            <h5 class="text-center">Además de haber ya ingresado en el recinto.</h5>
                        </div>
                        <div class="panel-body">


     
       

        <div class="input-group input-group-lg">
        <asp:Label ID="Label1" runat="server" CssClass="input-group-addon text-info" Text="Rut:"></asp:Label>
        <asp:TextBox ID="txtRut" CssClass="form-control" ValidationGroup="G1" runat="server"></asp:TextBox>
          </div>  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="G1"  Display="Dynamic" ControlToValidate="txtRut" ForeColor="Red" ErrorMessage="*Falta Rut Alumno." ></asp:RequiredFieldValidator>         
        


        <br />
        <div class="input-group input-group-lg">
            
        <asp:Label ID="Label2" runat="server" CssClass="input-group-addon" Text="ID Bicicleta:"></asp:Label>
        <asp:TextBox ID="txtIDBici" CssClass="form-control" ValidationGroup="G1" runat="server"></asp:TextBox>
         </div>    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtIDBici" ValidationGroup="G1" runat="server" ValidationExpression="^[0-9]*" ErrorMessage="*Sólo números, sin espacios." ForeColor="red"></asp:RegularExpressionValidator>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="G1"  Display="Dynamic" ControlToValidate="txtIDBici" ForeColor="Red" ErrorMessage="*Falta ID de la Bicicleta." ></asp:RequiredFieldValidator>            

        
                            </div>
        <div class="panel-footer">
        <asp:LinkButton ID="btnSalir" ValidationGroup="G1" CssClass="btn btn-danger btn-lg" OnClick="btnSalir_Click"  runat="server">Retirar    <span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"></span></asp:LinkButton>
         <br />
         
               
     

            </div>
              </asp:Panel>
            </div>
            <div class="col-sm-2"></div>
    </div>
     


    <asp:Label ID="LbIdBici" CssClass="hidden" runat="server" Text=""></asp:Label>
    <asp:Label ID="LbRutAlumno" CssClass="hidden" runat="server" Text=""></asp:Label>

          <%--OTRA BICICLETA --%>

                    <asp:Panel Style="display: none" ID="PanelOtraBicicleta_PopupControlID" CssClass="modal-dialog" role="document" runat="server">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">

                                <div class="modal-header">
                                    <asp:LinkButton ID="LinkButton2" runat="server" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span> 
                                    </asp:LinkButton>
                                    <h2 class="modal-title text-danger" id="myModalLabelO">ATENCION!</h2>
                                </div>

                                <div class="modal-body">

                                    <h1 class="text-center text-danger">EL ALUMNO INTENTA SALIR CON UNA BICICLETA DIFERENTE</h1>



                                </div>

                                <div class="modal-footer">
                                    <asp:LinkButton ID="Button2" CssClass="btn btn-danger btn-lg"  runat="server">Cerrar <span class="glyphicon glyphicon-alert" aria-hidden="true"></span></asp:LinkButton>

                                    


                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                  <asp:Button ID="Button4" runat="server" CssClass="hidden" Text="Button" />
                    


    
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" BackgroundCssClass="text-primary" TargetControlID="Button4" PopupControlID="PanelOtraBicicleta_PopupControlID" OkControlID="LinkButton2" CancelControlID="Button2" runat="server">
    </ajaxToolkit:ModalPopupExtender>




              <%--RESPUESTA --%>

                    <asp:Panel Style="display: none" ID="PanelRespuesta" CssClass="modal-dialog" role="document" runat="server">
                        <div class="modal-dialog modal-sm" role="document">
                            <div class="modal-content">

                                <div class="modal-header">
                                    <asp:LinkButton ID="LinkButton1" runat="server" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span> 
                                    </asp:LinkButton>
                                    <img class="img-responsive" src="../img/Logo_sm2.png" />

                                </div>

                                <div class="modal-body">

                                  <strong>
                                   <asp:Label ID="LbRespuesta" Font-Size="Large" runat="server" Text=""></asp:Label>
                                      </strong>*


                                </div>

                                <div class="modal-footer">
                                    <asp:LinkButton ID="LinkButton3" CssClass="btn btn-default btn-lg"  runat="server">Cerrar</asp:LinkButton>

                                    


                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                  <asp:Button ID="Button1" runat="server" CssClass="hidden" Text="Button" />
                    


    
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" BackgroundCssClass="text-primary" TargetControlID="Button1" PopupControlID="PanelRespuesta" OkControlID="LinkButton1" CancelControlID="Button1" runat="server">
    </ajaxToolkit:ModalPopupExtender>














   

</asp:Content>
