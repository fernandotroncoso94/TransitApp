using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TransitApp.Vistas
{
    public partial class AdminNav : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                try
                {
                    lbRol.Text = Convert.ToString(Session["Rol"]) + ": ";
                    lbNombre.Text = Convert.ToString(Session["Nombre"]);
                }
                catch (Exception)
                {
                }

                if (Session["Nombre"] == null)
                {
                    Response.Redirect("../Default.aspx");
                }
            }

            

        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {

            Session.Remove("Rut");
            Session.Remove("Nombre");
            Session.Remove("Rol");
            Session.Abandon();
            Response.Redirect("../Default.aspx");
        }
    }
}