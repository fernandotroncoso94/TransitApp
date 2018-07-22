<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/AdminNav.Master" AutoEventWireup="true" CodeBehind="GestionAlumnos.aspx.cs" Inherits="TransitApp.Vistas.GestionAlumnos" %>
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
            <h4 class="text-center text-info">Gestión Alumnos</h4>
                            <asp:Label ID="lbRutAlumno" runat="server" CssClass="text-hide" Text=""></asp:Label>

                            <asp:Label ID="Label1" CssClass="text-info" runat="server" Text="Nombres:"></asp:Label>
                            <asp:TextBox ID="txtNombre" CssClass="form-control" ValidationGroup="G1" runat="server"></asp:TextBox>
                            <%--VALIDAR QUE ESTE EL NOMBRE--%>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="G1"  Display="Dynamic" ControlToValidate="txtNombre" ForeColor="Red" ErrorMessage="*Faltan los Nombres." ></asp:RequiredFieldValidator>
                            
                            <%-- VALIDAR QUE SEAN SOLO LETRAS--%>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtNombre" runat="server" ValidationExpression="[A-Za-z ]*" ErrorMessage="*Sólo letras." ForeColor="Red"></asp:RegularExpressionValidator>
                            <br />

                            <asp:Label ID="Label4" CssClass="text-info" runat="server" Text="Apellidos:"></asp:Label>
                            <asp:TextBox ID="txtApellido" CssClass="form-control" ValidationGroup="G1" runat="server"></asp:TextBox>
                            <%--VALIDAR QUE ESTE EL APELLIDO--%>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="G1"  Display="Dynamic" ControlToValidate="txtApellido" ForeColor="Red" ErrorMessage="*Faltan los Apellido." ></asp:RequiredFieldValidator>
                            
                            <%-- VALIDAR QUE SEAN SOLO LETRAS--%>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="txtApellido" runat="server" ValidationExpression="[A-Za-z ]*" ErrorMessage="*Sólo letras." ForeColor="Red"></asp:RegularExpressionValidator>
                            <br />



                            <asp:Label ID="Label69" CssClass="text-info" runat="server" Text="Rut:"></asp:Label>
                            <asp:TextBox ID="txtRut" MaxLength="11" CssClass="form-control" ValidationGroup="G1" runat="server"></asp:TextBox>
                            <%--VALIDAR QUE ESTE EL RUT--%>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="G1"  Display="Dynamic" ControlToValidate="txtRut" ForeColor="Red" ErrorMessage="Falta el RUT." ></asp:RequiredFieldValidator>
                           <br />

                            <asp:Label ID="Label7" CssClass="text-info" runat="server" Text="Carrera:"></asp:Label>
                            <asp:DropDownList ID="DDCarreras" ValidationGroup="G1" CssClass="form-control" runat="server">
                                <asp:ListItem Selected="True"  Value="0">Seleccione Carrera</asp:ListItem>
                                <asp:ListItem Value="Ing. Administracion de Empresas mencion Marketing y Ventas">Ing. Administracion de Empresas mencion Marketing y Ventas</asp:ListItem>
                                <asp:ListItem Value="Ing. en Administracion de Empresas mencion Finanzas">Ing. en Administracion de Empresas mencion Finanzas</asp:ListItem>
                                <asp:ListItem Value="Contador Auditor">Contador Auditor</asp:ListItem>
                                <asp:ListItem Value="Ing. Comercial">Ing. Comercial</asp:ListItem>
                                <asp:ListItem Value="Contabilidad General">Contabilidad General</asp:ListItem>
                                <asp:ListItem Value="Administracion de Empresas">Administracion de Empresas</asp:ListItem>
                                <asp:ListItem Value="Ing. Agrícola">Ing. Agrícola</asp:ListItem>
                                <asp:ListItem Value="Tecnologia Agricola">Tecnologia Agricola</asp:ListItem>
                                <asp:ListItem Value="Ing. en Construccion">Ing. en Construcción</asp:ListItem>
                                <asp:ListItem Value="Ing. en Geomensura">Ing. en Geomensura</asp:ListItem>
                                <asp:ListItem Value="Construccion Civil">Construccion Civil</asp:ListItem>
                                <asp:ListItem Value="Topografia">Topografia</asp:ListItem>
                                <asp:ListItem Value="Edificacion">Edificacion</asp:ListItem>
                                <asp:ListItem Value="Ing. en Electricidad">Ing. en Electricidad</asp:ListItem>
                                <asp:ListItem Value="Electricidad Industrial">Electricidad Industrial</asp:ListItem>
                                <asp:ListItem Value="Admin. Gastronómica Internacional">Admin. Gastronómica Internacional</asp:ListItem>
                                <asp:ListItem Value="Gastronomía Internacional">Gastronomía Internacional</asp:ListItem>
                                <asp:ListItem Value="Psicopedagogia">Psicopedagogia</asp:ListItem>
                                <asp:ListItem Value="Trabajo Social">Trabajo Social</asp:ListItem>
                                <asp:ListItem Value="Ing. en Informatica">Ing. en Informatica</asp:ListItem>
                                <asp:ListItem Value="Analista Programador">Analista Programador</asp:ListItem>
                                <asp:ListItem Value="Telecomunicaciones, Conectividad y Redes">Telecomunicaciones, Conectividad y Redes</asp:ListItem>
                                <asp:ListItem Value="Ing. Mecanica en Mantenimiento Industrial">Ing. Mecanica en Mantenimiento Industrial</asp:ListItem>
                                <asp:ListItem Value="Ing. en Maquinaria, Vehiculos Automotrices y Sist. Electronicos">Ing. en Maquinaria, Vehiculos Automotrices y Sist. Electronicos</asp:ListItem>
                                <asp:ListItem Value="Mantenimiento Industrial">Mantenimiento Industrial</asp:ListItem>
                                <asp:ListItem Value="Mecanica Automotriz en Sistemas Electrónicos">Mecanica Automotriz en Sistemas Electronicos</asp:ListItem>
                                <asp:ListItem Value="Mecanica Automotriz en Maquinaria Pesada">Mecanica Automotriz en Maquinaria Pesada</asp:ListItem>
                                <asp:ListItem Value="Ing. Industrial">Ing. Industrial</asp:ListItem>
                                <asp:ListItem Value="Ing. en Prevención de Riesgos, Calidad y Ambiente">Ing. en Prevencion de Riesgos, Calidad y Ambiente</asp:ListItem>
                                <asp:ListItem Value="Prevencion de Riesgos">Prevencion de Riesgos</asp:ListItem>
                                <asp:ListItem Value="Logistica y Operaciones Industriales">Logistica y Operaciones Industriales</asp:ListItem>
                                <asp:ListItem Value="Tecnico en Enfermeria">Tecnico en Enfermeria</asp:ListItem>
                            </asp:DropDownList>
                            <%--VALIDAR QUE SELECCIONE CARRERA--%>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Seleccione carrera." ValidationGroup="G1" Display="Dynamic" ForeColor="Red" ControlToValidate="DDCarreras" InitialValue="0"></asp:RequiredFieldValidator>
                            <br />

                            <asp:Label ID="Label10" CssClass="text-info" runat="server" Text="Jornada:"></asp:Label>
                            <asp:DropDownList ID="DDJornada" ValidationGroup="G1" CssClass="form-control" runat="server">
                                <asp:ListItem Value="0" Selected="True" Text="Seleccionar"></asp:ListItem>
                                <asp:ListItem Value="Diurno">Diurno</asp:ListItem>
                                <asp:ListItem Value="Vespertino">Vespertino</asp:ListItem>
                            </asp:DropDownList>
                            <%--VALIDAR QUE SELECCIONE JORNADA--%>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="G1" ErrorMessage="*Seleccione jornada." Display="Dynamic" ForeColor="Red" ControlToValidate="DDJornada" InitialValue="0"></asp:RequiredFieldValidator>
                            <br />



                            <asp:Label ID="Label2" CssClass="text-info" runat="server" Text="ID Bicicleta:"></asp:Label>
                            <asp:TextBox ID="txtIDBicicleta" CssClass="form-control" ValidationGroup="G1" runat="server"></asp:TextBox>
                            <%--VALIDAR QUE ESTE EL ID--%>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="G1"  Display="Dynamic" ControlToValidate="txtIDBicicleta" ForeColor="Red" ErrorMessage="*Falta ID de la Bicicleta." ></asp:RequiredFieldValidator>
                            
                            <%-- VALIDAR QUE SEAN SOLO NUMEROS--%>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtIDBicicleta" ValidationGroup="G1" runat="server" ValidationExpression="^[0-9]*" ErrorMessage="*Sólo números" ForeColor="red"></asp:RegularExpressionValidator>
                            <br />





             
                            </div>
                        <div class="panel-footer center-block"> 
                 <asp:Button ID="btnAgregar" CssClass="btn btn-success btn-sm center-block" ValidationGroup="G1" OnClick="btnAgregar_Click" runat="server" Text="Agregar" />
                            <asp:Label ID="LbCarrera" runat="server" Text="" CssClass="hidden"></asp:Label>
            
                        </div>
                    </asp:Panel>


         

                </div>


    <div class="panel-dan"></div>


                <div class="col-md-8">
                     <asp:Panel ID="Panel2" CssClass="panel panel-info" runat="server">

                        <div class="panel-heading">
                            <h2 class="text-primary text-center">Listado Alumnos</h2>
                           
                             
                        </div>

                        <div class="panel-body">
               
                          <asp:GridView ID="GridView1" AllowPaging="true" PageSize="15" OnPageIndexChanging="GridView1_PageIndexChanging" CssClass="table table-striped table-responsive table.borded" OnRowCommand="GridView1_RowCommand"
                                AutoGenerateColumns="false" runat="server">
                                 <PagerStyle HorizontalAlign="Center" CssClass="GridPager" />
                                <EmptyDataTemplate>
                                    <h4 class="text-danger text-center">SIN DATOS</h4>
                                </EmptyDataTemplate>
                                <Columns>
                                    <asp:BoundField HeaderText="Rut" DataField="RutA" />
                                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                                    <asp:BoundField HeaderText="Carrera" DataField="Carrera" />
                                    <asp:BoundField HeaderText="Jornada" DataField="Jornada" />
                                    <asp:BoundField HeaderText="ID Bici" DataField="IDBicicleta" />
                                    <asp:BoundField HeaderText="Marca" DataField="MarcaBici" />
                                    <asp:BoundField HeaderText="Color" DataField="ColorBici" />
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
                                    <h4 class="modal-title" id="myModalLabel">Editar Guardia</h4>
                                </div>

                                <div class="modal-body">

                                   <asp:Label ID="Label3" CssClass="text-info" runat="server" Text="Nombre:"></asp:Label>
                            <asp:TextBox ID="txtNombreEdit" CssClass="form-control" ValidationGroup="G2" runat="server"></asp:TextBox>
                            <%--VALIDAR QUE ESTE EL NOMBRE--%>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="G2"  Display="Dynamic" ControlToValidate="txtNombreEdit" ForeColor="Red" ErrorMessage="*Falta el Nombre." ></asp:RequiredFieldValidator>
                            
                            <%-- VALIDAR QUE SEAN SOLO LETRAS--%>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="txtNombreEdit" ValidationGroup="G2" runat="server" ValidationExpression="[A-Za-z ]*" ErrorMessage="*Sólo letras"></asp:RegularExpressionValidator>
                            <br />


                      
                            

                            <asp:Label ID="Label5" CssClass="text-info" runat="server" Text="Carrera:"></asp:Label>
                                <asp:DropDownList ID="DDCarreraEdit" ValidationGroup="G2" CssClass="form-control" runat="server">
                                   <asp:ListItem  Value="0">Seleccione Carrera</asp:ListItem>
                                <asp:ListItem Value="Ing. Administracion de Empresas mencion Marketing y Ventas">Ing. Administracion de Empresas mencion Marketing y Ventas</asp:ListItem>
                                <asp:ListItem Value="Ing. en Administracion de Empresas mencion Finanzas">Ing. en Administracion de Empresas mencion Finanzas</asp:ListItem>
                                <asp:ListItem Value="Contador Auditor">Contador Auditor</asp:ListItem>
                                <asp:ListItem Value="Ing. Comercial">Ing. Comercial</asp:ListItem>
                                <asp:ListItem Value="Contabilidad General">Contabilidad General</asp:ListItem>
                                <asp:ListItem Value="Administracion de Empresas">Administracion de Empresas</asp:ListItem>
                                <asp:ListItem Value="Ing. Agrícola">Ing. Agrícola</asp:ListItem>
                                <asp:ListItem Value="Tecnologia Agricola">Tecnologia Agricola</asp:ListItem>
                                <asp:ListItem Value="Ing. en Construccion">Ing. en Construcción</asp:ListItem>
                                <asp:ListItem Value="Ing. en Geomensura">Ing. en Geomensura</asp:ListItem>
                                <asp:ListItem Value="Construccion Civil">Construccion Civil</asp:ListItem>
                                <asp:ListItem Value="Topografia">Topografia</asp:ListItem>
                                <asp:ListItem Value="Edificacion">Edificacion</asp:ListItem>
                                <asp:ListItem Value="Ing. en Electricidad">Ing. en Electricidad</asp:ListItem>
                                <asp:ListItem Value="Electricidad Industrial">Electricidad Industrial</asp:ListItem>
                                <asp:ListItem Value="Admin. Gastronómica Internacional">Admin. Gastronómica Internacional</asp:ListItem>
                                <asp:ListItem Value="Gastronomía Internacional">Gastronomía Internacional</asp:ListItem>
                                <asp:ListItem Value="Psicopedagogia">Psicopedagogia</asp:ListItem>
                                <asp:ListItem Value="Trabajo Social">Trabajo Social</asp:ListItem>
                                <asp:ListItem Value="Ing. en Informatica">Ing. en Informatica</asp:ListItem>
                                <asp:ListItem Value="Analista Programador">Analista Programador</asp:ListItem>
                                <asp:ListItem Value="Telecomunicaciones, Conectividad y Redes">Telecomunicaciones, Conectividad y Redes</asp:ListItem>
                                <asp:ListItem Value="Ing. Mecanica en Mantenimiento Industrial">Ing. Mecanica en Mantenimiento Industrial</asp:ListItem>
                                <asp:ListItem Value="Ing. en Maquinaria, Vehiculos Automotrices y Sist. Electronicos">Ing. en Maquinaria, Vehiculos Automotrices y Sist. Electronicos</asp:ListItem>
                                <asp:ListItem Value="Mantenimiento Industrial">Mantenimiento Industrial</asp:ListItem>
                                <asp:ListItem Value="Mecanica Automotriz en Sistemas Electrónicos">Mecanica Automotriz en Sistemas Electronicos</asp:ListItem>
                                <asp:ListItem Value="Mecanica Automotriz en Maquinaria Pesada">Mecanica Automotriz en Maquinaria Pesada</asp:ListItem>
                                <asp:ListItem Value="Ing. Industrial">Ing. Industrial</asp:ListItem>
                                <asp:ListItem Value="Ing. en Prevención de Riesgos, Calidad y Ambiente">Ing. en Prevencion de Riesgos, Calidad y Ambiente</asp:ListItem>
                                <asp:ListItem Value="Prevencion de Riesgos">Prevencion de Riesgos</asp:ListItem>
                                <asp:ListItem Value="Logistica y Operaciones Industriales">Logistica y Operaciones Industriales</asp:ListItem>
                                <asp:ListItem Value="Tecnico en Enfermeria">Tecnico en Enfermeria</asp:ListItem>
                            </asp:DropDownList>
                                    <%--VALIDAR QUE SELECCIONE CARRERA--%>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*Seleccione carrera." ValidationGroup="G2" Display="Dynamic" ForeColor="Red" ControlToValidate="DDCarreraEdit" InitialValue="0"></asp:RequiredFieldValidator>
                            <br />


                            <asp:Label ID="Label6" CssClass="text-info" runat="server" Text="Jornada:"></asp:Label>
                            <asp:DropDownList ID="DDJornadaEdit" ValidationGroup="G2" CssClass="form-control" runat="server">
                                <asp:ListItem Value="0" Selected="True" Text="Seleccionar..."></asp:ListItem>
                                <asp:ListItem Value="Diurno">Diurno</asp:ListItem>
                                <asp:ListItem Value="Vespertino">Vespertino</asp:ListItem>
                            </asp:DropDownList>
                            <%--VALIDAR QUE SELECCIONE JORNADA--%>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="G2" ErrorMessage="*Seleccione jornada." Display="Dynamic" ForeColor="Red" ControlToValidate="DDJornadaEdit" InitialValue="0"></asp:RequiredFieldValidator>
                            <br />



                            <asp:Label ID="Label8" CssClass="text-info" runat="server" Text="ID Bicicleta:"></asp:Label>
                            <asp:TextBox ID="txtIDBicicletaEdit" CssClass="form-control" ValidationGroup="G2" runat="server"></asp:TextBox>
                            <%--VALIDAR QUE ESTE EL ID--%>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ValidationGroup="G2"  Display="Dynamic" ControlToValidate="txtIDBicicletaEdit" ForeColor="Red" ErrorMessage="Falta ID de la Bicicleta." ></asp:RequiredFieldValidator>
                            
                            <%-- VALIDAR QUE SEAN SOLO NUMEROS--%>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="txtIDBicicletaEdit" ValidationGroup="G2" runat="server" ValidationExpression="^[0-9]*" ErrorMessage="*Sólo Números permitidos"></asp:RegularExpressionValidator>
                           
                                </div>

                                <div class="modal-footer">
                                    <asp:Button ID="btnCancelControlID" runat="server" CssClass="btn btn-danger btn-sm" Text="Cancelar" />
                                    <asp:Button ID="btnEditar" CssClass="btn btn-warning btn-sm" ValidationGroup="G2" OnClick="btnEditar_Click" runat="server" Text="Editar" />


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
                                <h3 class="text-center text-danger">¿Realmente desea eliminar el Alumno?</h3>
                                </div>

                                <div class="modal-footer">
                                    <asp:Button ID="btnCancelarEliminacion" runat="server" CssClass="btn btn-warning btn-lg" Text="Cancelar" />
                                    <asp:Button ID="btnEliminar" CssClass="btn btn-danger btn-lg" OnClick="btnEliminar_Click" runat="server" Text="Eliminar" />


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
                                   <asp:Label ID="LbRespuestaM" Font-Size="Large" runat="server" Text=""></asp:Label>
                                      </strong>*


                                </div>

                                <div class="modal-footer">
                                    <asp:LinkButton ID="LinkButton3" CssClass="btn btn-default btn-lg"  runat="server">Cerrar</asp:LinkButton>

                                    


                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                  <asp:Button ID="Button2" runat="server" CssClass="hidden" Text="Button" />
                    


    
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender3" BackgroundCssClass="text-primary" TargetControlID="Button2" PopupControlID="PanelRespuesta" OkControlID="LinkButton3" CancelControlID="LinkButton2" runat="server">
    </ajaxToolkit:ModalPopupExtender>




    

</asp:Content>
