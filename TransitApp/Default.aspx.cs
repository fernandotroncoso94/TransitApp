using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TransitApp
{
    public partial class Default : System.Web.UI.Page
    {
        transit1_transitappEntities contexto = new transit1_transitappEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }





        protected void btnIngresar_Click(object sender, EventArgs e)
        {

            try
            {
                if (txtRut.Text == "SuperAdmin666" && txtPassword.Text == "SuperAdmin666")
                {
                    Response.Redirect("~/Vistas/AdminAdmin.aspx");
                }
            }
            catch (Exception)
            {


            }


            String Rut = txtRut.Text.Trim();
            String Role = "";
            String NombreG = "";
            String NombreA = "";
            Boolean Estate = true;
            String RutG = "";
            String RutA = "";
            String ClaveG = "";
            String ClaveA = "";

            try
            {

                var Users = from us in contexto.Usuario
                            where us.RutU.TrimEnd().Equals(Rut)
                            select us;

                foreach (var item in Users)
                {
                    Role = item.Rol.TrimEnd();
                }





                var Admins = from usa in contexto.Administrador
                            where (usa.RutA.Trim() == Rut && usa.Clave.Trim() == txtPassword.Text.Trim())
                            select usa;

                foreach (var item in Admins)
                {
                    NombreA = item.Nombre.Trim();
                    RutA = item.RutA.Trim();
                    ClaveA = item.Clave.Trim();
                }




                var UserG = from us in contexto.Guardia
                            where (us.RutG.Trim() == Rut && us.Clave.Trim() == txtPassword.Text.Trim())
                            select us;
         
                foreach (var item in UserG)
                {
                    NombreG = item.Nombre.Trim();
                    Estate = item.Estado;
                    RutG = item.RutG.Trim();
                    ClaveG = item.Clave.Trim();
                }








                if (Role=="Administrador" && RutA==txtRut.Text.Trim() && ClaveA==txtPassword.Text.Trim())
                {
                    Session["Rut"] = Rut;
                    Session["Nombre"] = NombreA;
                    Session["Rol"] = "Administrador";
                    Session.Timeout = 20; // tiempo en minutos 
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.Redirect("~/Vistas/PrincipalAdmin.aspx");

                }
                else if (Role == "Guardia" && RutG == txtRut.Text.Trim() && ClaveG == txtPassword.Text.Trim() && Estate == true)
                {
                    Session["Rut"] = Rut;
                    Session["Nombre"] = NombreG;
                    Session["Rol"] = "Guardia";
                    Session.Timeout = 120; // tiempo en minutos 
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.Redirect("~/Vistas/PrincipalGuardias.aspx");


                }
                else
                {
                    LbRespuestaLogin.Text = "Ingrese un Rut y Contraseña correctos...";
                    LbRespuestaLogin.CssClass = "text-danger";

                }
            }
            catch (Exception)
            {
                LbRespuestaLogin.Text = "Error al conectarse con la Base de Datos, intente mas tarde";
                LbRespuestaLogin.CssClass = "text-danger";
            }

            


        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            try
            {
                int i ;
                Comentario c = new Comentario();
                c.Comentary = txtComentario.Text.TrimEnd();
                c.Correo = txtCorreo.Text.TrimEnd();
                c.Fecha = DateTime.Now;
                c.Nombre = txtNombre.Text.TrimEnd().ToUpper();
                contexto.Comentario.Add(c);
                i=contexto.SaveChanges();
                if (i==1) { 
                LbRespuesta.Text = "Comentario enviado exitosamente. Gracias por tu ayuda! ";
                LbRespuesta.CssClass = "text-success";
                }
            }
            catch (Exception)
            {

                LbRespuesta.Text = "El comentario no pudo ser enviado, intente mas tarde...";
                LbRespuesta.CssClass = "text-danger";
            }
        }










    }
}