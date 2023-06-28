package com.example.proyecto_iweb.controllers;

import com.example.proyecto_iweb.models.daos.ManagerCuentasDaos;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ManagerCuentasServlet", value = "/ManagerCuentasServlet")
public class ManagerCuentasServlet extends HttpServlet {

    // bug con el override

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");

        ManagerCuentasDaos usuarioDao = new ManagerCuentasDaos();

        String action = request.getParameter("a") == null ? "ListaUsuarios" : request.getParameter("a");



        switch (action){

            case "perfil":
                String id = request.getParameter("id");
                request.setAttribute("cuentas", usuarioDao.listar(id));
                request.getRequestDispatcher("manager/miPerfilManager.jsp").forward(request, response);
                break;

            case "perfil2":
                String id5 = request.getParameter("id5");
                request.setAttribute("cuentas", usuarioDao.listar(id5));
                request.setAttribute("listarRegistro", usuarioDao.ListarRegistro(id5));
                request.getRequestDispatcher("manager/perfilAdminManager.jsp").forward(request, response);
                break;

            case "ListaUsuarios":
                request.setAttribute("listaUsuarios",usuarioDao.listarUsuariosTabla());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("manager/usuarioManager.jsp");
                requestDispatcher.forward(request,response);
                break;

            case "baneo":
                String id1 = request.getParameter("id1");
                usuarioDao.deshabilitarCuenta(id1);
                request.getSession().setAttribute("info","Usuario Baneado");
                response.sendRedirect(request.getContextPath() + "/ManagerCuentasServlet?a=ListaUsuarios");
                break;

            case "desbaneo":
                String id2 = request.getParameter("id2");
                usuarioDao.habilitarCuenta(id2);
                request.getSession().setAttribute("info2","Usuario Desbaneado");
                response.sendRedirect(request.getContextPath() + "/ManagerCuentasServlet?a=ListaUsuarios");
                break;

            case "ListaEmpleados":
                request.setAttribute("listaEmpleados", usuarioDao.listarEmpleadosTabla());
                RequestDispatcher requestDispatcher1 = request.getRequestDispatcher("manager/adminManager.jsp");
                requestDispatcher1.forward(request,response);
                break;

            case "eliminar":
                String id4 = request.getParameter("id4");
                usuarioDao.deshabilitarCuenta(id4);
                request.getSession().setAttribute("info3","Trabajador Despedido");
                response.sendRedirect(request.getContextPath() + "/ManagerCuentasServlet?a=ListaEmpleados");
                break;





        }
    }

}
