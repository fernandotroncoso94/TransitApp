using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TransitApp.Vistas
{
    public partial class InformesAdmin : System.Web.UI.Page
    {
        transit1_transitappEntities  contexto = new transit1_transitappEntities();

        private void TodosLosMovimientos()
        {
            var lista = from a in contexto.Alumno
                        join b in contexto.Bicicleta
                                on a.IDBicicleta equals b.IDBicicleta
                        select new
                        {

                            Nombre = a.Nombre,
                            RutA = a.RutA,
                            Carrera = a.Carrera,
                            HoraIngreso = a.HoraIngreso,
                            HoraSalida = a.HoraSalida,
                            IDBicicleta = a.IDBicicleta,
                            Anterior = a.IDBicicletaAnterior,
                            Jornada = a.Jornada,
                            Color = b.Color,
                            Marca = b.Marca,
                            Comentario = a.Comentario

                        };

            GridView1.DataSource = lista.ToList();
            GridView1.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TodosLosMovimientos();

                try
                {
                    LbTotalAlumnos.Text = "<strong>Total de alumnos en TransitApp: </strong> " + Convert.ToString(contexto.Alumno.Count());
                    LbTotalBicicletas.Text = "<strong>Total de bicicletas regitradas en TransitApp: </strong> " + Convert.ToString(contexto.Bicicleta.Count());


                    


                    DateTime startDateTime = DateTime.Today; //Today at 00:00:00
                    DateTime endDateTime = DateTime.Today.AddDays(1).AddTicks(-1); //Today at 23:59:59
                    
                    int TotalIngreso = (from a in contexto.Alumno.OrderByDescending(n => n.HoraIngreso)
                                        where (a.HoraIngreso >= startDateTime && a.HoraIngreso <= endDateTime)
                                        select new { a.RutA }).Count();

                    int TotalSalida = (from a in contexto.Alumno.OrderByDescending(n => n.HoraSalida)
                                       where (a.HoraSalida >= startDateTime && a.HoraSalida <= endDateTime)
                                       select new { a.RutA }).Count();



                    LbTotalIngresosHoy.Text = "<strong>Alumnos que han ingresado hoy: </strong> " + TotalIngreso;

                    LbTotalSalidasHoy.Text = "<strong>Alumnos que han salido hoy: </strong> " + TotalSalida;

                    int AlumnosDentro = TotalIngreso - TotalSalida;
                    LbAlumnosDentro.Text = "<strong>Aun quedan "+AlumnosDentro+" alumnos sin retirar su bicicleta de TransitApp HOY</strong>";


                }
                catch (Exception)
                {
                }


            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                String rut = txtBuscar.Text;
                var listaMovimientos = from a in contexto.Alumno
                                       where a.RutA == rut
                                       join b in contexto.Bicicleta
                                         on a.IDBicicleta equals b.IDBicicleta
                                       select new
                                       {

                                           Nombre = a.Nombre,
                                           RutA = a.RutA,
                                           Carrera = a.Carrera,
                                           HoraIngreso = a.HoraIngreso,
                                           HoraSalida = a.HoraSalida,
                                           IDBicicleta = a.IDBicicleta,
                                           Anterior = a.IDBicicletaAnterior,
                                           Jornada = a.Jornada,
                                           Color = b.Color,
                                           Marca = b.Marca

                                       };

                GridView1.DataSource = listaMovimientos.ToList();
                GridView1.DataBind();
            }
            catch (Exception)
            {
            }
           
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            TodosLosMovimientos();
        }

        protected void btnMostrarTodo_Click(object sender, EventArgs e)
        {
            TodosLosMovimientos();
        }
    }
}