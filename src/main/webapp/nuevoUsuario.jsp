
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<!-- ======= Head ======= -->
<jsp:include page="/includes/head.jsp">
  <jsp:param name="title" value="Nueva lista"/>
</jsp:include>

<body>

<main>
  <div class="box3">
    <div class="fondoRegistroOficial">
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
                    <h5 class="card-title text-center pb-0 fs-4">Crea una cuenta</h5>
                    <p class="text-center small">Ingrese sus datos personales para crear una cuenta</p>
                  </div>

                  <form method="POST" action="<%=request.getContextPath()%>/UsuariosCuentasServlet?p=guardar" class="row g-3 needs-validation" novalidate>

                    <div class="col-12">
                      <label for="nombre" class="form-label">Nombre</label>
                      <input type="text" name="nombre" class="form-control" id="nombre" required placeholder="Tú nombre">
                      <div class="invalid-feedback">Por favor ingrese su nombre!</div>
                    </div>

                    <div class="col-12">
                      <label for="apellido" class="form-label">Apellido</label>
                      <input type="text" name="apellido" class="form-control" id="apellido" required placeholder="Tú apellido, puede poner ambos">
                      <div class="invalid-feedback">Por favor ingrese su apellido!</div>
                    </div>

                    <div class="col-12">
                      <label for="nickname" class="form-label">Nickname</label>
                      <input type="text" name="nickname" class="form-control" id="nickname" required placeholder="Como te van a ver los demas">
                      <div class="invalid-feedback">Por favor ingrese un Nickname</div>
                    </div>

                    <div class="col-12">
                      <label for="direccion" class="form-label">Dirección</label>
                      <input type="email" name="direccion" class="form-control" id="direccion" required placeholder="Donde va a ir tus juegos comprados">
                      <div class="invalid-feedback">Por favor ingrese su dirección!</div>
                    </div>

                    <div class="col-12">
                      <label for="yourUsername" class="form-label">Correo</label>
                      <div class="input-group has-validation">
                        <span class="input-group-text" id="inputGroupPrepend">@</span>
                        <input type="email" name="correo" class="form-control" id="yourUsername"  required placeholder="Correo">
                        <div class="invalid-feedback">¡Por favor, introduce una dirección de correo electrónico válida!</div>
                      </div>

                    </div>

                    <div class="col-12">
                      <label for="password" class="form-label">Contraseña</label>
                      <input type="email" name="password" class="form-control" id="password" required placeholder="Procura recordar tu contraseña">
                      <div class="invalid-feedback">¡Por favor, introduce una contraseña!!</div>
                    </div>

                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="submit">Crear nueva cuenta</button>
                    </div>
                    <div class="col-12">
                      <p class="small mb-0">¿Ya tienes una cuenta? <a href="<%=request.getContextPath()%>/login">Iniciar Sesión</a></p>
                    </div>
                  </form>

                </div>
              </div>

              <div class="credits">
                Designed by <a href="<%=request.getContextPath()%>/index.jsp">Ja-Vagos</a>
              </div>

            </div>
          </div>
        </div>

      </section>
    </div>
  </div>
</main><!-- End #main -->

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

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

</body>

</html>