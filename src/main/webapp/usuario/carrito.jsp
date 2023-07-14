<%@ page import="com.example.proyecto_iweb.models.beans.Cuentas" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="juegos" scope="request" type="com.example.proyecto_iweb.models.beans.Juegos"/>

<jsp:useBean id="usuarioLog" scope="session" type="com.example.proyecto_iweb.models.beans.Cuentas"
             class="com.example.proyecto_iweb.models.beans.Cuentas"/>

<html>

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

    <script>
        function abrirVentana() {
            window.open("https://www.coordenadas-gps.com/", "_blank");
        }
    </script>

</head>

<body>

<!-- ======= Header ======= -->
<jsp:include page="../includes/narvar.jsp">
    <jsp:param name="currentPage" value="listar"/>
</jsp:include>

<main id="main" class="main">
    <div class="pagetitle">
        <h1>Tu carrito (Cantidad de Productos)</h1>
    </div>


        <div class="row">
            <div class="col-8">
                <div class="container__detail-text bg-light">
                    <div class="container__detail bg-light">
                        <img src="<%=request.getContextPath()%>/imagenServlet?action=listarFotoJuego&id=<%=juegos.getIdJuegos()%>" class="img-thumbnail w-50" alt="...">
                        <div class="col">
                            <p class="fs-2 text-capitalize">clash royale</p>
                            <br>
                            <div class="d-flex align-items-center">
                                <form action="">
                                    <div class="d-flex justify-content-end">
                                        <select name="select-option" id="">
                                            <option value="1" selected>1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                        </select>
                                    </div>
                                </form>
                                <button type="button" class="btn p-0">
                                    <img src="basurita.jpg" alt="Eliminar" width="35" height="35">
                                </button>
                            </div>


                            <br>
                            <br>
                            <p class="text-end fs-5 me-4 text-capitalize">gratis</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-4">
                <div class="container__detail bg-light p-3 text-center" style="display: flex; justify-content: center;">
                    <form>
                        <div class="mb-3">
                            <!--<button type="submit" class="btn btn-primary">Usar direccion predeterminada</button>-->
                            <a class="btn btn-primary" href="https://www.coordenadas-gps.com/" target="_blank">Obtener coordenadas</a>
                        </div>
                        <div class="form-group mb-3">
                            <input type="text" class="form-control form-control-lg" placeholder="Agregar Latitud">
                        </div>
                        <div class="form-group mb-3">
                            <input type="text" class="form-control form-control-lg" placeholder="Agregar Longitud">
                        </div>
                        <div class="form-group mb-3">
                            <input type="text" class="form-control form-control-lg" placeholder="Provincia">
                        </div>
                        <div class="form-group mb-3">
                            <input type="text" class="form-control form-control-lg" placeholder="Distrito">
                        </div>
                        <button type="submit" class="btn btn-primary text-center">Guardar</button>
                    </form>
                </div>

                <div class="container__detail bg-light p-3 d-flex flex-column">
                    <p class="fs-3 fw-semibold text-center">Precio total:</p><p class="fs-4 fw-bold text-center">S/. <%=juegos.getPrecio()%></p>
                    <button type="button" class="btn btn-success mt-3">Pagar</button>
                    <a class="btn btn-primary btn-lg btn-block" href="<%= request.getContextPath() %>/UsuariosCuentasServlet?a=pagar">Pagar oficial</a>
                    <a class="btn btn-primary btn-lg btn-block" href="<%= request.getContextPath() %>/UsuariosCuentasServlet">Cancelar</a>

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

