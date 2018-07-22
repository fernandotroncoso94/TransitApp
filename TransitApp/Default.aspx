<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TransitApp.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TransitApp</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/css/swiper.min.css">
    <link rel="stylesheet" href="../css/styles.min.css">

        <style>
             .centrado{
	margin:10px auto;
	display:block;
    }
        </style>


</head>
    <body>
       
               
                    

<form runat="server" id="form2" method="post"><div style="background-image:url('../img/bici_login.jpg')">
   <div class="container container-fluid" >
      
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8 ">

      <div class="login-clean" >
          <h2 class="text-info text-center">Inicio de Sesión</h2>
  
        <img class="centrado" src="../img/Logo_login.png"/>
       
       
          <div class="card-body">
        <asp:TextBox ID="txtRut"  MaxLength="11" class="form-control centrado" placeholder="Rut" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRut" ValidationGroup="G1" ErrorMessage="*Rut necesario para poder ingresar" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
       <%--VALIDAR QUE INGRESE RUT--%>

              <asp:TextBox ID="txtPassword" MaxLength="30" TextMode="Password" CssClass="form-control centrado" placeholder="Contraseña" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtPassword" ValidationGroup="G1" ErrorMessage="*Contraseña necesaria para poder ingresar"></asp:RequiredFieldValidator>
        <%--VALIDAR QUE INGRESE CONTRASEÑA--%>

        <asp:Button ID="btnIngresar" OnClick="btnIngresar_Click" ValidationGroup="G1" runat="server" Text="Ingresar a TransitApp" CssClass="btn btn-lg btn-success btn-block" />
              <asp:Label ID="LbRespuestaLogin" runat="server" Text="" ></asp:Label>
              
              <p class="mt-5 mb-3 text-center text-muted">TransitApp 2018 &copy;</p>
              
                  
              <p class="text-center mb-0 ">Desarrollado por alumnos de
<img src="img/inacap.png"   style="width:auto ; height:40px;" />
                                     </p>
              
         


          </div>
             </div>
    </div>
        </div>
   <div class="col-md-2"></div>

    </div>




    </div>
    <div class="simple-slider"></div>
    <div class="team-boxed">
        <div class="container">
            <div class="intro">
                <h2 class="text-center">Equipo de Desarrollo</h2>
                <p class="text-center">Los encargados de llevar a cabo TransitApp, desde la concepción de la idea inicial hasta la puesta en marcha el 11 de julio del 2018</p>
            </div>
            <div class="row people">
                <div class="col-md-6 col-lg-4 item">
                    <div class="box"><img class="rounded-circle" src="../img/IMG_0268.jpg.jpg">
                        <h3 class="name">Fernando Troncoso Fuica</h3>
                        <p class="title">Scrum manager</p>
                        <p class="description">La idea de TransitApp surgió al momento que llegamos a vivir a Talca, siendo compañeros de universidad, nos movilizabamos en bicicleta y notamos esta problemática. En un principio lo tomamos como idea para proyectos cortos, pero
                            con el tiempo nos enfocamos en ella y terminó en lo que vemos aquí. Me siento orgulloso de lo que hemos hecho y logrado hasta ahora.</p>
                        <div class="social"><a href="www.facebook.com/fernando.troncoso.fuica"><i class="fa fa-facebook-official"></i></a><a href="www.twitter.com/fernaandoo94"><i class="fa fa-twitter"></i></a><a href="www.instagram.com/fernaandooinstaapp"><i class="fa fa-instagram"></i></a></div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 item">
                    <div class="jumbotron"><img src="../img/Logo_sm2.png">
                        <h1>TransitApp</h1><label>El principal motivo de TransitApp es disminuir los tiempos de espera en los puntos de acceso en bicicleta a la universidad. Esta web esta principalmente dirigido a los ciclistas que se ve afectados por los retrasos, con un ahorro del tiempo de espera de hasta 10 minutos. Como valor agregado se le adiciona el hecho de que la seguridad de las bicicletas mejora al tener un número ID único asignado, impidiendo que pueda pasar alguna bicicleta intercambiada.</label></div>
                </div>
                <div class="col-md-6 col-lg-4 item">
                    <div class="box"><img class="rounded-circle" src="../img/WhatsApp Image 2018-07-12 at 11.53.59 PM.jpeg">
                        <h3 class="name">Alicia Sanhueza Bravo</h3>
                        <p class="title">Product owner</p>
                        <p class="description">TransitApp ha sido un largo recorrido en nuestras vidas universitarias, llena de desafíos, metas e inquietudes, las cuales no fueron un obstáculo para lograr lo que nos propusimos en un comienzo. Luego de este arduo trabajo en
                            equipo, hoy podemos decir que TransitApp es la nueva e innovadora herramienta para un registro de acceso a la universidad más expedito y eficaz. </p>
                        <div class="social"><a href="#"><i class="fa fa-facebook-official"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-instagram"></i></a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>


        <asp:ScriptManager ID="ScriptManager" 
                   runat="server" />
<asp:UpdatePanel ID="UpdatePanel1" 
                 UpdateMode="Conditional"
                 runat="server">
    <ContentTemplate>

      <div class="container">
          <div class="contact-clean">
            <h2 class="text-center">Quieres ponerte en contacto?</h2>
            <p>La retroalimentación es la mejor manera que tenemos para mejorar TransitApp día a día, si tienes sugerencias o dudas contactarnos, te responderemos lo antes posible.</p>
            <div class="form-group">
                <asp:TextBox ID="txtNombre"  CssClass="form-control" type="text" name="name" placeholder="Tu nombre" runat="server" ValidationGroup="G2"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Necesitamos saber con quién hablamos..." ForeColor="Red" Display="Dynamic" ValidationGroup="G2" ControlToValidate="txtNombre"></asp:RequiredFieldValidator>
                </div>
            <div class="form-group">
                <asp:TextBox ID="txtCorreo" ValidationGroup="G2" CssClass="form-control" type="email" placeholder="Email" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Ingrese su correo" ForeColor="Red" Display="Dynamic" ValidationGroup="G2" ControlToValidate="txtCorreo"></asp:RequiredFieldValidator>

            </div>
            <div class="form-group">
                <asp:TextBox ID="txtComentario" ValidationGroup="G2" CssClass="form-control" rows="14" name="message" placeholder="¿En qué podemos mejorar?" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Queremos saber tu opinión" ForeColor="Red" Display="Dynamic" ControlToValidate="txtComentario" ValidationGroup="G2"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:Button ID="btnEnviar" OnClick="btnEnviar_Click" runat="server" ValidationGroup="G2" Text="Hablemos" class="btn btn-primary btn-lg" type="submit" />

            </div>
              <asp:Label ID="LbRespuesta" runat="server" Text="" ></asp:Label>
          </div>
        </div>
         </ContentTemplate>
</asp:UpdatePanel>


    </div>
</form>
    <div class="footer-clean">
        <footer>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-sm-4 col-md-3 item">
                        <h3>TransitApp.cl</h3>
                        <ul>
                            <li>Soluciones de TI</li>
                            <li>Desarrollo web</li>
                            <li>Asesoramiento personalizado</li>
                        </ul>
                    </div>
                    <div class="col-lg-3">
                        <a href="www.transitapp.cl"><p class="copyright">TransitApp.cl © 2018</p></a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.jquery.min.js"></script>
    <script src="../js/script.min.js"></script>

                              
               
                  
</body>

</html>