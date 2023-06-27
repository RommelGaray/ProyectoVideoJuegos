
<%@ page import="com.example.proyecto_iweb.models.beans.Juegos" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>

<% ArrayList<Juegos> ofertas = (ArrayList<Juegos>) request.getAttribute("ofertas"); %>

<!DOCTYPE html>
<html lang="en">

<!-- ======= Head ======= -->
<jsp:include page="/includes/head.jsp">
    <jsp:param name="title" value="Nueva lista"/>
</jsp:include>
<body>
<!-- ======= Header ======= -->
<jsp:include page="../includes/narvar.jsp">
    <jsp:param name="currentPage" value="ofertas"/>
</jsp:include>

<!-- ======= Main ======= -->
<main id="main" class="main">

    <div class="pagetitle">
        <h1>Juegos Ofertados</h1>
    </div>

    <div class="container">

        <table id="example" class="table table-striped" style="width:100%">
            <thead>
            <tr>
                <th>Name de juego</th>
                <th>Precio</th>
                <th>Stock</th>
                <th>Descuento</th>
                <th>Opciones</th>
            </tr>
            </thead>
            <tbody>
            <% for (Juegos o : ofertas) { %>
            <tr>
                <td><%=o.getNombre()%> </td>
                <td><%=o.getPrecio()%></td>
                <td><%=o.getStock()%></td>
                <td><%=o.getDescuento()%></td>
                <td>
                    <div class="d-flex justify-content-center">
                        <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=verJuego&id=<%=o.getIdJuegos()%>" class="btn btn-primary m-1">Ver juego</a>
                        <a onclick="return confirm('¿Esta seguro de eliminar esta oferta?')" class="btn btn-danger m-1"
                           href="<%=request.getContextPath()%>/AdminJuegosServlet?a=eliminarOferta&id=<%=o.getIdJuegos()%>">Eliminar</a>
                    </div>
                </td>
            </tr>
            <% } %>

            </tbody>

        </table>
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
<script src="assets/js/lista.js"></script>
</body>
</html>