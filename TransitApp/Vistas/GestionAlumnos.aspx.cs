using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TransitApp.Vistas
{
    public partial class GestionAlumnos : System.Web.UI.Page
    {
        transit1_transitappEntities contexto = new transit1_transitappEntities();
        int IdCarrera = 0;

        private void MostrarAlumnos()
        {
            try
            {
                var listaAlumnos = from a in contexto.Alumno
                                   join b in contexto.Bicicleta
                                           on a.IDBicicleta equals b.IDBicicleta
                                   select new
                                   {
                                       Nombre = a.Nombre,
                                       RutA = a.RutA,
                                       Carrera = a.Carrera,
                                       Jornada = a.Jornada,
                                       IDBicicleta = a.IDBicicleta,
                                       MarcaBici = b.Marca,
                                       ColorBici = b.Color


                                   };

                GridView1.DataSource = listaAlumnos.ToList();
                GridView1.DataBind();
            }
            catch (Exception)
            {
                
                
            }
 
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MostrarAlumnos();
            }
        }

      

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                    String nombre = txtNombre.Text.ToUpper()+" "+txtApellido.Text.ToUpper();
                    String rut = txtRut.Text;
                    String carrera = Convert.ToString(DDCarreras.SelectedItem);
                    String jornada = Convert.ToString(DDJornada.SelectedValue);
                    int idbicicleta = Convert.ToInt32(txtIDBicicleta.Text);



                    Alumno a = new Alumno { Nombre = nombre, RutA = rut, Carrera = carrera, Jornada = jornada, IDBicicleta = idbicicleta};
                    contexto.Alumno.Add(a);
                    int i = contexto.SaveChanges(); //Si se agrega correctamente se retorna un 1

                    if (i == 1)
                    {
                        LbRespuestaM.CssClass = "text-success tex-center";
                        LbRespuestaM.Text = "ALUMNO AGREGADO EXITOSAMENTE!";
                        ModalPopupExtender3.Show();
                        MostrarAlumnos();

                        //Limpiar Controles
                        txtNombre.Text = "";
                        txtApellido.Text = "";
                        txtRut.Text = "";
                        DDCarreras.SelectedIndex = 0;
                        DDJornada.SelectedIndex = 0;
                        txtIDBicicleta.Text = "";

                    }


            }
            catch (Exception)
            {

                LbRespuestaM.CssClass = "text-danger text-center";
                LbRespuestaM.Text = "ERROR* <br /> Intente llenar todos los datos nuevamente de forma correcta.";
                ModalPopupExtender3.Show();
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            MostrarAlumnos();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int fila = Convert.ToInt32(e.CommandArgument);
                String RutAlumno = GridView1.Rows[fila].Cells[0].Text;
                String nombre = GridView1.Rows[fila].Cells[1].Text;
                String carrera = GridView1.Rows[fila].Cells[2].Text;
                String jornada = GridView1.Rows[fila].Cells[3].Text;
                int IDBici = Convert.ToInt32(GridView1.Rows[fila].Cells[4].Text);
                LbCarrera.Text = carrera;

                if (e.CommandName == "btnEliminar")
                {
                    lbRutAlumno.Text = GridView1.Rows[fila].Cells[0].Text;
                    ModalPopupExtender1.Show();
                }
                else
                    if (e.CommandName == "btnSeleccionar")
                    {
                        lbRutAlumno.Text = RutAlumno.TrimEnd();
                        txtNombreEdit.Text = nombre.ToUpper().TrimEnd();
                        txtIDBicicletaEdit.Text = IDBici.ToString().TrimEnd();
                        DDCarreraEdit.SelectedValue = LbCarrera.Text;
                        DDJornadaEdit.SelectedValue = jornada;
                        ModalPopupExtender2.Show();
                    }
            }
            catch (Exception)
            {
                LbRespuestaM.CssClass = "text-danger text-center";
                LbRespuestaM.Text = "ERROR!! <br /> Intente nuevamente...";
                ModalPopupExtender3.Show();
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            try
            {
                if (lbRutAlumno.Text != "")
                {
                    Alumno original = new Alumno();
                    original = contexto.Alumno.Find(lbRutAlumno.Text);

                    original.Nombre = txtNombreEdit.Text.ToUpper();
                    original.Jornada = Convert.ToString(DDJornadaEdit.SelectedValue);
                    original.Carrera = Convert.ToString(DDCarreraEdit.SelectedItem);
                    original.IDBicicleta = Convert.ToInt32(txtIDBicicletaEdit.Text);


                    contexto.SaveChanges();

                    MostrarAlumnos();
                    LbRespuestaM.CssClass = "text-success text-center";
                    LbRespuestaM.Text = "Alumno editado correctamente.";
                    PanelRespuesta.CssClass = "panel-success";
                    ModalPopupExtender3.Show();

                }
                else
                {
                    LbRespuestaM.CssClass = "text-info text-center";
                    PanelRespuesta.CssClass = "panel-warning";
                    LbRespuestaM.Text = "Seleccione Alumno...";
                    ModalPopupExtender3.Show();
                }
            }
            catch (Exception)
            {

                LbRespuestaM.CssClass = "text-danger";
                LbRespuestaM.Text = "Error!!!";
                ModalPopupExtender3.Show();


            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                String rut = lbRutAlumno.Text;
                contexto.Alumno.Remove(contexto.Alumno.Find(rut));
                contexto.SaveChanges();
                LbRespuestaM.CssClass = "text-success text-center";
                LbRespuestaM.Text = "Alumno Eliminado Correctamente.";
                ModalPopupExtender3.Show();
                MostrarAlumnos();
            }
            catch (Exception)
            {
                LbRespuestaM.Text = "No se ha podido eliminar el alumno...";
                LbRespuestaM.CssClass="text-danger text-center";
                ModalPopupExtender3.Show();
              
            }
            
        }




    }
}