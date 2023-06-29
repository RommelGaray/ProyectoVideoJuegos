<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="usuarioLog" scope="session" type="com.example.proyecto_iweb.models.beans.Cuentas"
             class="com.example.proyecto_iweb.models.beans.Cuentas"/>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>JA-VAGOS</title>
    <meta content="" name="description">
    <meta content="" name="keywords">
    <link rel="icon" href="pestania.png">

    <!-- Estilos CSS -->
    <!--Importando estilos CSS-->
    <link rel="stylesheet" href="estilos/sistema.css">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">

</head>

<body>

<main>
    <div class="box">
        <div class="fondoInicioSesion">
            <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                            <div class="d-flex justify-content-center py-4">
                                <a href="indexGeneralOficial.html" class="logo d-flex align-items-center w-auto">
                                    <span class="d-none d-lg-block text-light">Ja-Vagos</span>
                                </a>
                            </div>

                            <div class="card mb-3">

                                <div class="card-body">

                                    <div class="pt-4 pb-2">
                                        <h5 class="card-title text-center pb-0 fs-4">Ingrese a su cuenta</h5>
                                        <p class="text-center small">Ingrese su nombre de usuario y contraseña para iniciar sesión</p>
                                    </div>

                                    <form method="POST" action="<%=request.getContextPath()%>/login">


                                        <div class="col-12 mb-3">
                                            <label for="yourUser" class="form-label">Usuario</label>
                                            <input type="text" name="inputEmail" class="form-control" id="yourUser" required placeholder="Correo">

                                        <div class="col-12">
                                            <label for="yourUsername" class="form-label">Correo</label>
                                            <div class="input-group has-validation">
                                                <span class="input-group-text" id="inputGroupPrepend">@</span>
                                                <input type="text" name="inputEmail" class="form-control" id="yourUsername" required placeholder="Correo">
                                                <% if (request.getAttribute("error") != null) { %>
                                                <div class="invalid-feedback">Por favor ingrese su usuario!</div>
                                                <% } %>
                                            </div>

                                        </div>

                                        <div class="col-12 mb-3">
                                            <label for="yourPassword" class="form-label">Contraseña</label>

                                            <input type="password" name="inputPassword" class="form-control" id="yourPassword" required placeholder="Contraseña">
                                            <% if (request.getAttribute("error") != null) { %>
                                            <div class="text-danger mb-2 text-center">!Error en su usuario o contraseña!</div>
                                            <% } %>

                                            <input type="password" name="inputPassword" class="form-control" id="yourPassword" required placeholder="Password">
                                        </div>
                                        <br>
                                        <% if (request.getAttribute("error") != null) { %>
                                        <div class="form-group text-danger mb-3">Por favor ingrese correctamente sus datos!</div>
                                        <% } %>

                                        <div class="col-12">


                                        </div>


                                        <div class="col-12">
                                            <button class="btn btn-primary w-100" type="submit">Ingresar</button>
                                        </div>

                                        <div class="col-12">
                                            <a href="#"> ¿Olvidaste tu contraseña?</a>
                                        </div>

                                        <div class="col-12">
                                            <p class="small mb-0">¿No tienes cuenta?<a href="<%=request.getContextPath()%>/UsuariosCuentasServlet?a=agregar"> Crea una cuenta</a></p>
                                        </div>
                                    </form>

                                </div>
                            </div>

                            <div class="credits">
                                Designed by <a href="#">Ja-Vagos</a>
                            </div>

                        </div>
                    </div>
                </div>

            </section>
        </div>
    </div>
</main>

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->
<script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/vendor/chart.js/chart.umd.js"></script>
<script src="assets/vendor/echarts/echarts.min.js"></script>
<script src="assets/vendor/quill/quill.min.js"></script>
<script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
<script src="assets/vendor/tinymce/tinymce.min.js"></script>
<script src="assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>

</body>

</html>