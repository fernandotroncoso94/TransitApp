using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TransitApp.Vistas
{
    public partial class IngresoAlumno : System.Web.UI.Page
    {
        transit1_transitappEntities contexto = new transit1_transitappEntities();
      
       

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            int IDBici = Convert.ToInt32(txtIDBici.Text);
            LbRut.Text = txtRut.Text;

            try
            {
                Alumno a = contexto.Alumno.Find(txtRut.Text);
              
                    if (a != null && a.IDBicicleta==IDBici)
                    {
                        a.IDBicicleta = IDBici;
                        a.HoraIngreso = DateTime.Now;
                        lbRespuesta.Text = "ALUMNO: " + a.Nombre.ToUpper() + "   RUT: " + a.RutA + "<br />" + "COLOR BICICLETA:  " + a.Bicicleta.Color.ToUpper() + "    MARCA: " + a.Bicicleta.Marca.ToUpper();
                        lbRespuesta.CssClass = "text-success";
                        contexto.SaveChanges();
                    }
                    else if(a.IDBicicleta != IDBici)
                    {
                    ModalPopupExtender3.Show();
                 
                }
                else
                {
                    lbRespuesta.Text = "Alumno no encontrado...";
                    lbRespuesta.CssClass = "text-danger";
                }
                
                    
            }
            catch (Exception)
            {
                lbRespuesta.Text = "ERROR!";
                lbRespuesta.CssClass = "text-warning";
                
            }

           
        }

        protected void BtnCambiarDeBicicleta_Click(object sender, EventArgs e)
        {
            try
            {
                Alumno a = contexto.Alumno.Find(LbRut.Text);
                a.IDBicicletaAnterior = a.IDBicicleta;
                a.IDBicicleta = Convert.ToInt32(txtIDBici.Text);
                a.Comentario = txtComentario.Text.TrimEnd().ToUpper();
                contexto.SaveChanges();

            }
            catch (Exception)
            {
                
            }
            
        }

        protected void BtnOtraBicicleta_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Vistas/GestionBiciG.aspx");
        }
    }
}