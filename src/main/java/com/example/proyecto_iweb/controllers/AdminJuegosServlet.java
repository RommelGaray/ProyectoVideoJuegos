package com.example.proyecto_iweb.controllers;

import com.example.proyecto_iweb.models.beans.Juegos;
import com.example.proyecto_iweb.models.daos.AdminCuentasDaos;
import com.example.proyecto_iweb.models.daos.AdminJuegosDaos;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;

@WebServlet(name = "AdminJuegosServlet", value = "/AdminJuegosServlet")
@MultipartConfig
public class AdminJuegosServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        AdminJuegosDaos adminJuegosDaos = new AdminJuegosDaos();
        AdminCuentasDaos adminCuentasDaos = new AdminCuentasDaos();

        String action = request.getParameter("a") == null ? "listarJuegosDisponibles" : request.getParameter("a");

        switch (action) {
            case "listarJuegosDisponibles":
                request.setAttribute("lista", adminJuegosDaos.listarJuegosDisponibles());
                request.getRequestDispatcher("admin/indexAdmin.jsp").forward(request, response);
                break;

            case "crearJuego":
                request.setAttribute("consolas", adminJuegosDaos.consolas());
                request.setAttribute("generos", adminJuegosDaos.generos());
                request.getRequestDispatcher("admin/crearJuego.jsp").forward(request, response);
                break;

            case "editarJuego":
                String id = request.getParameter("id");
                request.setAttribute("juego", adminJuegosDaos.obtenerJuego(id));
                request.setAttribute("consolas", adminJuegosDaos.consolas());
                request.setAttribute("generos", adminJuegosDaos.generos());
                request.getRequestDispatcher("admin/editarJuego.jsp").forward(request, response);
                break;

            case "deshabilitarJuego":
                String id1 = request.getParameter("id");
                adminJuegosDaos.desabilitarJuego(id1);
                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet");
                break;

            case "reservas":
                request.setAttribute("lista",adminJuegosDaos.compradosAndReservados());
                request.getRequestDispatcher("admin/reservasYcomprados.jsp").forward(request, response);
                break;

            case "propuestos":
                request.setAttribute("lista",adminJuegosDaos.juegosPropuestos());
                request.getRequestDispatcher("admin/propuestos.jsp").forward(request, response);
                break;

            case "ofertas":
                request.setAttribute("ofertas",adminJuegosDaos.listarOfertas());
                request.getRequestDispatcher("admin/ofertasJuegos.jsp").forward(request,response);
                break;

            case "verJuego":
                String id2 = request.getParameter("id");
                request.setAttribute("juego", adminJuegosDaos.listarJuegoAdmin(id2));
                request.getRequestDispatcher("admin/verJuego.jsp").forward(request, response);
                break;

            case "eliminarOferta":
                String id3 = request.getParameter("id");
                adminJuegosDaos.eliminarOferta(id3);
                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=ofertas");
                break;

            case "ofertarJuego":
                String id4 = request.getParameter("id");
                request.setAttribute("juego", adminJuegosDaos.obtenerJuego(id4));
                request.setAttribute("consolas", adminJuegosDaos.consolas());
                request.setAttribute("generos", adminJuegosDaos.generos());
                request.getRequestDispatcher("admin/ofertarJuego.jsp").forward(request, response);
                break;

            case "detallesCompra":
                String id100 = request.getParameter("id");
                request.setAttribute("compra", adminJuegosDaos.comprados(Integer.parseInt(id100)));
                request.getRequestDispatcher("admin/detallesCompras2.jsp").forward(request, response);
                break;

            case "perfilUsuarios":
                String id101 = request.getParameter("id");
                request.getRequestDispatcher("admin/perfilUsuarios.jsp").forward(request, response);
                break;

            case "aceptarUsuario":
                String id9 = request.getParameter("id");
                adminJuegosDaos.aceptarUsuario(id9);
                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=propuestos");
                break;

            case "rechazarUsuario":
                String id10 = request.getParameter("id");
                adminJuegosDaos.rechazarUsuario(id10);
                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=propuestos");
                break;



            /** OSCAR COLOCAS AQU� TU C�DIGO O LAS OPCIONES DE SERVLET QUE QUIERAS A�ADIR **/
            case "listarcola":
                request.setAttribute("lista", adminJuegosDaos.listarCola());
                RequestDispatcher requestDispatcher2 = request.getRequestDispatcher("admin/juegosColaAdminOficial.jsp");
                requestDispatcher2.forward(request, response);
                break;

            case "nuevos":
                request.setAttribute("nuevos", adminJuegosDaos.listarnuevos());
                request.getRequestDispatcher("admin/juegosNuevosAdminOficial.jsp").forward(request, response);
                break;

            case "existentes":
                request.setAttribute("existentes", adminJuegosDaos.listarexistentes());
                request.getRequestDispatcher("admin/juegosExistentesAdminOficial.jsp").forward(request, response);
                break;

            case "cambiarestadoaceptar":
                String id5 = request.getParameter("idventa");
                adminJuegosDaos.cambiarestadoaceptar(id5);
                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=listarcola");
                break;

            case "cambiarestadonoaceptar":
                String id6 = request.getParameter("idventa");
                adminJuegosDaos.cambiarestadonoaceptar(id6);
                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=listarcola");
                break;

            case "cambiarestadorechazar":
                String id7 = request.getParameter("idventa");
                adminJuegosDaos.cambiarestadorechazar(id7);
                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=listarcola");
                break;

        }


    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        String action = request.getParameter("p") == null ? "crear" : request.getParameter("p");

        AdminJuegosDaos adminJuegosDaos = new AdminJuegosDaos();

        switch (action) {
            case "crear":
                InputStream inputStream;
                String nombre = request.getParameter("nombre");
                String descripcion = request.getParameter("descripcion");
                double precio = Double.parseDouble(request.getParameter("precio"));
                int stock = Integer.parseInt(request.getParameter("stock"));
                String consola = request.getParameter("consola");
                String genero = request.getParameter("genero");
                Part filePart = request.getPart("foto");

                inputStream = filePart.getInputStream();
                if (filePart != null) {
                    System.out.println(filePart.getContentType());
                    inputStream = filePart.getInputStream();
                }

                //byte[] foto = request.getParameter("foto").getBytes();
                adminJuegosDaos.crearJuego(nombre, descripcion, precio, stock, consola, genero, inputStream);

                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet");
                break;

            case "actualizar":
                InputStream inputStreamAct;
                int idJuego = Integer.parseInt(request.getParameter("idJuego"));
                String nombreAct = request.getParameter("nombre");
                String descripcionAct = request.getParameter("descripcion");
                double precioAct = Double.parseDouble(request.getParameter("precio"));
                double descuentoAct = Double.parseDouble(request.getParameter("descuento"));
                String consolaAct = request.getParameter("consola");
                String generoAct = request.getParameter("genero");
                int stockAct = Integer.parseInt(request.getParameter("stock"));
                Part filePartAct = request.getPart("foto");

                inputStreamAct = filePartAct.getInputStream();
                if (filePartAct != null) {
                    System.out.println(filePartAct.getContentType());
                    inputStreamAct = filePartAct.getInputStream();
                }


                adminJuegosDaos.actualizarJuego(idJuego, nombreAct, descripcionAct, precioAct, descuentoAct, consolaAct, generoAct, stockAct, inputStreamAct);
                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet");
                break;

            case "ofertar":
                int idJuego1 = Integer.parseInt(request.getParameter("idJuego"));
                double descuento = Double.parseDouble(request.getParameter("descuento"));
                adminJuegosDaos.ofertarJuego(idJuego1, descuento);
                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet");
                break;

            case "dejarMensaje":
                String mensajeAdmin = request.getParameter("mensajeAdmin");
                String idVenta = request.getParameter("idVenta");

                adminJuegosDaos.dejarMensaje(mensajeAdmin, idVenta);
                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet");
                break;
        }
    }
}
