<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Cuentas" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="usuarioLog" scope="session" type="com.example.proyecto_iweb.models.beans.Cuentas"
             class="com.example.proyecto_iweb.models.beans.Cuentas"/>

<jsp:useBean id="cuentas" scope="request" type="com.example.proyecto_iweb.models.beans.Cuentas"/>
<jsp:useBean id="listarRegistro" scope="request" type="com.example.proyecto_iweb.models.dtos.UsuarioTabla"/>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>JA-VAGOS</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  <link rel="icon" href="img/sistema/pestania.png">

  <!-- Estilos CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
  <!--Importando estilos CSS-->
  <link rel="stylesheet" href="estilos/usuario/filtros.css">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- Option 1: Include in HTML -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

</head>

<body>

<jsp:include page="../includes/narvar.jsp">
  <jsp:param name="currentPage" value=""/>
</jsp:include>

<main id="main" class="main">
  <div class="container">
    <div class="pagetitle">
      <% if (cuentas.getIdRol() == 2) { %>
      <h1>Perfil del Administrador <%= cuentas.getNickname() %></h1>
      <% } else { %>
      <h1>Perfil del usuario: <%= cuentas.getNickname() %></h1>
      <% } %>
      <br>
    </div><!-- End Page Title -->



    <div class="row d-flex justify-content-center border border-primary rounded-4">

      <div class="col-lg-4 m-4">
        <!--VA IR LA FOTO-->
        <div class="col-auto">
          <div class="col-md-9 mx-auto">
            <img src="<%=cuentas.getFoto()%>" alt="" class="img-fluid mb-4 rounded-circle">
          </div>


          <h5 class="text-center">Datos Principales</h5>
          <table class="table table-bordered">
            <thead>
            <tr>

            </tr>
            </thead>
            <tbody>
            <tr>
              <td>Nombre Completo </td>
              <td><%=cuentas.getNombre() + " " + cuentas.getNombre() %></td>
            </tr>
            <tr>
              <td>nickname</td>
              <td><%=cuentas.getNickname()%></td>
            </tr>
            <tr>
              <td>Direccion</td>
              <td><%=cuentas.getDireccion()%></td>
            </tr>
            <tr>
              <td>Correo</td>
              <td><%=cuentas.getCorreo()%></td>
            </tr>

            </tbody>
          </table>
        </div>
      </div>


      <div class="col-lg-6 m-2">
        <!--VA IR LA INFORMACIÓN-->
        <div class="row-lg-6">
          <h5 class="text-center">Estadisticas de la cuenta </h5>
          <table class="table table-bordered">
            <thead>
            <tr>

            </tr>
            </thead>
            <tbody>
            <tr>
              <% if (cuentas.getIdRol() == 2) { %>
              <td>Cant. juegos comprados</td>
              <% } else { %>
              <td>Cant. juegos Vendidos</td>
              <% } %>
              <td><%=listarRegistro.getJuegosVendidos()%></td>
            </tr>
            <tr>
              <% if (cuentas.getIdRol() == 2) { %>
              <td>Cant. juegos Vendidos</td>
              <% } else { %>
              <td>Cant. juegos comprados</td>
              <% } %>
              <td><%=listarRegistro.getJuegosComprados()%></td>
            </tr>
            <tr>
              <% if (cuentas.getIdRol() == 2) { %>
              <td>Dinero Ganado</td>
              <% } else { %>
              <td>Dinero gastado</td>
              <% } %>
              <td>S/. <%=listarRegistro.getDineroGastado()%></td>
            </tr>
            <tr>
              <% if (cuentas.getIdRol() == 2) { %>
              <td>Dinero Gastado</td>
              <% } else { %>
              <td>Dinero Ganado</td>
              <% } %>
              <td>S/. <%=listarRegistro.getDineroGanado()%></td>
            </tr>
            </tbody>
          </table>
        </div>


        <div class="row">
          <h5 class="text-center">Ubicación</h5>
          <iframe
                  src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d7803.090718696196!2d-77.09065694650349!3d-12.074770906006872!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses-419!2spe!4v1682624518105!5m2!1ses-419!2spe"
                  width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy"
                  referrerpolicy="no-referrer-when-downgrade"></iframe>
          <br>
        </div>
        <br>
      </div>

    </div>

  </div>
  <br>
  <a href="<%=request.getContextPath()%>" class="btn btn-danger">Regresar</a>
</main>

<br><br><br>
<!-- ======= Footer ======= -->
<footer id="footer" class="footer">

  <!-- Section: Social media -->
  <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
    <!-- Left -->
    <div class="me-5 d-none d-lg-block">
      <span>Conéctate con nosotras en las redes sociales:</span>
    </div>
    <!-- Left -->

    <!-- Right -->
    <div>
      <a href="" class="me-4 link-secondary">
        <i class="bi bi-facebook"></i>
      </a>
      <a href="" class="me-4 link-secondary">
        <i class="bi bi-twitter"></i>
      </a>
      <a href="" class="me-4 link-secondary">
        <i class="bi bi-instagram"></i>
      </a>
      <a href="" class="me-4 link-secondary">
        <i class="bi bi-linkedin"></i>
      </a>

    </div>
    <!-- Right -->
  </section>
  <!-- Section: Social media -->


  <!-- Section: Links  -->
  <section class="">
    <div class="container text-center text-md-start mt-5">
      <!-- Grid row -->
      <div class="row mt-3">
        <!-- Grid column -->
        <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
          <!-- Content -->
          <h6 class="text-uppercase fw-bold mb-4">
            <i class="fas fa-gem me-3 text-secondary"></i>Nombre de la compañia
          </h6>
          <p>
            Ja-Vagos, somos un grupo de estudiantes que quiere aprobar el curso de Ing. Web para Telecomunicaciones...
          </p>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">
            Productos
          </h6>
          <p>
            <a href="#!" class="text-reset">Angular</a>
          </p>
          <p>
            <a href="#!" class="text-reset">React</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Vue</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Laravel</a>
          </p>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">
            Links
          </h6>
          <p>
            <a href="#!" class="text-reset">Pricing</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Settings</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Orders</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Help</a>
          </p>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">Contacto</h6>
          <p><i class="bi bi-geo-alt me-3 text-secondary"></i>Av. Universitaria 1801, San Miguel</p>
          <p>
            <i class="bi bi-envelope me-3 text-secondary"></i>
            javagos@pucp.edu.pe
          </p>
          <p><i class="bi bi-phone me-3 text-secondary"></i> + 51 987 654 321</p>
          <p><i class="bi bi-telephone me-3 text-secondary"></i> + 01 765 567 21</p>
        </div>
        <!-- Grid column -->
      </div>
      <!-- Grid row -->
    </div>
  </section>
  <!-- Section: Links  -->



  <div class="copyright">
    &copy; Copyright <strong><span>NiceAdmin</span></strong>. Todos los derechos reservados
  </div>
  <div class="credits">
    Designed by <a href="#">Ja-Vagos</a>
  </div>
</footer><!-- End Footer -->

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>


<!-- Vendor JS Files -->
<script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/vendor/chart.js/chart.umd.js"></script>
<script src="assets/vendor/echarts/echarts.min.js"></script>
<script src="assets/vendor/quill/quill.min.js"></script>
<script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
<script src="assets/vendor/tinymce/tinymce.min.js"></script>
<script src="assets/vendor/php-email-form/validate.js"></script>


<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>
<script src="assets/js/lista.js"></script>

</body>

</html>
