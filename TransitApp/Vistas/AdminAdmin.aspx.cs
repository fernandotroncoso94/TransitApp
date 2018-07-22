using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TransitApp.Vistas
{
    public partial class AdminAdmin : System.Web.UI.Page
    {

        transit1_transitappEntities contexto = new transit1_transitappEntities();

        private void MostrarPersonal()
        {
            var listaAdminAdmin = from a in contexto.Administrador
                                select new
                                {
                                    Rut = a.RutA,
                                    Nombre = a.Nombre
                                };

            GridView1.DataSource = listaAdminAdmin.ToList();
            GridView1.DataBind();

             
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MostrarPersonal();
               
            }
        }


        


        protected void btnAgregar_Click(object sender, EventArgs e)
        {

            String nombre = txtNombre.Text.ToUpper();
            String clave = txtClave.Text;
            String rut = txtRutA.Text;



            Usuario u = new Usuario { RutU = rut, Rol="Administrador" };


            if (contexto.Usuario.Find(rut) == null)
            {



                
                    contexto.Usuario.Add(u);
                    Administrador admin = new Administrador { RutA = rut, Nombre = nombre, Clave = clave };
                    contexto.Administrador.Add(admin);
                    int i = contexto.SaveChanges(); //Si se agrega correctamente se retorna un 1
                    LbRespuesta.CssClass = "text-success text-center";
                    LbRespuesta.Text = "El nuevo Administrador: " + admin.Nombre.ToUpper() + " <br />Rut: " + admin.RutA + " <br />Ha sido agregado CORRECTAMENTE";
                    ModalPopupExtenderRespuesta.Show();
                    MostrarPersonal();

                    //Limpiar Controles
                    txtNombre.Text = "";
                    txtClave.Text = "";
                    txtRutA.Text = "";

               



            }
            else
            {
                LbRespuesta.Text = "El usuario ya se encuentra registrado...";
                LbRespuesta.CssClass = "text-danger text-center";
                ModalPopupExtenderRespuesta.Show();
            }








        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            MostrarPersonal();
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            try
            {
                if (lbRutAdmin.Text != "")
                {
                    Administrador original = new Administrador();
                    original = contexto.Administrador.Find(lbRutAdmin.Text);

                    original.Nombre = txtNombreEdit.Text.ToUpper().TrimEnd();
                    original.Clave = txtClaveEdit.Text.Trim();
                    contexto.SaveChanges();

                    MostrarPersonal();
                    LbRespuesta.CssClass = "txt-success text-center";
                    LbRespuesta.Text = "El Administrador: " + original.Nombre + "<br />Ha sido editado CORRECTAMENTE!";
                    ModalPopupExtenderRespuesta.Show();
                }
                else
                {
                    LbRespuesta.CssClass = "text-danger text-center";
                    LbRespuesta.Text = "Por favor, seleccione Personal...";
                    ModalPopupExtenderRespuesta.Show();
                }
            }
            catch (Exception)
            {

                LbRespuesta.CssClass = "text-danger text-center";
                LbRespuesta.Text = "ERROR! <br /> Por favor, intente nuevamente...";
                ModalPopupExtenderRespuesta.Show();


            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            string RutA = lbRutAdmin.Text;
            Administrador a = contexto.Administrador.Find(RutA);
            contexto.Administrador.Remove(a);
            Usuario u = contexto.Usuario.Find(RutA);
            contexto.Usuario.Remove(u);
            contexto.SaveChanges();
            LbRespuesta.CssClass = "text-success text-center";
            LbRespuesta.Text = "Eliminado CORRECTAMENTE!";
            ModalPopupExtenderRespuesta.Show();
            MostrarPersonal();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            int fila = Convert.ToInt32(e.CommandArgument);
            string RutAdmin = GridView1.Rows[fila].Cells[0].Text;
            String nombreAdmin = GridView1.Rows[fila].Cells[1].Text;


            if (e.CommandName == "btnEliminar")
            {
                lbRutAdmin.Text = GridView1.Rows[fila].Cells[0].Text;
                ModalPopupExtender1.Show();
            }
            else
                if (e.CommandName == "btnSeleccionar")
            {
                lbRutAdmin.Text = RutAdmin.ToString().TrimEnd();
                txtNombreEdit.Text = nombreAdmin.TrimEnd();
                ModalPopupExtender2.Show();
            }


        }
    }
}