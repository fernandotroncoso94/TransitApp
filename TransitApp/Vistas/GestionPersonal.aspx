<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/AdminNav.Master" AutoEventWireup="true" CodeBehind="GestionPersonal.aspx.cs" Inherits="TransitApp.Vistas.GestionPersonal" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                <div class="col-md-4">
                  <asp:Panel ID="PanelAgregar" CssClass="panel panel-info" runat="server">

                        <div class="panel-heading">
                            <h2 class="text-center primary-text" >Formulario</h2>
                        </div>
                        <div class="panel-body">
            <h4 class="text-center text-info">Gestión Personal</h4>
                            <asp:Label ID="lbRutGuardia" runat="server" CssClass="text-hide" Text=""></asp:Label>

                            <asp:Label ID="Label1" CssClass="text-info" runat="server" Text="Nombre Completo:"></asp:Label>
                            <asp:TextBox ID="txtNombre" CssClass="form-control" ValidationGroup="G1" runat="server"></asp:TextBox>
                            <%--VALIDAR QUE ESTE EL NOMBRE--%>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="G1"  Display="Dynamic" ControlToValidate="txtNombre" ForeColor="Red" ErrorMessage="*Falta el Nombre" ></asp:RequiredFieldValidator>
                            
                            <%-- VALIDAR QUE SEAN SOLO LETRAS--%>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtNombre" ValidationGroup="G1" runat="server" ValidationExpression="[A-Za-z ]*" ErrorMessage="*Sólo letras."></asp:RegularExpressionValidator>
                            <br />

                            <asp:Label ID="Label2" CssClass="text-info" runat="server" Text="Clave:"></asp:Label>
                            <asp:TextBox ID="txtClave" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                            <%--VALIDAR QUE ESTE EL PASSWORD ESTE--%>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator" ValidationGroup="G1" runat="server" ErrorMessage="*Ingrese Password." ControlToValidate="txtClave" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <br />




                            <asp:Label ID="Label9" CssClass="text-info" runat="server" Text="Rut:"></asp:Label>
                            <asp:TextBox ID="txtRutG" MaxLength="15" CssClass="form-control" runat="server"></asp:TextBox>
                            <%--VALIDAR QUE ESTE EL RUT--%>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="G1"  Display="Dynamic" ControlToValidate="txtRutG" ForeColor="Red" ErrorMessage="Falta el Rut" ></asp:RequiredFieldValidator>
                            
                            <br />


                            <asp:Label ID="Label4" CssClass="text-info" runat="server" Text="Rol:"></asp:Label>
                            <asp:DropDownList ID="DDRol" CssClass="form-control" runat="server">
                                <asp:ListItem Value="0" Selected="True">Seleccione</asp:ListItem>
                                <asp:ListItem Value="Administrador">Administrador</asp:ListItem>
                                <asp:ListItem Value="Guardia">Guardia</asp:ListItem>

                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Seleccione Rol." ValidationGroup="G1" Display="Dynamic" ForeColor="Red" ControlToValidate="DDRol" InitialValue="0"></asp:RequiredFieldValidator>
                            



                            <br />

                     <asp:Label ID="Label5" CssClass="text-info" runat="server" Text="Estado"></asp:Label>
                            <asp:DropDownList ID="DDEstado" CssClass="form-control" runat="server">
                                <asp:ListItem Value="2" Selected="True" Text="Seleccionar"></asp:ListItem>
                                <asp:ListItem Value="1">Activo</asp:ListItem>
                                <asp:ListItem Value="0">Inactivo</asp:ListItem>

                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*Seleccione estado." ValidationGroup="G1" Display="Dynamic" ForeColor="Red" ControlToValidate="DDEstado" InitialValue="2"></asp:RequiredFieldValidator>
                            
                            <br />


                            </div>
                        <div class="panel-footer center-block"> 
                 <asp:Button ID="btnAgregar" CssClass="btn btn-success btn-sm center-block" ValidationGroup="G1" OnClick="btnAgregar_Click" runat="server" Text="Agregar" />
            
                        </div>
                    </asp:Panel>


         

                </div>



                <div class="col-md-8">
                     <asp:Panel ID="Panel2" CssClass="panel panel-info" runat="server">

                        <div class="panel-heading">
                            <h2 class="text-primary text-center">Listado Personal</h2>
                           
                             
                        </div>

                        <div class="panel-body">
               
                          <asp:GridView ID="GridView1" AllowPaging="true" PageSize="10" OnPageIndexChanging="GridView1_PageIndexChanging" CssClass="table table-striped table.borded" OnRowCommand="GridView1_RowCommand"
                                AutoGenerateColumns="false" runat="server">
                                 <PagerStyle HorizontalAlign="Center" CssClass="GridPager" />
                                <EmptyDataTemplate>
                                    <h4 class="text-danger text-center">SIN DATOS</h4>
                                </EmptyDataTemplate>
                                <Columns>
                                    <asp:BoundField HeaderText="Rut" DataField="Rut" />
                                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                                    <asp:BoundField HeaderText="Estado" DataField="Estado" />
                                    <asp:ButtonField CommandName="btnEliminar" ButtonType="Link" ControlStyle-CssClass="btn btn-danger btn-sm"
                                        HeaderText="Eliminar" Text="X" />
                                   <asp:ButtonField CommandName="btnSeleccionar" ButtonType="Link" ControlStyle-CssClass="btn btn-warning btn-sm"
                                        HeaderText="Seleccionar" Text="Selecionar"/>
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
                                    <h4 class="modal-title" id="myModalLabel">Editar Guardia</h4>
                                </div>

                                <div class="modal-body">

                                    <asp:Label ID="Label3" CssClass="text-info" runat="server" Text="Nombre:"></asp:Label>
                                    <asp:TextBox ID="txtNombreEdit" CssClass="form-control" ValidationGroup="GE" runat="server"></asp:TextBox><br />
                                    <%--VALIDAR QUE INGRESE NOMBRE--%>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*Ingrese Nombre" ForeColor="Red" Display="Dynamic" ControlToValidate="txtNombreEdit"></asp:RequiredFieldValidator>
                                    <%--VALIDAR QUE SEAN SOLO LETRAS--%>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtNombreEdit" ValidationGroup="GE" runat="server" ValidationExpression="[A-Za-z ]*" ErrorMessage="*Sólo letras."></asp:RegularExpressionValidator>
                           
                                    <br />
                                    <asp:Label ID="Label6" CssClass="text-info" runat="server" Text="Clave:"></asp:Label>
                                    <asp:TextBox ID="txtClaveEdit" ValidationGroup="GE" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox><br />
                                    <%--VALIDAR QUE INGRESE CLAVE--%>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="GE" ControlToValidate="txtClaveEdit" runat="server" ErrorMessage="*Ingrese Clave" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

                                    <br />
                                    <asp:Label ID="Label8" CssClass="text-info" runat="server" Text="Estado"></asp:Label>
                                    <asp:DropDownList ID="DropDownListEstadoEdit" ValidationGroup="GE" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="#" Enabled="false" Selected="True" Text="Seleccionar"></asp:ListItem>
                                        <asp:ListItem Value="1">Activo</asp:ListItem>
                                        <asp:ListItem Value="0">Inactivo</asp:ListItem>
                                    </asp:DropDownList>
                                    <%--VALIDAR QUE SELECCIONE ESTADO--%>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="DropDownListEstadoEdit" ValidationGroup="GE" runat="server" ForeColor="Red" ErrorMessage="*Seleccione Estado" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>

                                <div class="modal-footer">
                                    <asp:Button ID="btnCancelControlID" runat="server" CssClass="btn btn-danger btn-sm" Text="Cancelar" />
                                    <asp:Button ID="btnEditar" ValidationGroup="GE" CssClass="btn btn-warning btn-sm" OnClick="btnEditar_Click" runat="server" Text="Editar" />


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
                                <h3 class="text-center text-danger">¿Realmente desea eliminar el Guardia?</h3>
                                </div>

                                <div class="modal-footer">
                                    <asp:Button ID="btnCancelarEliminacion" runat="server" CssClass="btn btn-warning btn-lg" Text="Cancelar" />
                                   
                                     <asp:LinkButton ID="BotonEliminar" OnClick="BotonEliminar_Click" CssClass="btn btn-danger btn-lg" runat="server"> 
                                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                        <strong> Eliminar</strong> </asp:LinkButton>


                                        <%--  
                                     <asp:Button ID="btnEliminar" CssClass="btn btn-danger btn-lg" OnClick="btnEliminar_Click" runat="server" Text="Eliminar" />
                                        --%>
                                       
                              </div>
                            </div>
                        </div>
                    </asp:Panel>
<ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" BackgroundCssClass="text-danger" TargetControlID="btnEliminarTargetControlID" PopupControlID="Panel1" OkControlID="LinkButton1" CancelControlID="btnCancelarEliminacion" runat="server" />
    
                    
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
    

</asp:Content>

