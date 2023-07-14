package com.example.proyecto_iweb.controllers;

import com.example.proyecto_iweb.models.daos.UsuarioJuegosDaos;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "InitialServlet",  urlPatterns = {"","/InitialServlet"})
public class InitialServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("a") == null ? "list" : request.getParameter("a");
        UsuarioJuegosDaos usuarioJuegosDaos = new UsuarioJuegosDaos();
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
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("p") == null ? "crear" : request.getParameter("p");

        UsuarioJuegosDaos usuarioJuegosDaos = new UsuarioJuegosDaos();
        switch (action) {
            case "b1":
                String textoBuscar1 = request.getParameter("buscador");
                request.setAttribute("lista", usuarioJuegosDaos.buscarPorTitle(textoBuscar1));
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
        }
    }
}
