<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/GuardiaNav.Master" AutoEventWireup="true" CodeBehind="GestionBiciG.aspx.cs" Inherits="TransitApp.Vistas.GestionBiciG" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
       <div class="col-md-4">
                  <asp:Panel ID="PanelAgregar" CssClass="panel panel-info" runat="server">

                        <div class="panel-heading">
                            <h2 class="text-center primary-text" >Formulario</h2>
                        </div>
                        <div class="panel-body">
            <h4 class="text-center text-info">Gestión Bicicletas</h4>
                            <asp:Label ID="lbIDBici" runat="server" CssClass="text-hide" Text=""></asp:Label>

                            <asp:Label ID="Label1" CssClass="text-info" runat="server" Text="ID"></asp:Label>
                            <asp:TextBox ID="txtID" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                            <br />

                            <asp:Label ID="Label2" CssClass="text-info" runat="server" Text="Color:"></asp:Label>
                            <asp:TextBox ID="txtColor" CssClass="form-control" ValidationGroup="G2" runat="server"></asp:TextBox>
                            <%--VALIDAR QUE ESTE EL PASSWORD ESTE--%>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ValidationGroup="G1" ErrorMessage="*Escriba un color" ControlToValidate="txtColor" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <%-- VALIDAR QUE SEAN SOLO LETRAS--%>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="txtColor" ValidationGroup="G1" runat="server" ValidationExpression="[A-Za-z ]*" ErrorMessage="*Debe escribir sólo letras." ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                            
                            <br />




                            <asp:Label ID="Label9" CssClass="text-info" runat="server" Text="Marca:"></asp:Label>
                            <asp:TextBox ID="txtMarca" CssClass="form-control" ValidationGroup="G1" runat="server"></asp:TextBox>
                            <%--VALIDAR QUE ESTE LA MARCA--%>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="G1"  Display="Dynamic" ControlToValidate="txtMarca" ForeColor="Red" ErrorMessage="*Falta la Marca de la Bicicleta." ></asp:RequiredFieldValidator>
                            <br />

                            
                            <asp:Label ID="Label4" CssClass="text-info" runat="server" Text="Foto:"></asp:Label>
                            <ajaxToolkit:AsyncFileUpload  OnClientUploadError="uploadError" OnClientUploadComplete="uploadComplete" EnableViewState="true" PersistFile="true"
                              runat="server" ID="AsyncFileUpload1" UploaderStyle="Modern" CssClass="form-inline" CompleteBackColor="White"
                              UploadingBackColor="#CCFFFF" ThrobberID="imgLoader"  OnUploadedComplete="FileUploadComplete" />
                            
                       

                            </div>
                        <div class="panel-footer center-block"> 
                 <asp:Button ID="btnAgregar" CssClass="btn btn-success btn-lg center-block" ValidationGroup="G1" OnClick="btnAgregar_Click" runat="server" Text="Agregar" />
        <asp:Label ID="LbImagen" CssClass="hidden" runat="server" Text=""></asp:Label>
                            <asp:Label ID="LbUrl" runat="server" CssClass="hidden" Text=""></asp:Label>
                        </div>
                    </asp:Panel>

                </div>



                <div class="col-md-8">
                     <asp:Panel ID="Panel2" CssClass="panel panel-info" runat="server">

                        <div class="panel-heading">
                            <h2 class="text-primary text-center">Listado Bicicletas</h2>
                           
                             
                        </div>

                        <div class="panel-body">
               
                          <asp:GridView ID="GridView1" AllowPaging="true" PageSize="5" OnPageIndexChanging="GridView1_PageIndexChanging" CssClass="table table-striped table.borded" OnRowCommand="GridView1_RowCommand"
                                AutoGenerateColumns="false" runat="server">
                                 <PagerStyle HorizontalAlign = "Center" CssClass = "GridPager" />


                                <EmptyDataTemplate>
                                    <h4 class="text-danger text-center">SIN DATOS</h4>
                                </EmptyDataTemplate>
                                <Columns>
                                    <asp:BoundField HeaderText="ID" ControlStyle-ForeColor="Black" DataField="IDBicicleta" />
                                    <asp:BoundField HeaderText="Color" DataField="Color" />
                                    <asp:BoundField HeaderText="Marca" DataField="Marca" />
                                    <asp:ImageField HeaderText="Foto" ItemStyle-CssClass="img-responsive img-rounded" ControlStyle-Width="94" DataImageUrlField="Foto">
                                    
                                    </asp:ImageField>
                                    <asp:ButtonField CommandName="btnEliminar" ButtonType="Link" ControlStyle-CssClass="btn btn-danger btn-sm"
                                        HeaderText="Eliminar" Text="X" />
                                    <asp:ButtonField CommandName="btnSeleccionar" ButtonType="Link" ControlStyle-CssClass="btn btn-warning btn-sm"
                                        HeaderText="Seleccionar" Text="Selecionar" />
                                </Columns>
                            </asp:GridView>
 
                    
                            </div>
                    </asp:Panel>
                </div>



 


          <%--EDITAR --%>

                    <asp:Panel Style="display: none" ID="Panel_PopupControlID" CssClass="modal-dialog" role="document" runat="server">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">

                                <div class="modal-header">
                                    <asp:LinkButton ID="btnOkControlID" runat="server" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span> 
                                    </asp:LinkButton>
                                    <h2 class="modal-title" id="myModalLabel">Editar Bicicleta</h2>
                                </div>

                                <div class="modal-body">

                                    <asp:Label ID="Label3" CssClass="text-info" runat="server" Text="Color:"></asp:Label>
                                    <asp:TextBox ID="txtColorEdit" CssClass="form-control" ValidationGroup="G2" runat="server"></asp:TextBox>
                                     <%--VALIDAR QUE ESTE EL PASSWORD ESTE--%>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="G2" ErrorMessage="*Escriba un color" ControlToValidate="txtColorEdit" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <%-- VALIDAR QUE SEAN SOLO LETRAS--%>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtColorEdit" ValidationGroup="G2" runat="server" ValidationExpression="[A-Za-z ]*" ErrorMessage="*Debe escribir sólo letras." ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                           <br />

                                    <asp:Label ID="Label6" CssClass="text-info" runat="server" Text="Marca:"></asp:Label>
                                    <asp:TextBox ID="txtMarcaEdit" CssClass="form-control" ValidationGroup="G2" runat="server"></asp:TextBox>
                                       <%--VALIDAR QUE ESTE LA MARCA--%>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="G2"  Display="Dynamic" ControlToValidate="txtMarcaEdit" ForeColor="Red" ErrorMessage="*Falta la Marca de la Bicicleta." ></asp:RequiredFieldValidator>
                            <br /><br />

                                </div>

                                <div class="modal-footer">
                                    <asp:Button ID="btnCancelControlID" runat="server" CssClass="btn btn-danger btn-sm" Text="Cancelar" />
                                    <asp:Button ID="btnEditar" CssClass="btn btn-warning btn-sm" OnClick="btnEditar_Click" ValidationGroup="G2" runat="server" Text="Editar" />


                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                  <asp:Button ID="Button1" runat="server" CssClass="hidden" Text="Button" />
                    


    
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" BackgroundCssClass="text-primary" TargetControlID="Button1" PopupControlID="Panel_PopupControlID" OkControlID="btnOkControlID" CancelControlID="btnCancelControlID" runat="server">
                    </ajaxToolkit:ModalPopupExtender>





                  <%--  ELIMINAR--%>

                    <asp:Button ID="btnEliminarTargetControlID" runat="server" CssClass="hidden" Text="Button" />
                        <asp:Panel Style="display: none" ID="Panel1" CssClass="modal-dialog" role="document" runat="server">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">

                                <div class="modal-header">
                                    <asp:LinkButton ID="LinkButton1" runat="server" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span> 
                                    </asp:LinkButton>
                                    <h4 class="modal-title" id="H1">CONFIRMACIÓN</h4>
                                </div>

                                <div class="modal-body">
                                <h3 class="text-center text-danger">¿Realmente desea eliminar la Bicicleta?</h3>
                                </div>

                                <div class="modal-footer">
                                    <asp:Button ID="btnCancelarEliminacion" runat="server" CssClass="btn btn-warning btn-lg" Text="Cancelar" />
                                    <asp:Button ID="btnEliminar" CssClass="btn btn-danger btn-lg" OnClick="btnEliminar_Click" runat="server" Text="Eliminar" />
                                 </div>
                            </div>
                        </div>
                    </asp:Panel>
 

<ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" BackgroundCssClass="text-danger" TargetControlID="btnEliminarTargetControlID" PopupControlID="Panel1" OkControlID="LinkButton1" CancelControlID="btnCancelarEliminacion" runat="server" />
    
                    
         </div>


                      <%--RESPUESTA --%>

                    <asp:Panel Style="display: none" ID="PanelRespuesta" CssClass="modal-dialog" role="document" runat="server">
                        <div class="modal-dialog modal-sm" role="document">
                            <div class="modal-content">

                                <div class="modal-header">
                                    <asp:LinkButton ID="LinkButton2" runat="server" class="close" data-dismiss="modal" aria-label="Close">
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
                  <asp:Button ID="Button2" runat="server" CssClass="hidden" Text="Button" />
                    


    
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtenderRespuesta" BackgroundCssClass="text-primary" TargetControlID="Button2" PopupControlID="PanelRespuesta" OkControlID="LinkButton3" CancelControlID="LinkButton2" runat="server">
    </ajaxToolkit:ModalPopupExtender>
    <script type="text/javascript">
    function uploadComplete(sender) {
        $get("<%=LbRespuesta.ClientID%>").innerHTML = "Listo!";
    }
 
    function uploadError(sender) {
        $get("<%=LbRespuesta.ClientID%>").innerHTML = "Error...";
    }
</script>





</asp:Content>
