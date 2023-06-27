
<%@ page import="com.example.proyecto_iweb.models.beans.Juegos" %>
<%@ page import="com.example.proyecto_iweb.models.dtos.Consolas" %>
<%@ page import="com.example.proyecto_iweb.models.dtos.Generos" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="juego" scope="request" type="com.example.proyecto_iweb.models.beans.Juegos"/>
<jsp:useBean id="consolas" type="java.util.ArrayList<com.example.proyecto_iweb.models.dtos.Consolas>" scope="request"/>
<jsp:useBean id="generos" type="java.util.ArrayList<com.example.proyecto_iweb.models.dtos.Generos>" scope="request"/>

<!DOCTYPE html>
<html lang="en">

<!-- ======= Head ======= -->
<jsp:include page="/includes/head.jsp">
    <jsp:param name="title" value="Nueva lista"/>
</jsp:include>

<body>

<!-- ======= Header ======= -->
<jsp:include page="../includes/narvar.jsp">
    <jsp:param name="currentPage" value="editarJuego"/>
</jsp:include>

<!-- ======= Main ======= -->
<main id="main" class="main">

    <div class="pagetitle">
        <h1>Editar juego</h1>
    </div>

    <div class="container">
        <form method="POST" action="<%=request.getContextPath()%>/AdminJuegosServlet?p=actualizar">
            <input type="hidden" class="form-control" name="idJuego" id="idJuego"
                   value="<%=juego.getIdJuegos()%>">

            <div class="mb-3">
                <label for="nombre">Nombre</label>
                <input type="text" class="form-control" name="nombre" id="nombre" value="<%=juego.getNombre()%>">
            </div>

            <div class="mb-3">
                <label for="descripcion">Descripción</label>
                <input type="text" class="form-control" name="descripcion" id="descripcion" value="<%=juego.getDescripcion()%>">
            </div>

            <div class="mb-3">
                <label for="precio">Precio</label>
                <input type="text" class="form-control" name="precio" id="precio" value="<%=juego.getPrecio()%>">
            </div>

            <div class="mb-3">
                <label for="descuento">Descuento</label>
                <input type="text" class="form-control" name="descuento" id="descuento" value="<%=juego.getDescuento()%>">
            </div>

            <div class="input-group mb-3">
                <label for="consola">Consola</label>
                <div class="col-12">
                    <select name="consola" id="consola" class="form-control">
                        <% for (Consolas c : consolas) { %>
                        <option value="<%=c.getNombre()%>" <%=juego.getConsola().equals(c.getNombre()) ? "selected" : "" %>><%=c.getNombre()%></option>
                        <% } %>
                    </select>
                </div>
            </div>

            <div class="input-group mb-3">
                <label for="genero">Genero</label>
                <div class="col-12">
                    <select name="genero" id="genero" class="form-control">
                        <% for (Generos g : generos) { %>
                        <option value="<%=g.getNombre()%>" <%=juego.getGenero().equals(g.getNombre()) ? "selected" : "" %>><%=g.getNombre()%></option>
                        <% } %>
                    </select>
                </div>
            </div>


            <div class="mb-3">
                <label for="stock">Stock</label>
                <input type="text" class="form-control" name="stock" id="stock" value="<%=juego.getStock()%>">
            </div>


            <a class="btn btn-danger" href="<%=request.getContextPath()%>/AdminJuegosServlet">Cancelar</a>
            <button type="submit" class="btn btn-primary">Actualizar</button>
        </form>
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
