
<%@ page import="com.example.proyecto_iweb.models.beans.Cuentas" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto_iweb.models.beans.CompraUsuario" %>
<%@ page import="java.time.*" %>

<% ArrayList<CompraUsuario> lista = (ArrayList<CompraUsuario>) request.getAttribute("lista"); %>

<!DOCTYPE html>
<html lang="en">
<!-- ======= Head ======= -->
<jsp:include page="../includes/head.jsp">
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
            <h1>Juegos comprados y reservados</h1>
        </div>

        <table id="example" class="table table-striped" style="width:100%">
            <thead>
            <tr>
                <th>Id Compra</th>
                <th>Usuario</th>
                <th>Juego</th>
                <th>Fecha</th>
                <th>Estado</th>
                <th>Observación</th>
                <th></th>
                <th class="d-flex justify-content-center">Detalles</th>
            </tr>
            </thead>
            <tbody>
            <% for (CompraUsuario c : lista) { %>
            <tr>
                <td><%=c.getIdCompra()%></td>
                <td><%=c.getUsuario().getNombre()%> <%=c.getUsuario().getApellido()%></td>
                <td><%=c.getJuegos().getNombre()%></td>
                <td><%=c.getFechaCompra()%></td>
                <td><%=c.getEstados().getEstados()%></td>
                <!-- Observación EN DIAS -->
                <% if (c.getEstados().getEstados().equals("Pendiente")) {%>
                    <%
                        LocalDate fecha1 = c.getFechaCompra().toLocalDate();
                        LocalDate fecha2 = LocalDate.now();
                        Period period = fecha1.until(fecha2);
                        int diferenciaEnDias = period.getDays();
                    %>

                    <% if (diferenciaEnDias>3 && diferenciaEnDias<=10) {%>
                        <td><p class="text-danger"> <%=diferenciaEnDias%> días</p></td>
                    <%} else if (diferenciaEnDias>10) {%>
                        <td><h4 class="fw-bold text-danger"> <%=diferenciaEnDias%> días</h4></td>
                    <%} else {%>
                        <td><p> <%=diferenciaEnDias%> días</p></td>
                    <%}%>

                <%} else {%>
                    <td>
                        <p>Completado</p>
                    </td>
                <%}%>

                <!-- MENSAJE -->
                <% if (c.getEstados().getEstados().equals("Pendiente")) {%>
                    <%
                        LocalDate fecha1 = c.getFechaCompra().toLocalDate();
                        LocalDate fecha2 = LocalDate.now();
                        Period period = fecha1.until(fecha2);
                        int diferenciaEnDias = period.getDays();
                    %>

                    <% if (diferenciaEnDias>3 && diferenciaEnDias<=10) {%>
                        <td><i class="bi bi-hourglass-split text-primary"></i></td>
                    <%} else if (diferenciaEnDias>10) {%>
                        <td><a class="bi bi-chat-square-text text-danger fw-bold"></a></td>
                    <%} else {%>
                        <td><i class="bi bi-hourglass-split text-primary"></i></td>
                    <%}%>

                <%} else {%>
                    <td><i class="bi bi-check-square text-success"></i></td>
                <%}%>

                <td>
                    <div class="d-flex justify-content-center">
                        <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=detallesCompra&id=<%=c.getIdCompra()%>"
                           class="btn btn-primary m-1"><i class="bi bi-list-task"></i></a>
                        <a href="<%=request.getContextPath()%>/AdminJuegosServlet?a=perfilUsuarios&id=<%=c.getIdCompra()%>"
                           class="btn btn-primary m-1"><i class="bi bi-person-circle"></i></a>
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
