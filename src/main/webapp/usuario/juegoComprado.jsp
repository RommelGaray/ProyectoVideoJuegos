<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Juegos" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Cuentas" %>
<%@ page import="com.example.proyecto_iweb.models.beans.VentaUsuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="formularioCompra" scope="request" type="com.example.proyecto_iweb.models.beans.CompraUsuario"/>

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
    <style>
        .rating {
            display: flex;
            align-items: center;
        }

        .stars {
            font-size: 20px;
            color: gray;
        }

        .star {
            cursor: pointer;
        }

        .star .bi-star {
            transition: color 0.3s ease;
        }

        .star .bi-star:hover,
        .star .bi-star.active {
            color: gold;
        }
    </style>
</head>

<body>

<!-- ======= Header ======= -->
<jsp:include page="../includes/narvar.jsp">
    <jsp:param name="currentPage" value="postear"/>
</jsp:include>


<main  id="main" class="main">
    <div class="container " >
        <h1 class='mt-3'>Formulario del Juego comprado</h1>
        <% if (session.getAttribute("err") != null) {%>
        <div class="alert alert-danger" role="alert"><%=session.getAttribute("err")%></div>
        <%session.removeAttribute("err");%>
        <% }%>


        <form method="POST" action="<%=request.getContextPath()%>/UsuariosJuegosServlet?p=raiting">
            <input type="hidden" class="form-control" name="idCompra" id="idCompra"
                   value="<%=formularioCompra.getIdCompra()%>">
            <div class="row">
                <div class="col-lg-6">
                    <div class="mb-3">
                        <label for="nombre">Nombre del Juego</label>
                        <input type="text" class="form-control" name="nombre" id="nombre" value="<%=formularioCompra.getJuegos().getNombre()%>" disabled>
                    </div>
                    <div class="mb-3">
                        <label for="precioVenta">Precio</label>
                        <input type="text" class="form-control" name="precioVenta" id="precioVenta" value="<%=formularioCompra.getPrecioCompra()%>" disabled>
                    </div>
                    <div class="mb-3">
                        <label for="descripcion">Descripcion</label>
                        <input type="text" class="form-control" name="descripcion" id="descripcion" value="<%=formularioCompra.getJuegos().getDescripcion()%>" disabled>
                    </div>
                    <div class="mb-3">
                        <label for="consola">Consola</label>
                        <input type="text" class="form-control" name="consola" id="consola" value="<%=formularioCompra.getJuegos().getConsola()%>" disabled>
                    </div>
                    <div class="mb-3">
                        <label for="genero">Genero</label>
                        <input type="text" class="form-control" name="genero" id="genero" value="<%=formularioCompra.getJuegos().getGenero()%>" disabled>
                    </div>
                    <div class="mb-3">
                        <label for="raiting">Raiting</label>
                        <input type="text" class="form-control" name="raiting" id="raiting" value="<%=formularioCompra.getRaiting()%>">
                    </div>
                    <div class="rating">
                        <input type="range" min="0" max="10" step="0.5" id="ratingInput" onchange="updateRating(this.value)" />
                        <div class="stars">
                            <label for="star10" class="star"><i class="bi bi-star"></i></label>
                            <label for="star9" class="star"><i class="bi bi-star"></i></label>
                            <label for="star8" class="star"><i class="bi bi-star"></i></label>
                            <label for="star7" class="star"><i class="bi bi-star"></i></label>
                            <label for="star6" class="star"><i class="bi bi-star"></i></label>
                            <label for="star5" class="star"><i class="bi bi-star"></i></label>
                            <label for="star4" class="star"><i class="bi bi-star"></i></label>
                            <label for="star3" class="star"><i class="bi bi-star"></i></label>
                            <label for="star2" class="star"><i class="bi bi-star"></i></label>
                            <label for="star1" class="star"><i class="bi bi-star"></i></label>
                        </div>
                    </div>
                    <a class="btn btn-danger" href="<%=request.getContextPath()%>/UsuariosJuegosServlet?a=comprados">Cancelar</a>
                    <button type="submit" class="btn btn-primary">Guardar</button>
                </div>
                <div class="col-lg-6">
                    <img src="<%=request.getContextPath()%>/imagenServlet?action=listarFotoJuego&id=<%=formularioCompra.getJuegos().getIdJuegos()%>" alt="" class="img-fluid max-width-100">
                </div>
            </div>


        </form>
    </div>
</main>

<!-- ======= Footer ======= -->
<jsp:include page="/includes/footer.jsp">
    <jsp:param name="title" value=""/>
</jsp:include>



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

<script>
    function updateRating(value) {
        const stars = document.querySelectorAll('.stars label');

        stars.forEach((star, index) => {
            const rating = index + 1;

            if (rating <= value) {
                star.classList.add('active');
            } else {
                star.classList.remove('active');
            }
        });
    }
</script>
</body>

</html>