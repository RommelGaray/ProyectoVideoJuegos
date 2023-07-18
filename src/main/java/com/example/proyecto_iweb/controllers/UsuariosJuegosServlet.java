package com.example.proyecto_iweb.controllers;

import java.io.*;
import java.util.regex.Pattern;

import com.example.proyecto_iweb.models.beans.CompraUsuario;
import com.example.proyecto_iweb.models.beans.Cuentas;
import com.example.proyecto_iweb.models.beans.Juegos;
import com.example.proyecto_iweb.models.beans.VentaUsuario;
import com.example.proyecto_iweb.models.daos.EnvioCorreos;
import com.example.proyecto_iweb.models.daos.UsuarioCuentasDaos;
import com.example.proyecto_iweb.models.daos.UsuarioJuegosDaos;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "UsuariosJuegosServlet", urlPatterns = {"/UsuariosJuegosServlet"})
@MultipartConfig
public class UsuariosJuegosServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");



        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");

        UsuarioJuegosDaos usuarioJuegosDaos = new UsuarioJuegosDaos();
        UsuarioCuentasDaos usuarioCuentasDaos = new UsuarioCuentasDaos();
        HttpSession session6 = request.getSession();
        Cuentas cuentas = (Cuentas) session6.getAttribute("usuarioLog");

        switch (action) {

            case "listar":
                request.setAttribute("lista", usuarioJuegosDaos.listarJuegos());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("usuario/indexUsuarioOficial.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "listar1":
                request.setAttribute("lista", usuarioJuegosDaos.listarJuegos());
                RequestDispatcher requestDispatcher1 = request.getRequestDispatcher("usuario/postearUsuariosOficial.jsp");
                requestDispatcher1.forward(request, response);
                break;
            case "verjuego":
                int juegoId = Integer.parseInt(request.getParameter("id"));
                request.setAttribute("juegos", usuarioJuegosDaos.listarJuegoRaiting(juegoId));
                //request.setAttribute("raiting", usuarioJuegosDaos.raiting(juegoId));
                request.getRequestDispatcher("usuario/verJuego.jsp").forward(request, response);
                break;
            case "vendidos":

                request.setAttribute("lista2", usuarioJuegosDaos.listarVendidos(cuentas.getIdCuentas()));
                request.getRequestDispatcher("usuario/vendidosUsuariosOficial.jsp").forward(request, response);
                break;
            case "comprados":

                request.setAttribute("lista3", usuarioJuegosDaos.listarComprados(cuentas.getIdCuentas()));
                request.setAttribute("generoMasComprado",usuarioJuegosDaos.generoMasComprado(cuentas.getIdCuentas()));
                request.setAttribute("generoMasComprado1",usuarioJuegosDaos.generosComprados(cuentas.getIdCuentas()));
                request.getRequestDispatcher("usuario/compradosUsuariosOficial.jsp").forward(request, response);
                break;
            case  "perfil" :
                String id = request.getParameter("id");
                request.setAttribute("cuentas", usuarioCuentasDaos.listar(cuentas.getIdCuentas()));
                request.getRequestDispatcher("usuario/miPerfilOficial.jsp").forward(request, response);
                break;
            case "borrar":
                String id2 = request.getParameter("id");
                usuarioJuegosDaos.borrar(id2);
                response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet");
                break;
            case "listarNotificaciones":

                request.setAttribute("notificaciones", usuarioJuegosDaos.listarNotificaciones(cuentas.getIdCuentas()));
                request.getRequestDispatcher("usuario/notificacionesUsuarioOficial.jsp").forward(request,response);
                break;
            case "agregar":
                request.setAttribute("consolas", usuarioJuegosDaos.consolas());
                request.setAttribute("generos", usuarioJuegosDaos.generos());
                request.getRequestDispatcher("usuario/agregarjuegonuevo.jsp").forward(request, response);
                break;
            case "ofertas":
                request.setAttribute("ofertas", usuarioJuegosDaos.listarOfertas());
                request.getRequestDispatcher("usuario/ofertasUsuarioOficial.jsp").forward(request,response);
                break;
            case "actualizarVenta":
                String id3 =request.getParameter("id");
                usuarioJuegosDaos.actualizarEstadoVenta(id3);
                response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet?a=vendidos" );
                break;

            case "eliminarVenta":
                String id4 =request.getParameter("id");
                usuarioJuegosDaos.eliminarVenta(id4);
                HttpSession session2 = request.getSession();
                Cuentas cuentas2 = (Cuentas) session2.getAttribute("usuarioLog");

                response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet?a=vendidos");
                break;

            case "gc":
                String consola = request.getParameter("consola");
                String genero = request.getParameter("genero");
                request.setAttribute("lista", usuarioJuegosDaos.generosyconsolas(consola,genero));
                request.getRequestDispatcher("usuario/indexUsuarioOficial.jsp").forward(request, response);
                break;

            case "verPrecio":

                String id5 = request.getParameter("id");
                VentaUsuario venta = usuarioJuegosDaos.verVenta(id5);

                if(cuentas.getIdCuentas()==venta.getIdUsuario()){
                    request.setAttribute("verVenta", usuarioJuegosDaos.verVenta(id5));
                    request.getRequestDispatcher("usuario/editarPrecioJuego.jsp").forward(request, response);
                }else{

                    session6.setAttribute("nonono","Esta prohibido ingresar ahí");
                    response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet?a=vendidos ");
                }
                          ;
                break;

            case "agregarjuego":
                String id7 =request.getParameter("id");
                request.setAttribute("verJuego", usuarioJuegosDaos.listar(Integer.parseInt(id7)));
                request.getRequestDispatcher("usuario/agregarjuegoexistente.jsp").forward(request, response);
                break;


            case "recomendaciones":

                request.setAttribute("recomendaciones",usuarioJuegosDaos.recomendaciones(cuentas.getIdCuentas()));
                request.getRequestDispatcher("usuario/recomendaciones.jsp").forward(request,response);
                break;

            case "formulario":
                String id6 = request.getParameter("id");
                VentaUsuario venta1 = usuarioJuegosDaos.verVenta(id6);

                if(cuentas.getIdCuentas()==venta1.getIdUsuario()){
                    request.setAttribute("formulario",usuarioJuegosDaos.verVenta(id6));
                    request.getRequestDispatcher("usuario/formularioJuego.jsp").forward(request,response);
                }else{
                    session6.setAttribute("nonono","Esta prohibido ingresar ahí");
                    response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet?a=vendidos ");
                }
                break;
            case "formularioCompra":
                String id8 = request.getParameter("id");
                CompraUsuario compra = usuarioJuegosDaos.verCompra(id8);
                if(cuentas.getIdCuentas()==compra.getIdUsuario()){
                    request.setAttribute("formularioCompra",usuarioJuegosDaos.verCompra(id8));
                    request.getRequestDispatcher("usuario/juegoComprado.jsp").forward(request,response);
                }else{
                    session6.setAttribute("nonono","Esta prohibido ingresar ahí");
                    response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet?a=comprados ");
                }

                break;


        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        String action = request.getParameter("p") == null ? "crear" : request.getParameter("p");

        EnvioCorreos envioCorreos = new EnvioCorreos();
        UsuarioCuentasDaos usuarioCuentasDaos = new UsuarioCuentasDaos();
        UsuarioJuegosDaos usuarioJuegosDaos = new UsuarioJuegosDaos();

        switch (action) {
            case "b":
                String textoBuscar = request.getParameter("textoBuscar");
                request.setAttribute("lista", usuarioJuegosDaos.buscarPorTitle(textoBuscar));
                request.getRequestDispatcher("usuario/postearUsuariosOficial.jsp").forward(request, response);
                break;
            case "b1":
                String textoBuscar1 = request.getParameter("buscador");
                request.setAttribute("lista", usuarioJuegosDaos.buscarPorTitle(textoBuscar1));
                request.getRequestDispatcher("usuario/indexUsuarioOficial.jsp").forward(request, response);
                break;
            case "c":
                InputStream inputStream;
                Juegos juegos = parseJuegosPosteadosNuevos(request);
                Part filePart = request.getPart("foto");


                inputStream = filePart.getInputStream();
                if (filePart != null) {
                    System.out.println("Part Content Type: " + filePart.getContentType());
                    inputStream = filePart.getInputStream();
                }
                HttpSession session = request.getSession();
                Cuentas cuentas = (Cuentas) session.getAttribute("usuarioLog");
                if (juegos != null) {
                    String precioString = String.valueOf(juegos.getPrecio());
                    if (juegos.getNombre().isEmpty() || precioString.isEmpty() || juegos.getDescripcion().isEmpty() || juegos.getPrecio()<0) {
                        session.setAttribute("error2","Ingrese correctamente los datos");
                        response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet?a=agregar");
                    }else{
                        usuarioJuegosDaos.guardar(juegos, cuentas.getIdCuentas(),inputStream);
                        response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet?a=listar1");
                    }
                }else{
                    session.setAttribute("error", "Error al igresar el valor del precio");
                    response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet?a=agregar");
                }
                break;
            case "a":
                VentaUsuario ventaUsuario = parseVentas(request);
                HttpSession session2 = request.getSession();
                if(ventaUsuario != null){
                    String precioString = String.valueOf(ventaUsuario.getPrecioVenta());
                    if(ventaUsuario.getPrecioVenta()<0 || precioString.isEmpty()|| ventaUsuario.getPrecioVenta()==0){
                        session2.setAttribute("err","Precio que no cumple lo establecido");
                        response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet?a=verPrecio&id="+ ventaUsuario.getIdVenta());
                    }
                    else {
                        usuarioJuegosDaos.actualizarPrecioVenta(ventaUsuario);
                        session2.setAttribute("msg","Precio editado exitosamente");
                        response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet?a=vendidos ");
                    }
                }
                break;

            case "e":
                Juegos juegos1 = parseJuegos(request);
                HttpSession session1 = request.getSession();
                Cuentas cuentas1 = (Cuentas) session1.getAttribute("usuarioLog");
                usuarioJuegosDaos.guardarVenta1(juegos1,cuentas1.getIdCuentas());
                response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet?a=listar1");


                break;
            case "raiting":
                CompraUsuario compraUsuario = parseCompra(request);
                String raiting = request.getParameter("raiting");

                HttpSession session3 = request.getSession();
                if(compraUsuario != null){

                    if(compraUsuario.getRaiting()<1 ||compraUsuario.getRaiting()>5){

                        session3.setAttribute("err","Coloque un número entre del 1 (No me gusta) al 5 (Me Encanta)");
                        response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet?a=formularioCompra&id="+ compraUsuario.getIdCompra());
                    }
                    else {
                        usuarioJuegosDaos.actualizarRaiting(compraUsuario);
                        session3.setAttribute("msg","Gracias por compartir su opinion con nosotros");
                        response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet?a=comprados ");
                    }
                }
                break;
            case "comprar":
                String idJuegoStr =request.getParameter("idJuego");
                String precioStr = request.getParameter("precio");
                String latitudStr = request.getParameter("latitud");
                String longitudStr = request.getParameter("longitud");
                String nombreJuego = request.getParameter("nombre");
                double precio = Double.parseDouble(precioStr);
                double latitud = Double.parseDouble(latitudStr);
                double longitud = Double.parseDouble(longitudStr);
                int idJuego = Integer.parseInt(idJuegoStr);
                HttpSession session4 = request.getSession();
                Cuentas cuentas4 = (Cuentas) session4.getAttribute("usuarioLog");
                if(longitud== 0 || latitud==0){
                    session4.setAttribute("err","Mueva el marcador a un lugar apropiado");
                    response.sendRedirect(request.getContextPath() + "/UsuariosCuentasServlet?a=carrito");
                }else{
                    usuarioCuentasDaos.actualizarLatLong(cuentas4.getIdCuentas(),longitud,latitud);
                    usuarioJuegosDaos.guardarCompra(idJuego,cuentas4.getIdCuentas(),precio,cuentas4.getDireccion());
                    response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet?a=listar");
                    session4.setAttribute("msg","Compra Exitosa");
                }

                usuarioCuentasDaos.actualizarLatLong(cuentas4.getIdCuentas(),longitud,latitud);
                usuarioJuegosDaos.guardarCompra(idJuego,cuentas4.getIdCuentas(),precio,cuentas4.getDireccion());

                //todo envio correo
                Cuentas cuenta = usuarioCuentasDaos.correo2("10"); //corre,nombre ,apellido
                String correo = cuenta.getCorreo();
                String nombreCompleto = cuentas4.getNombre() + " " + cuentas4.getApellido();
                String asunto = "Se ha realizado una Compra";
                String contexto = "El usuario " + nombreCompleto + " ha realizado la compra del Juego " + nombreJuego;

                envioCorreos.createEmail(correo,asunto,contexto);
                response.sendRedirect(request.getContextPath() + "/UsuariosJuegosServlet?a=listar");
                session4.setAttribute("msg","Compra Exitosa");
                envioCorreos.sendEmail();

                break;
        }
    }



    public Juegos parseJuegosPosteadosNuevos(HttpServletRequest request)  {

        Juegos juegos = new Juegos();
        String nombre = request.getParameter("nombre");
        String precio = request.getParameter("precio");
        String consola = request.getParameter("consola");
        String genero = request.getParameter("genero");

        String descripcion = request.getParameter("descripcion");



        try {

            juegos.setNombre(nombre);
            juegos.setPrecio(Integer.parseInt(precio));
            juegos.setDescripcion(descripcion);
            juegos.setConsola(consola);
            juegos.setGenero(genero);

            return juegos;

        } catch (NumberFormatException e) {
            return null;
        }
    }



    public VentaUsuario parseVentas(HttpServletRequest request)  {

        VentaUsuario ventaUsuario = new VentaUsuario();
        String idVenta = request.getParameter("idVentas") != null ? request.getParameter("idVentas") : "";
        String precio = request.getParameter("precioVenta");
        String idCuenta = request.getParameter("idCuenta");

        try {

            int id = Integer.parseInt(idVenta);
            ventaUsuario.setIdUsuario(Integer.parseInt(idCuenta));
            ventaUsuario.setIdVenta(id);
            ventaUsuario.setPrecioVenta(Double.parseDouble(precio));


            return ventaUsuario;

        } catch (NumberFormatException e) {

        }
        return ventaUsuario;
    }

    public CompraUsuario parseCompra(HttpServletRequest request)  {

        CompraUsuario compraUsuario = new CompraUsuario();
        String idCompra = request.getParameter("idCompra") != null ? request.getParameter("idCompra") : "";
        String raiting = request.getParameter("raiting");


        try {

            int id = Integer.parseInt(idCompra);

            compraUsuario.setIdCompra(id);
            compraUsuario.setRaiting(Integer.parseInt(raiting));


            return compraUsuario;

        } catch (NumberFormatException e) {

        }
        return compraUsuario;
    }

    public Juegos parseJuegos(HttpServletRequest request)  {

        Juegos juegos = new Juegos();
        String idVenta = request.getParameter("idJuego") != null ? request.getParameter("idJuego") : "";
        String precio = request.getParameter("precioVenta");


        try {

            int id = Integer.parseInt(idVenta);

            juegos.setIdJuegos(id);
            juegos.setPrecio(Double.parseDouble(precio));


            return juegos;

        } catch (NumberFormatException e) {

        }
        return juegos;
    }




}
