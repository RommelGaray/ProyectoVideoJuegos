
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
    <div class="col-md-1"></div>

    <div class="col-md-10 row d-flex justify-content-center border border-primary rounded-4">

        <div class="col-lg-4 m-4">
            <!--VA IR LA FOTO-->
            <div class="col-auto">
                <div class="col-md-9 mx-auto">
                    <img src="user.png" alt="" class="img-fluid mb-4">
                </div>


                <h5 class="text-center">Datos del usuario</h5>
                <table class="table table-bordered">
                    <thead>
                    <tr>

                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>Nombre</td>
                        <td>Nombre completo</td>
                    </tr>
                    <tr>
                        <td>Direccion</td>
                        <td>Av. Universitaria 1919</td>
                    </tr>
                    <tr>
                        <td>Correo</td>
                        <td>Va_vagos@pucp.edu.pe</td>
                    </tr>
                    <tr>
                        <td>Celular</td>
                        <td>987654321</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>


        <div class="col-lg-6 m-2">
            <!--VA IR LA INFORMACIÓN-->
            <div class="row-lg-6">
                <h5 class="text-center">Estadisticas del usuario</h5>
                <table class="table table-bordered">
                    <thead>
                    <tr>

                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>Cant. juegos comprados</td>
                        <td>23</td>
                    </tr>
                    <tr>
                        <td>Cant. juegos vendidos</td>
                        <td>2</td>
                    </tr>
                    <tr>
                        <td>Cant. juegos pendientes</td>
                        <td>13</td>
                    </tr>
                    <tr>
                        <td>Dinero gastado</td>
                        <td>$230</td>
                    </tr>
                    </tbody>
                </table>
            </div>


            <div class="row">
                <h5 class="text-center">Ubicación del usuario</h5>
                <iframe
                        src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d7803.090718696196!2d-77.09065694650349!3d-12.074770906006872!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses-419!2spe!4v1682624518105!5m2!1ses-419!2spe"
                        width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy"
                        referrerpolicy="no-referrer-when-downgrade"></iframe>
                <br>
            </div>
            <br>
        </div>

    </div>

    <div class="col-md-1"></div>
    <br>
    <a href="<%=request.getContextPath()%>/AdminServlet" class="btn btn-danger">Regresar</a>

</main>


<!-- ======= Footer ======= -->
<jsp:include page="/includes/footer.jsp">
    <jsp:param name="title" value=""/>
</jsp:include>

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>


<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>
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
        document.getElementById("latitud").value = position.coords.latitude;
        document.getElementById("longitud").value = position.coords.longitude;
    }
</script>
</body>

</html>
