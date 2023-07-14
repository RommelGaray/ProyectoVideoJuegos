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
        <h1>Compra de videojuego</h1>
    </div>


        <div class="row">
            <div class="col-8">
                <div class="container__detail-text bg-light">
                    <div class="container__detail bg-light">
                        <img src="<%=request.getContextPath()%>/imagenServlet?action=listarFotoJuego&id=<%=juegos.getIdJuegos()%>" class="img-thumbnail w-50" alt="...">
                        <div class="col">
                            <p class="fs-2 text-capitalize"><%=juegos.getNombre()%></p>
                            <p><%=juegos.getDescripcion()%></p>
                            <p><%=juegos.getGenero()%></p>
                            <p><%=juegos.getConsola()%></p>
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
                            <button onclick="findMe()">Mostrar ubicación</button>
                            <div id="map"></div>
                        </div>

                        <div class="form-group mb-3">
                            <input type="text" class="form-control form-control-lg" placeholder="Agregar Latitud">
                        </div>

                        <div class="form-group mb-3">
                            <input type="text" class="form-control form-control-lg" placeholder="Agregar Longitud">
                        </div>

                        <button type="submit" class="btn btn-primary text-center">Buscar</button>
                        <div class="row">
                            <h5 class="text-center">Ubicación del usuario</h5>
                            <iframe
                                    src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d7803.090718696196!2d-77.09065694650349!3d-12.074770906006872!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses-419!2spe!4v1682624518105!5m2!1ses-419!2spe"
                                    width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy"
                                    referrerpolicy="no-referrer-when-downgrade"></iframe>
                            <br>
                        </div>

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


<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>

<!-- CODIGO EXTRAÍDO DE https://www.youtube.com/watch?v=XX9Kmg3qLRk -->
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY"></script>
<!--<script>
    function findMe(){
        var output = document.getElementById('map');

        // Verificar si soporta geolocalizacion
        if (navigator.geolocation) {
            output.innerHTML = "<p>Tu navegador soporta Geolocalizacion</p>";
        }else{
            output.innerHTML = "<p>Tu navegador no soporta Geolocalizacion</p>";
        }

        //Obtenemos latitud y longitud
        function localizacion(posicion){
            var latitude = posicion.coords.latitude;
            var longitude = posicion.coords.longitude;

            // Segunda parte del video
            // var imgURL = "https://maps.googleapis.com/maps/api/staticmap?center="+latitude+","+longitude+"&size=600x300&markers=color:red%7C"+latitude+","+longitude+"&key=YOUR_API_KEY";

            output.innerHTML = "<p>Latitud: " + latitude+"<br>Longitud: "+longitude+"</p>";
        }

        function error(){
            output.innerHTML = "<p>No se pudo obtener tu ubicación</p>";

        }

        navigator.geolocation.getCurrentPosition(localizacion,error);

    }


</script>
-->
<!--
<script>
    $(document).ready(function(){
        getLocation();
    });

    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition);
        } else {
            alert("Geolocation is not supported by this browser.");
        }
    }
    function showPosition(position) {
        document.getElementById("coordinates").innerHTML = "Latitude: " + position.coords.latitude +
            "<br>Longitude: " + position.coords.longitude;

        //var latitud = position.coords.latitude;
        //var longitud = position.coords.longitude;

        //document.getElementById("latitud").textContent = latitud;
        //document.getElementById("longitud").textContent = longitud;


        //document.getElementById("latitud").value = position.coords.latitude;
        //document.getElementById("longitud").value = position.coords.longitude;
    }
</script>
-->

</body>

</html>

