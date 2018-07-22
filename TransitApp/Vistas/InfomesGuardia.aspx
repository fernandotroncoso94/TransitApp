<%@ Page Title="" Language="C#" MasterPageFile="~/Vistas/GuardiaNav.Master" AutoEventWireup="true" CodeBehind="InfomesGuardia.aspx.cs" Inherits="TransitApp.Vistas.InfomesGuardia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="col-md-12">
           
                     <asp:Panel ID="Panel2" CssClass="panel panel-info" runat="server">

                         <div class="panel-heading">
                             <h2 class="text-primary text-center">Listado Movimientos</h2>
                             <br />
                             <div class="input-group">
                                 <asp:TextBox ID="txtBuscar" CssClass="form-control" runat="server"></asp:TextBox>
                                 <div class="input-group-btn">



                                     <asp:LinkButton ID="btnBuscar" OnClick="btnBuscar_Click" runat="server" CssClass="btn btn-success btn-lg" Text="Buscar"><span class="glyphicon glyphicon-search"></span>&nbsp;Buscar</asp:LinkButton>
                                     <asp:Button ID="btnMostrarTodo" OnClick="btnMostrarTodo_Click" CssClass="btn btn-warning btn-lg" runat="server" Text="Mostrar Todo" />
                                 </div>
                                 <asp:Label ID="lbRespuesta" CssClass="hidden" runat="server" Text=""></asp:Label>
                             </div>
                         </div>


                        <div class="panel-body">
               
                            <div class="alert alert-info">

                               
                                <asp:Label ID="LbTotalAlumnos" runat="server" Text=""></asp:Label><br />
                                <asp:Label ID="LbTotalBicicletas" runat="server" Text=""></asp:Label><br />
                                <asp:Label ID="LbTotalIngresosHoy" runat="server" Text=""></asp:Label><br />
                                <asp:Label ID="LbTotalSalidasHoy" runat="server" Text=""></asp:Label>
                                </div>
                            <div class="alert alert-warning">
                              ATENCION!  <asp:Label ID="LbAlumnosDentro" runat="server" Text=""></asp:Label>
                            </div>
                            </div>
                            
 
                    <asp:GridView ID="GridView1" CssClass="table table-striped table-responsive"
                        AutoGenerateColumns="false" runat="server" PageSize="15" OnPageIndexChanging="GridView1_PageIndexChanging">
                        <PagerStyle HorizontalAlign = "Center" CssClass = "GridPager" />
                        <EmptyDataTemplate><h4 class="text-danger text-center">SIN DATOS</h4></EmptyDataTemplate>
                        <Columns>
                            <asp:BoundField HeaderText="Nombre" DataField="Nombre"/>
                            <asp:BoundField HeaderText="Rut" DataField="RutA"/>
                            <asp:BoundField HeaderText="Comentario" ControlStyle-CssClass="text-danger" DataField="Comentario"/>
                            <asp:BoundField HeaderText="Carrera" DataField="Carrera"/>
                            <asp:BoundField HeaderText="Entrada" DataField="HoraIngreso"/>
                            <asp:BoundField HeaderText="Salida" DataField="HoraSalida"/>
                            <asp:BoundField HeaderText="ID Bicicleta" DataField="IDBicicleta"/>
                            <asp:BoundField HeaderText="Bicicleta Anterior" DataField="Anterior"/>
                            <asp:BoundField HeaderText="Jornada" DataField="Jornada"/>
                            <asp:BoundField HeaderText="Color" DataField="Color"/>
                            <asp:BoundField HeaderText="Marca" DataField="Marca"/>
                        </Columns>

                    </asp:GridView>
                            
                    </asp:Panel>
                        </div>
               
</asp:Content>
