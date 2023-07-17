<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Juegos" %>
<%@ page import="com.example.proyecto_iweb.models.beans.CompraUsuario" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.example.proyecto_iweb.models.beans.VentaUsuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ArrayList<VentaUsuario> lista = (ArrayList<VentaUsuario>) request.getAttribute("nuevos");%>
<% ArrayList<CompraUsuario> lista1 = (ArrayList<CompraUsuario>) request.getAttribute("nuevos");%>
<jsp:useBean id="ventaUsuario" scope="request" type="com.example.proyecto_iweb.models.beans.VentaUsuario"/>


<!DOCTYPE html>
<html lang="en">
<!-- ======= Head ======= -->
<jsp:include page="/includes/head.jsp">
  <jsp:param name="title" value="Nueva lista"/>
</jsp:include>
<body>
<!-- ======= Header ======= -->
<jsp:include page="../includes/narvar.jsp">
  <jsp:param name="currentPage" value="juegosNuevos"/>
</jsp:include>

<!-- ======= Main ======= -->
<main id="main" class="main">
  <div class="container " >
    <h1 class='mt-3'>Detalles de juego nuevo</h1>


    <form method="POST" action="<%=request.getContextPath()%>/UsuariosJuegosServlet">
      <input type="hidden" class="form-control">
      <div class="row">
        <div class="col-lg-6">
          <div class="mb-3">
            <label >Nombre del Juego</label>
          </div>
          <div class="mb-3">
            <label >Usuario vendedor</label>
          </div>
          <div class="mb-3">
            <label for="precio">Precio</label>
            <input type="text" class="form-control" name="precio" id="precio" value="<%=ventaUsuario.getPrecioVenta()%>" disabled>
          </div>
          <div class="mb-3">
            <label>Descripción</label>
          </div>
          <div class="mb-3">
            <label >Consola</label>
          </div>
          <div class="mb-3">
            <label >Genero</label>
          </div>
          <div class="mb-3">
            <label for="mensaje">Recomendaciones de administrador</label>
            <input type="text" class="form-control" name="precio" id="mensaje" value="<%=ventaUsuario.getMensajeAdmin()%>" disabled>
          </div>

          <div class="mb-3" >
            <label type="hidden" class="form-label"></label>
          </div>
          <a class="btn btn-danger" href="<%=request.getContextPath()%>/AdminJuegosServlet?a=nuevos">Regresar</a>
        </div>
        <div class="col-lg-6">
          <img src="" alt="" class="img-fluid max-width-100">
        </div>
      </div>


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