package com.example.proyecto_iweb.controllers;

import com.example.proyecto_iweb.models.beans.Cuentas;
import com.example.proyecto_iweb.models.daos.UsuarioCuentasDaos;
import com.example.proyecto_iweb.models.daos.UsuarioJuegosDaos;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "InitialServlet",  urlPatterns = {"","/InitialServlet"})
public class InitialServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null ? "list" : request.getParameter("action");
        UsuarioJuegosDaos usuarioJuegosDaos = new UsuarioJuegosDaos();
        RequestDispatcher view;

        switch (action) {
            case "list":
                request.setAttribute("lista", usuarioJuegosDaos.listarJuegos());
                //request.setAttribute("perfil", cuentasDaos.perfil());
                // request.setAttribute("lista4",usuarioJuegosDaos.listarNotificaciones());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "verjuego":
                int juegoId = Integer.parseInt(request.getParameter("id"));
                request.setAttribute("juegos", usuarioJuegosDaos.listar(juegoId));
                request.getRequestDispatcher("usuario/verJuego.jsp").forward(request, response);
                break;
            case "agregar":
                view = request.getRequestDispatcher("/nuevoUsuario.jsp");
                view.forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("p") == null ? "crear" : request.getParameter("p");

        UsuarioJuegosDaos usuarioJuegosDaos = new UsuarioJuegosDaos();
        UsuarioCuentasDaos usuarioCuentasDaos = new UsuarioCuentasDaos();

        switch (action) {
            case "b1":
                String textoBuscar1 = request.getParameter("buscador");
                request.setAttribute("lista", usuarioJuegosDaos.buscarPorTitle(textoBuscar1));
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            case"guardar":

                Cuentas cuentas1= new Cuentas();
                cuentas1.setNombre(request.getParameter("nombre"));
                cuentas1.setApellido(request.getParameter("apellido"));
                cuentas1.setNickname(request.getParameter("nickname"));
                cuentas1.setDireccion(request.getParameter("direccion"));
                cuentas1.setCorreo(request.getParameter("correo"));
                cuentas1.setPasswordHashed(request.getParameter("password"));

                try {


                    usuarioCuentasDaos.guardarUsuario(cuentas1);
                    response.sendRedirect("/Proyecto_IWEB_war_exploded/");

                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
        }
    }
}
