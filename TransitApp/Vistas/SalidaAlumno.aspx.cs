using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TransitApp.Vistas
{
    public partial class SalidaAlumno : System.Web.UI.Page
    {
        transit1_transitappEntities contexto = new transit1_transitappEntities();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            int idbici = Convert.ToInt32(txtIDBici.Text);
            String rutAlumno = txtRut.Text;
            LbRutAlumno.Text = txtRut.Text;
            LbIdBici.Text = txtIDBici.Text;


            try
            {
                Alumno a = contexto.Alumno.Find(rutAlumno);
                if (a != null)
                {


                    if (a.IDBicicleta != Convert.ToInt32(LbIdBici.Text) && a.RutA == LbRutAlumno.Text)
                    {
                        ModalPopupExtender1.Show();
                    }else if (a.IDBicicleta == Convert.ToInt32(LbIdBici.Text))
                    {
                        a.IDBicicleta = idbici;
                        a.HoraSalida = DateTime.Now;
                        
                        LbRespuesta.Text = "ALUMNO: " + a.Nombre.ToUpper() + "<br />     RUT: " + a.RutA + "<br />" + "COLOR BICICLETA: " + a.Bicicleta.Color.ToUpper() + "<br />     MARCA: " + a.Bicicleta.Marca.ToUpper();
                        LbRespuesta.CssClass = "text-success text-center";
                        ModalPopupExtender2.Show();
                        contexto.SaveChanges();
                    }

                    
                }
                else
                {
                    LbRespuesta.Text = " Alumno no encontrado...";
                    LbRespuesta.CssClass = "text-warning text-center ";
                    ModalPopupExtender2.Show();
                }

                

            }
            catch (Exception)
            {
                LbRespuesta.Text = "Error";
                LbRespuesta.CssClass = "text-danger text-center";
                ModalPopupExtender2.Show();

            }
        }
    }
}