<%@ page import="com.example.proyecto_iweb.models.beans.Juegos" %>
<%@ page import="com.example.proyecto_iweb.models.beans.CompraUsuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="compra" scope="request" type="com.example.proyecto_iweb.models.beans.CompraUsuario"/>

<!DOCTYPE html>
<html lang="en">

<!-- ======= Head ======= -->
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>JA-VAGOS</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  <link rel="icon" href="pestania.png">

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
<!-- ======= Header ======= -->
<jsp:include page="../includes/narvar.jsp">
  <jsp:param name="currentPage" value="reservasYcomprados"/>
</jsp:include>

<!-- ======= Main ======= -->
<main id="main" class="main ">

  <div class="container d-flex justify-content-center align-items-center">

    <form class="col-lg-10">
      <div class="pagetitle">
        <h1>Información de la venta: </h1>
      </div>

      <br>

      <div class="row">
        <div class="col-6 bg-danger">
          <div class="mb-3">
            <label>Usuario</label>
            <div class="col-12 border rounded-2 margin-auto d-flex align-items-center">
              <p><%=compra.getUsuario().getNombre()%> <%=compra.getUsuario().getApellido()%></p>
            </div>
          </div>

          <div class="mb-3">
            <label>Juego</label>
            <div class="col-12 border rounded-2 margin-auto d-flex align-items-center">
              <p><%=compra.getJuegos().getNombre()%></p>
            </div>
          </div>

          <div class="mb-3">
            <label>Cantidad</label>
            <div class="col-12 border rounded-2 margin-auto d-flex align-items-center">
              <p><%=compra.getCantidad()%></p>
            </div>
          </div>

          <div class="mb-3">
            <label>Fecha</label>
            <div class="col-12 border rounded-2 margin-auto d-flex align-items-center">
              <p><%=compra.getFechaCompra()%></p>
            </div>
          </div>

          <div class="mb-3">
            <label>Dirección</label>
            <div class="col-12 border rounded-2 margin-auto d-flex align-items-center">
              <p><%=compra.getDireccion()%></p>
            </div>
          </div>

          <div class="mb-3">
            <label>Admin Encargado</label>
            <div class="col-12 border rounded-2 margin-auto d-flex align-items-center">
              <p><%=compra.getAdmin().getNombre()%></p>
            </div>
          </div>

          <div class="mb-3">
            <label>Precio</label>
            <div class="col-12 border rounded-2 margin-auto d-flex align-items-center">
              <p><%=compra.getPrecioCompra()%></p>
            </div>
          </div>

          <div class="mb-3">
            <label>Estado</label>
            <div class="col-12 border rounded-2 margin-auto d-flex align-items-center">
              <p><%=compra.getEstados().getEstados()%></p>
            </div>
          </div>

        </div>

        <div class="col-6 bg-primary">
          <img src="<%=compra.getUsuario().getFoto()%>" alt="" class="img-fluid max-width-100">
        </div>

      </div>

      <a class="btn btn-danger" href="<%=request.getContextPath()%>/AdminJuegosServlet?a=reservas">Regresar</a>

    </form>

  </div>

</main>


<!-- ======= Footer ======= -->
<jsp:include page="/includes/footer.jsp">
  <jsp:param name="title" value=""/>
</jsp:include>

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>

<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>
<script src="assets/js/lista.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

</body>
</html>
