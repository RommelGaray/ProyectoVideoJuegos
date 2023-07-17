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

    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .container {
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
        }


        /* Estilos adicionales para el botón y el mapa */
        .form-group {
            display: flex;
            flex-direction: column;
            align-items: center;
        }


        #map{
            margin: 20px;
        }


    </style>
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
        <div class="col-7">
            <div class="container__detail-text bg-light">
                <div class="container__detail bg-light">
                    <img src="<%=request.getContextPath()%>/imagenServlet?action=listarFotoJuego&id=<%=juegos.getIdJuegos()%>" class="img-thumbnail w-50" alt="...">
                    <div class="col">
                        <p class="fs-2 text-capitalize"><%=juegos.getNombre()%></p>

                    </div>
                </div>
            </div>
        </div>
        <div class="col-5">
            <!-- CREDIT CARD FORM STARTS HERE -->
            <div class="panel panel-default credit-card-box customwidth center-block">
                <div class="panel-heading display-table" >
                    <div class="row display-tr" >
                        <h3 class="panel-title display-td" >Payment Hola</h3>
                        <div class="display-td" id="cardLogoTop">
                            <img class="img-responsive pull-right" src="https://i.imgur.com/gIMFDbp.png">
                            <!-- <img class="img-responsive pull-right" src="https://i.imgur.com/WluzPvZ.png">
                            <img class="img-responsive pull-right" src="https://i.imgur.com/H5lJRwk.png">
                            <img class="img-responsive pull-right" src="https://i.imgur.com/1U8OBnM.png">
                            <img class="img-responsive pull-right" src="https://i.imgur.com/iqIDYfz.png">
                            -->
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <form role="form" id="payment-form" method="post" action="" onSubmit="return false;">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label for="cardNumber">CARD NUMBER</label>
                                    <div class="input-group">
                                        <input
                                                type="tel"
                                                class="form-control"
                                                name="cardNumber"
                                                id="cardNumber"
                                                placeholder="XXXX-XXXX-XXXX-XXXX"
                                                autocomplete="cc-number"
                                                pattern="^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|6(?:011|5[0-9]{2})[0-9]{12}|(?:2131|1800|35\d{3})\d{11})$"
                                                required autofocus
                                                onchange="validar(this.value)"
                                                onblur="
                                  // save input string and strip out non-numbers
                                  cc_number_saved = this.value;
                                  this.value = this.value.replace(/[^\d]/g, '');
                                  if(!validar(this.value)) {
                                    alert('Disculpe, este número de atrjeta no es válido');
                                    this.value = '';
                                  }
                                " onfocus="
                                  // restore saved string
                                  if(this.value != cc_number_saved) this.value = cc_number_saved;
                                "
                                        />
                                        <span class="input-group-addon"><i class="fa fa-credit-card" id="cardlogo" style="color:purple;font-size:2rem;"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-7 col-md-7">
                                <div class="form-group">
                                    <label for="cardExpiry"><span class="hidden-xs">EXPIRATION</span><span class="visible-xs-inline">EXP</span> DATE</label>
                                    <input
                                            type="tel"
                                            class="form-control"
                                            name="cardExpiry"
                                            placeholder="MM / YY"
                                            autocomplete="cc-exp"
                                            required
                                    />
                                </div>
                            </div>
                            <div class="col-xs-5 col-md-5 pull-right">
                                <div class="form-group">
                                    <label for="cardCVC">CV CODE</label>
                                    <input
                                            type="tel"
                                            class="form-control"
                                            name="cardCVC"
                                            placeholder="CVC"
                                            autocomplete="cc-csc"
                                            required
                                            pattern="^[0-9]{4}"
                                            title="Debe escribir un código válido"
                                    />
                                </div>
                            </div>
                        </div>
                        <!--<div class="row">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label for="couponCode">COUPON CODE</label>
                                    <input type="text" class="form-control" name="couponCode" />
                                </div>
                            </div>
                        </div>-->
                        <div class="row" style="display:none;">
                            <div class="col-xs-12">
                                <p class="payment-errors"></p>
                            </div>
                        </div>
                    </form>


                </div>
            </div>
            <!-- CREDIT CARD FORM ENDS HERE -->
        </div>
    </div>

    <div class="container__detail bg-light p-3 text-center" style="display: flex; justify-content: center;">
        <div>
            <button onclick="findMe()">Mostrar ubicación</button>
            <div id="map"></div>
        </div>
<<<<<<< HEAD


        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAQLKR9qOir3xYs4JC_k2k0QEeEVCGPUGA"></script>
=======
>>>>>>> ae332a877f23b8ab55d1d9a1e910b950512ff0ce
        <script>
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

                    var imgURL = "https://maps.googleapis.com/maps/api/staticmap?center="+latitude+","+longitude+"&size=600x300&markers=color:red%7C"+latitude+","+longitude+"&key=AIzaSyAQLKR9qOir3xYs4JC_k2k0QEeEVCGPUGA";

                    output.innerHTML ="<img src='"+imgURL+"'>";


                }

                function error(){
                    output.innerHTML = "<p>No se pudo obtener tu ubicación</p>";

                }

                navigator.geolocation.getCurrentPosition(localizacion,error);

            }
        </script>
    </div>

    <div class="container__detail bg-light p-3 d-flex flex-column">
        <p class="fs-3 fw-semibold text-center">Precio total:</p><p class="fs-4 fw-bold text-center">S/. <%=juegos.getPrecio()%></p>
        <button type="button" class="btn btn-success mt-3">Pagar</button>
        <a class="btn btn-primary btn-lg btn-block" href="<%= request.getContextPath() %>/UsuariosCuentasServlet?a=pagar">Pagar oficial</a>
        <a class="btn btn-primary btn-lg btn-block" href="<%= request.getContextPath() %>/UsuariosCuentasServlet">Cancelar</a>
    </div>


</main><!-- End #main -->

<!-- ======= Footer ======= -->


<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>


<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>

<!-- CODIGO EXTRAÍDO DE https://www.youtube.com/watch?v=XX9Kmg3qLRk -->

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

