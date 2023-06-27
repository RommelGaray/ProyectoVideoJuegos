<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto_iweb.models.beans.Juegos" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ArrayList<Juegos> lista = (ArrayList<Juegos>) request.getAttribute("existentes");
%>

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
    <div class="col-lg-1"></div>
        <div class="col-lg-10">
            <% for (Juegos j : lista) { %>
            <div class="card mb-10" style="max-width: 1500px;">
                <div class="row g-0">
                    <div class="col-md-5">
                        <img src="<%=j.getFoto()%>" class="img-fluid rounded-start" alt="...">
                    </div>
                    <div class="col-md-7">
                        <div class="card-body">
                            <h5 class="card-title"><%=j.getNombre()%></h5>
                            <p class="card-text"><%=j.getDescripcion()%></p>
                            <p class="card-text">Numero de Stock: <%=j.getStock()%></p>
                            <p class="card-text">Registro de Venta: <%=j.getIdJuegos()%> </p>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    <div class="col-lg-1"></div>
</main><!-- End #main -->

<!-- ======= Footer ======= -->
<jsp:include page="/includes/footer.jsp">
    <jsp:param name="title" value=""/>
</jsp:include>

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>

<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>
<script src="assets/js/lista.js"></script>
</body>
</html>