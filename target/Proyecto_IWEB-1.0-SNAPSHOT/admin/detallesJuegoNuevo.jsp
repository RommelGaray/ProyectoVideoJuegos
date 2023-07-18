<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto_iweb.models.dtos.DetallesNuevos" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="ventaUsuario" scope="request" type="com.example.proyecto_iweb.models.beans.VentaUsuario"/>
<% ArrayList<DetallesNuevos> lista = (ArrayList<DetallesNuevos>) request.getAttribute("detallesNuevos");%>


<!DOCTYPE html>
<html lang="en">
<!-- ======= Head ======= -->
<jsp:include page="/includes/head.jsp">
  <jsp:param name="title" value="Nueva lista"/>
</jsp:include>
<body>
<!-- ======= Header ======= -->
<jsp:include page="../includes/narvar.jsp">
  <jsp:param name="currentPage" value="nuevo"/>
</jsp:include>

<!-- ======= Main ======= -->
<main id="main" class="main">

  <div class="container">
    <h1 class="mt-3">Detalles de juego nuevo</h1>

    <form method="POST" action="<%=request.getContextPath()%>/UsuariosJuegosServlet">
      <input type="hidden" class="form-control">

      <% for (DetallesNuevos d : lista) { %>
      <div class="row">
        <div class="col-lg-6">
          <div class="mb-3">
            <label for="juego">Nombre del Juego</label>
            <input type="text" class="form-control" name="precio" id="juego" value="<%=d.getNombre() %>" disabled>
          </div>
          <div class="mb-3">
            <label for="usuario">Usuario vendedor</label>
            <input type="text" class="form-control" name="precio" id="usuario" value="<%=d.getNombreUsuario() %>" disabled>
          </div>
          <div class="mb-3">
            <label for="precio">Precio de venta propuesto</label>
            <input type="text" class="form-control" name="precio" id="precio" value="<%=ventaUsuario.getPrecioVenta()%>" disabled>
          </div>
          <div class="mb-3">
            <label for="descripcion">Descripción</label>
            <input type="text" class="form-control" name="precio" id="descripcion" value="<%=d.getDescripcion() %>" disabled>
          </div>
          <div class="mb-3">
            <label for="consola">Consola</label>
            <input type="text" class="form-control" name="precio" id="consola" value="<%=d.getConsola() %>" disabled>
          </div>
          <div class="mb-3">
            <label for="genero">Género</label>
            <input type="text" class="form-control" name="precio" id="genero" value="<%=d.getGenero() %>" disabled>
          </div>
          <div class="mb-3">
            <label for="mensaje">Recomendaciones de administrador</label>
            <input type="text" class="form-control" name="precio" id="mensaje" value="<%=ventaUsuario.getMensajeAdmin()%>" disabled>
          </div>

        </div>
        <div class="col-lg-6">
          <img src="<%=request.getContextPath()%>/imagenServlet?action=listarFotoJuego&id=<%=d.getIdJuego()%>" alt="" class="img-fluid max-width-100">
        </div>
      </div>

      <a class="btn btn-danger mt-3" href="<%=request.getContextPath()%>/AdminJuegosServlet?a=nuevos">Regresar</a>

      <div class="d-flex justify-content-end align-items-center mt-3 mb-5">
        <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=aceptarNuevo&idventa=<%=d.getIdVenta()%>"
           class="btn btn-primary m-1">Aceptar</a>
        <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=noAceptarNuevo&id=<%=d.getIdVenta()%>"
           class="btn btn-primary m-1">No aceptar</a>
        <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=rechazarNuevo&id=<%=d.getIdVenta()%>"
           class="btn btn-danger m-1">Rechazar</a>
      </div>
      <% } %>
    </form>
  </div>
</main>
<!-- End #main -->

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