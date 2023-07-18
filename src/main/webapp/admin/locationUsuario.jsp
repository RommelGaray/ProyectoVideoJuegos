<%@ page import="com.example.proyecto_iweb.models.beans.Cuentas" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<jsp:useBean id="usuario" scope="request" type="com.example.proyecto_iweb.models.beans.Cuentas"/>


<!DOCTYPE html>
<html lang="en">
<!-- ======= Head ======= -->
<jsp:include page="/includes/head.jsp">
    <jsp:param name="title" value="Nueva lista"/>
</jsp:include>
<body>
<!-- ======= Header ======= -->
<jsp:include page="../includes/narvar.jsp">
    <jsp:param name="currentPage" value="reservasYcomprados"/>
</jsp:include>

<!-- ======= Main ======= -->
<main id="main" class="main">

    <div class="container">
        <div class="pagetitle">
            <h1>Ubicación del usuario: <%=usuario.getNombre()%> <%=usuario.getApellido()%></h1>
        </div>

        <div class="row">
            <div class="mb-3">
                <label for="nombre">Nombre</label>
                <input type="text" class="form-control" name="nombre" id="nombre" value="<%=usuario.getNombre()%> <%=usuario.getApellido()%>" disabled>
            </div>

            <div class="mb-3">
                <label for="nombre">Dirección</label>
                <input type="text" class="form-control" name="direccion" id="direccion" value="<%=usuario.getDireccion()%>" disabled>
            </div>

            <!-- BORRAR -->

            <% if((usuario.getLatitud() == null) || (usuario.getLongitud() == null) ) { %>

                <%
                    double latitud = -12.046374;
                    double longitud = -77.042793;

                %>

                <input type="text" class="form-control" name="latitud" id="latitud"
                       value="<%=latitud%>">

                <input type="text" class="form-control" name="longitud" id="longitud"
                       value="<%=longitud%>">

            <% } else {%>

                <% double latitud = Double.parseDouble(usuario.getLatitud()); %>
                <% double longitud = Double.parseDouble(usuario.getLongitud()); %>


                <input type="text" class="form-control" name="latitud" id="latitud"
                       value="<%=latitud%>">

                <input type="text" class="form-control" name="longitud" id="longitud"
                       value="<%=longitud%>">

            <% } %>

            <input type="text" class="form-control" name="latitud" id="latitud"
                   value="<%=usuario.getLatitud()%>">

            <input type="text" class="form-control" name="longitud" id="longitud"
                   value="<%=usuario.getLongitud()%>">

            <!-- HASTA AQUI BORRAR -->

            <div class="mb-3">
                <label for="nombre">Ubicación</label>
                <div id="map" style="height:400px;width:100%;"></div>
            </div>


        </div>

        <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=reservas" class="btn btn-danger">Regresar</a>

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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD7OI9p3JeWeSVqhVpIo-duXemjBLL33cM&libraries=places&callback=initMap" async defer></script>

<script>
    let map;
    let marker;

    <% if((usuario.getLatitud() == null) || (usuario.getLongitud() == null) ) { %>
        let latitud = -12.046374;
        let longitud = -77.042793;
    <% } else {%>
        let latitud = <%= Double.parseDouble(usuario.getLatitud()) %>;
        let longitud = <%= Double.parseDouble(usuario.getLongitud()) %>;
    <% } %>



    function initMap() {

        // Se crea un mapa
        map = new google.maps.Map(document.getElementById("map"), {
            center: { lat: latitud, lng: longitud }, // Coordenadas de Lima, Perú
            zoom: 12, // Nivel de zoom inicial
        });

        // Se crea un marcador centrado en coordenadas de Lima
        marker = new google.maps.Marker({
            map: map,
            draggable: true, // Permite arrastrar el marcador
            position: { lat: latitud, lng: longitud }, // Coordenadas de Lima, Perú
        });

        // Escucha el evento 'dragend' para actualizar las coordenadas del marcador cuando se arrastra

        marker.addListener("dragend", function () {
            updateMarkerPosition(marker.getPosition());
        });



        // Inicia la búsqueda de lugares en el input de dirección
        initPlaces();
    }

    function initPlaces() {
        // Obtiene el valor del id dirección
        const input = document.getElementById("direccion");

        // Creamos restricciones para que las búsquedas solo se limiten a Perú
        const searchOptions = {
            componentRestrictions: { country: "pe" }
        };

        // Creamos un objeto de búsqueda de lugares y se vincula al campo de dirección
        const searchBox = new google.maps.places.SearchBox(input, searchOptions);



        // Escucha el evento 'places_changed' cuando se selecciona un lugar de la lista de resultados
        searchBox.addListener("places_changed", function () {
            const places = searchBox.getPlaces();

            if (places.length === 0) {
                return;
            }

            const place = places[0];

            // Centra el mapa en la ubicación seleccionada
            map.setCenter(place.geometry.location);
            map.setZoom(15);

            // Actualiza la posición del marcador en la ubicación seleccionada
            marker.setPosition(place.geometry.location);
            updateMarkerPosition(place.geometry.location);
        });
    }


    function updateMarkerPosition(position) {
        // Obtiene las coordenadas latitud y longitud del marcador
        const lat = position.lat();
        const lng = position.lng();

        // Actualiza los valores de latitud y longitud en los campos de texto ocultos
        document.getElementById("latitud").value = lat;
        document.getElementById("longitud").value = lng;
    }



</script>


</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

</html>
