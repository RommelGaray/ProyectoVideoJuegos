package com.example.proyecto_iweb.controllers;

import com.example.proyecto_iweb.models.beans.Cuentas;
import com.example.proyecto_iweb.models.daos.AdminCuentasDaos;
import com.example.proyecto_iweb.models.daos.AdminJuegosDaos;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "AdminCuentasServlet", urlPatterns = {"/AdminCuentasServlet"})
public class AdminCuentasServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        AdminCuentasDaos adminCuentasDaos = new AdminCuentasDaos();
        AdminJuegosDaos adminJuegosDaos = new AdminJuegosDaos();

        HttpSession session = request.getSession();
        Cuentas cuentas = (Cuentas) session.getAttribute("usuarioLog");
        RequestDispatcher view;

        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");

        switch (action){

            case "actualizarFoto1":
                adminCuentasDaos.actualizarFoto1(cuentas.getIdCuentas());
                session.setAttribute("msg","Foto actualizada, vuelve a iniciar sesión para ver el a cambio");
                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=perfilAdmin" );
                break;

            case "actualizarFoto2":
                adminCuentasDaos.actualizarFoto2(cuentas.getIdCuentas());
                session.setAttribute("msg","Foto actualizada, vuelve a iniciar sesión para ver el cambio");
                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=perfilAdmin" );
                break;

            case "actualizarFoto3":
                adminCuentasDaos.actualizarFoto3(cuentas.getIdCuentas());
                session.setAttribute("msg","Foto actualizada, vuelve a iniciar sesión para ver el cambio");
                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=perfilAdmin" );
                break;

            case "actualizarFoto4":
                adminCuentasDaos.actualizarFoto4(cuentas.getIdCuentas());
                session.setAttribute("msg","Foto actualizada, vuelve a iniciar sesión para ver el cambio");
                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=perfilAdmin" );
                break;


        }

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        String action = request.getParameter("p") == null ? "crear" : request.getParameter("p");

        AdminJuegosDaos adminJuegosDaos = new AdminJuegosDaos();
        AdminCuentasDaos adminCuentasDaos = new AdminCuentasDaos();

        switch (action){

            // ACTUALIZAR LOS DATOS DEL PERFIL DEL ADMIN
            case "actualizarPerfil":

                int idCuentas = Integer.parseInt(request.getParameter("idCuentas"));
                String descripcionPerfil = request.getParameter("descripcion");
                String direccionPerfil = request.getParameter("direccion");

                adminCuentasDaos.actualizarPerfil(idCuentas, descripcionPerfil, direccionPerfil);
                HttpSession session1 = request.getSession();
                Cuentas cuentas2 = (Cuentas) session1.getAttribute("usuarioLog");
                response.sendRedirect(request.getContextPath() + "/AdminJuegosServlet?a=perfilAdmin&id="+ cuentas2.getIdCuentas());
                break;


        }

    }
}
