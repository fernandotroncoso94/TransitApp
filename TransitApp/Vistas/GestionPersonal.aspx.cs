using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TransitApp.Vistas
{
    public partial class GestionPersonal : System.Web.UI.Page
    {
        transit1_transitappEntities contexto = new transit1_transitappEntities();

        private void MostrarPersonal()
        {
            try
            {
                var listaPersonal = from g in contexto.Guardia
                                    select new
                                    {
                                        Rut = g.RutG,
                                        Nombre = g.Nombre,
                                        Estado = g.Estado,
                                    };

                GridView1.DataSource = listaPersonal.ToList();
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
                MostrarPersonal();
            }
        }





        protected void btnAgregar_Click(object sender, EventArgs e)
        {

            String nombre = txtNombre.Text.ToUpper();
            String clave = txtClave.Text;
            String rol = DDRol.SelectedValue;
            int estate = Convert.ToInt32(DDEstado.SelectedValue);
            String rut = txtRutG.Text;



            Usuario u = new Usuario { RutU = rut, Rol = rol };


            if (contexto.Usuario.Find(rut) == null)
            {



                if (DDRol.SelectedValue == "Administrador")
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
                    DDEstado.SelectedIndex = 0;
                    DDRol.SelectedIndex = 0;
                    txtRutG.Text = "";

                }
                else if (DDRol.SelectedValue == "Guardia")
                {

                    contexto.Usuario.Add(u);
                    Guardia g = new Guardia { Nombre = nombre, RutG = rut, Estado = Convert.ToBoolean(estate), Clave = clave };
                    contexto.Guardia.Add(g);
                    int i = contexto.SaveChanges(); //Si se agrega correctamente se retorna un 1
                    LbRespuesta.CssClass = "text-success text-center";
                    LbRespuesta.Text = "El nuevo Guardia: " + g.Nombre + "<br />Rut: " + g.RutG + "<br />Ha sido agregado CORRECTAMENTE!";
                    ModalPopupExtenderRespuesta.Show();
                    MostrarPersonal();

                    //Limpiar Controles
                    txtNombre.Text = "";
                    txtClave.Text = "";
                    DDEstado.SelectedIndex = 0;
                    DDRol.SelectedIndex = 0;
                    txtRutG.Text = "";
                }



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
                if (lbRutGuardia.Text != "")
                {
                    Guardia original = new Guardia();
                    original = contexto.Guardia.Find(lbRutGuardia.Text);

                    original.Nombre = txtNombreEdit.Text.ToUpper().TrimEnd();
                    original.Estado = Convert.ToBoolean(DropDownListEstadoEdit.SelectedIndex);
                    contexto.SaveChanges();

                    MostrarPersonal();
                    LbRespuesta.CssClass = "txt-success text-center";
                    LbRespuesta.Text = "El Guardia: " + original.Nombre + "<br />Con estado: " + original.Estado + "<br />Ha sido editado CORRECTAMENTE!";
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

        protected void BotonEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                string RutG = lbRutGuardia.Text;

                Guardia g = contexto.Guardia.Find(RutG);
                contexto.Guardia.Remove(g);
                Usuario u = contexto.Usuario.Find(RutG);
                contexto.Usuario.Remove(u);
                contexto.SaveChanges();

                LbRespuesta.CssClass = "text-success text-center";
                LbRespuesta.Text = "Eliminado CORRECTAMENTE!";
                ModalPopupExtenderRespuesta.Show();
                MostrarPersonal();
            }
            catch (Exception)
            {
                LbRespuesta.CssClass = "text-danger text-center";
                LbRespuesta.Text = "ERROR! <br />No se ha podido eliminar el guardia...";
                ModalPopupExtenderRespuesta.Show();
            }

        }


        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            int fila = Convert.ToInt32(e.CommandArgument);
            string RutGuardia = GridView1.Rows[fila].Cells[0].Text;
            String nombreGuardia = GridView1.Rows[fila].Cells[1].Text;
            Boolean Estado = Convert.ToBoolean(GridView1.Rows[fila].Cells[2].Text);


            if (e.CommandName == "btnEliminar")
            {
                lbRutGuardia.Text = GridView1.Rows[fila].Cells[0].Text;
                ModalPopupExtender1.Show();
            }
            else
                if (e.CommandName == "btnSeleccionar")
                {
                    lbRutGuardia.Text = RutGuardia.ToString().TrimEnd();
                    txtNombreEdit.Text = nombreGuardia.TrimEnd();
                    DropDownListEstadoEdit.SelectedIndex = Convert.ToInt32(Estado);
                    ModalPopupExtender2.Show();
                }


        }


   

       





    }
}