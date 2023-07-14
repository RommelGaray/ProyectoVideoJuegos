<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Juegos" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Cuentas" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="juegos" scope="request" type="com.example.proyecto_iweb.models.beans.Juegos"/>
<jsp:useBean id="usuarioLog" scope="session" type="com.example.proyecto_iweb.models.beans.Cuentas"
             class="com.example.proyecto_iweb.models.beans.Cuentas"/>
<% ArrayList<Cuentas> listaPerfil = (ArrayList<Cuentas>) request.getAttribute("perfil");
%>




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

    <style>
        .juego-imagen {
            width: 100%;
            height: 260px;
            object-fit: cover;
        }
    </style>

</head>

<body>

<!-- ======= Header ======= -->
<jsp:include page="../includes/narvar.jsp">
    <jsp:param name="currentPage" value="listar"/>
</jsp:include>

<main id="main" class="main">


    <div class="container">
        <div class="row">
            <div class="col-7">
                <div class="container">
                    <img src="<%=request.getContextPath()%>/imagenServlet?action=listarFotoJuego&id=<%=juegos.getIdJuegos()%>" class="img-fluid juego-imagen" alt="Imagen">
                </div>
            </div>
            <div class="col-5">
                <div class="row">
                    <h2 class="text-primary"><%= juegos.getNombre() %></h2>
                    <div class="mb-4" id="descripcion_juego">
                        <p class="lead"><%= juegos.getDescripcion() %></p>
                        <p class="font-weight-bold">Precio: <%= juegos.getPrecio() %></p>
                        <p class="font-weight-bold">Stock: <%= juegos.getStock() %></p>
                    </div>
                    <% if (usuarioLog.getIdCuentas() == 0) { %>
                    <div class="row mt">
                        <button type="submit" class="btn btn-primary btn-lg btn-block">Comprar</button>
                        <a class="btn btn-primary btn-lg btn-block" href="<%= request.getContextPath() %>/UsuariosJuegosServlet?a=carrito">Comprar oficial</a>
                    </div>
                    <% } else { %>
                    <div class="row mt-3">
                        <a class="btn btn-primary btn-lg btn-block" href="<%= request.getContextPath() %>/UsuariosJuegosServlet?a=comprar&id=<%= juegos.getIdJuegos() %>&precio=<%= juegos.getPrecio() %>">Comprar</a>
                        <a class="btn btn-primary btn-lg btn-block" href="<%= request.getContextPath() %>/UsuariosCuentasServlet?a=carrito&id=<%= juegos.getIdJuegos() %>">Comprar oficial</a>

                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>


    <div class="container">
        <div class="row mt-3">
            <div class="col">
                <div class="d-flex justify-content-end">
                    <a class="btn btn-danger" href="<%=request.getContextPath()%>/UsuariosJuegosServlet">Regresar</a>
                </div>
            </div>
        </div>
    </div>

</main><!-- End #main -->

<!-- ======= Footer ======= -->
<jsp:include page="/includes/footer.jsp">
    <jsp:param name="title" value=""/>
</jsp:include>

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>


<!-- Vendor JS Files -->
<script src="/assets/vendor/apexcharts/apexcharts.min.js"></script>
<script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/assets/vendor/chart.js/chart.umd.js"></script>
<script src="/assets/vendor/echarts/echarts.min.js"></script>
<script src="/assets/vendor/quill/quill.min.js"></script>
<script src="/assets/vendor/simple-datatables/simple-datatables.js"></script>
<script src="/assets/vendor/tinymce/tinymce.min.js"></script>
<script src="/assets/vendor/php-email-form/validate.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>
</body>

</html>