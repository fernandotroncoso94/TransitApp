using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TransitApp.Vistas
{
    public partial class GestionBici : System.Web.UI.Page
    {
        
        transit1_transitappEntities contexto = new transit1_transitappEntities();

        private void MostrarBicicletas()
        {
            var ListaBicicletas = from b in contexto.Bicicleta
                                  
                                select new
                                {
                                    IDBicicleta = b.IDBicicleta,
                                    Marca= b.Marca,
                                    Color = b.Color,
                                    Foto = b.Imagen
                                };

            GridView1.DataSource = ListaBicicletas.ToList();
            GridView1.DataBind();
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MostrarBicicletas();


                txtID.Text = Convert.ToString(UltimaBicicleta()+1);
                txtID.Font.Size = 19;
            }
        }



        public int UltimaBicicleta()
        {
            int id = 0;
            try
            {
                
                var Biciclets = contexto.Bicicleta.ToList();
                foreach (var b in Biciclets)
                {
                    if (b.IDBicicleta > id)
                    {
                        id = b.IDBicicleta;
                    }
                }
                return id;
            
            }
            catch (Exception)
            {

                return id;
            }
                
        }


        protected void FileUploadComplete(object sender, EventArgs e)
        {
          

        }


        protected void btnAgregar_Click(object sender, EventArgs e)
        {





            try
            {

                //Agregar la Foto
                try
                {
                    string contentType = AsyncFileUpload1.ContentType;
                    if (contentType == "image/jpeg" || contentType == "image/gif"
                                || contentType == "image/png")
                    {
                        string filename = System.IO.Path.GetFileName(AsyncFileUpload1.FileName);
                        AsyncFileUpload1.SaveAs(Server.MapPath("../Bicicletas/" + UltimaBicicleta() +1+ "-" + filename));
                        LbUrl.Text = "../Bicicletas/" + UltimaBicicleta() + 1 + "-" + filename;
                        LbImagen.Text = "subida exitosamente!";
                        LbImagen.CssClass = "text-success";
                    }
                    else
                    {
                        LbImagen.Text = "*Solo Archivos .jpeg .gif .png <br /> *Maximo 4MB";
                        LbImagen.CssClass = "text-danger";
                    }
                }
                catch
                {

                }




                String ColorTxt = txtColor.Text.ToUpper().Trim();
                String MarcaTxt = txtMarca.Text.ToUpper().Trim();
                if (AsyncFileUpload1.HasFile)
                {
                    String ImageUrl = "../Bicicletas/" + UltimaBicicleta() +1+"-" + AsyncFileUpload1.FileName;
                }
                Bicicleta b = new Bicicleta { Marca=MarcaTxt, Color=ColorTxt, Imagen=LbUrl.Text};
                
                contexto.Bicicleta.Add(b);
                int i = contexto.SaveChanges(); //Si se agrega correctamente se retorna un 1

                if (i == 1)
                {
                    LbRespuesta.CssClass = "text-success text-center";
                    LbRespuesta.Text ="ID: " + b.IDBicicleta + " <br/> Marca: " + b.Marca + " <br/> Color: " + b.Color + ".";
                    ModalPopupExtenderRespuesta.Show();
                    MostrarBicicletas();












                    //Actualizar Controles
                    txtMarca.Text = "";
                    txtColor.Text = "";
                    txtID.Text = Convert.ToString(UltimaBicicleta()+1);
                }
                else {
                    LbRespuesta.CssClass = "text-danger";
                    LbRespuesta.Text = "ERROR AL COMUNICARSE CON LA BASE DE DATOS";
                    ModalPopupExtenderRespuesta.Show();
                }


            }
            catch (Exception)
            {

                LbRespuesta.CssClass = "text-danger";
                LbRespuesta.Text = "ERROR! <br /> Por favor, intente ingresando los datos nuevamente.";
                ModalPopupExtenderRespuesta.Show();

            }
        }

        


        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int Fila = Convert.ToInt32(e.CommandArgument);
                int IdBicicleta = Convert.ToInt32(GridView1.Rows[Fila].Cells[0].Text);
                String Color = GridView1.Rows[Fila].Cells[1].Text;
                String Marca = GridView1.Rows[Fila].Cells[2].Text;


                if (e.CommandName == "btnEliminar")
                {
                    lbIDBici.Text = GridView1.Rows[Fila].Cells[0].Text;
                    ModalPopupExtender1.Show();
                }
                else
                    if (e.CommandName == "btnSeleccionar")
                    {
                        lbIDBici.Text = IdBicicleta.ToString().TrimEnd();
                        txtColorEdit.Text = Color.TrimEnd();
                        txtMarcaEdit.Text = Marca.TrimEnd();

                        ModalPopupExtender2.Show();
                    }
            }
            catch (Exception)
            {
                LbRespuesta.CssClass = "text-danger";
                LbRespuesta.Text = "ERROR! <br /> Por favor, intente nuevamente.";
                ModalPopupExtenderRespuesta.Show();
            }
        }


        private void ValidarBicicleta(Bicicleta b)
        { 
            String m = b.Marca.ToString();
       
        }


        protected void btnEditar_Click(object sender, EventArgs e)
        {
            try
            {
                if (lbIDBici.Text != "")
                {
                    Bicicleta Original = new Bicicleta();
                    Original = contexto.Bicicleta.Find(Convert.ToInt32(lbIDBici.Text));

                    Original.Marca = txtMarcaEdit.Text.ToUpper().TrimEnd();
                    Original.Color = txtColorEdit.Text.ToUpper().TrimEnd();
                    contexto.SaveChanges();

                    MostrarBicicletas();
                    LbRespuesta.CssClass = "txt-success";
                    LbRespuesta.Text = "La Bicicleta: "+Original.IDBicicleta+" <br /> Marca: "+Original.Marca+" <br /> Color: "+Original.Color +" <br /> ha sido editada correctamente!" ;
                    ModalPopupExtenderRespuesta.Show();

                }
                else
                {
                    LbRespuesta.CssClass = "text-warning";
                    LbRespuesta.Text = "Seleccione Bicicleta...";
                    ModalPopupExtenderRespuesta.Show();
                }
            }
            catch (Exception)
            {

                LbRespuesta.CssClass = "text-danger";
                LbRespuesta.Text = "ERROR! <br /> Por favor intente nuevamente...";
                ModalPopupExtenderRespuesta.Show();


            }
        }






        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(lbIDBici.Text);
            
            try
            {
                Bicicleta b = contexto.Bicicleta.Find(id);
                contexto.Bicicleta.Remove(b);

                int i = contexto.SaveChanges();

                if (i == 1)
                {
                    LbRespuesta.CssClass = "text-success text-center";
                    LbRespuesta.Text = "La Bicicleta: "+b.IDBicicleta +"<br /> Marca: "+b.Marca+"<br /> Color: "+b.Color+" <br /> ha sido ELIMINADA correctamente";
                    MostrarBicicletas();
                    ModalPopupExtenderRespuesta.Show();
                    txtID.Text = Convert.ToString(UltimaBicicleta() + 1);

                    try
                    {
                        System.IO.File.Delete(b.Imagen);
                    }
                    catch (Exception)
                    {
                        
                    }

                }
                else
                {
                LbRespuesta.CssClass = "text-success text-center";
                LbRespuesta.Text = "No se ha podido eliminar la bicicleta...";
                ModalPopupExtenderRespuesta.Show();
                }


                
            }
            catch (Exception)
            {
                LbRespuesta.Text = "No se ha podido eliminar la bicicleta, revise que ningun alumno tenga vinculada la bicicleta con ID: " + lbIDBici.Text;
                ModalPopupExtenderRespuesta.Show();
            }
            
            
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            MostrarBicicletas();
        }
    }
}