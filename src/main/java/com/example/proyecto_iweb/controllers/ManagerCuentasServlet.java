package com.example.proyecto_iweb.controllers;

import com.example.proyecto_iweb.models.daos.EnvioCorreos;
import com.example.proyecto_iweb.models.beans.Cuentas;
import com.example.proyecto_iweb.models.daos.ManagerCuentasDaos;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "ManagerCuentasServlet", value = "/ManagerCuentasServlet")
public class ManagerCuentasServlet extends HttpServlet {

    // bug con el override

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");

        ManagerCuentasDaos usuarioDao = new ManagerCuentasDaos();
        EnvioCorreos envioCorreos = new EnvioCorreos();

        HttpSession session = request.getSession();
        Cuentas cuentaslog = (Cuentas) session.getAttribute("usuarioLog");
        RequestDispatcher view;

        String action = request.getParameter("a") == null ? "ListaUsuarios" : request.getParameter("a");



        switch (action){

            case "perfil":
                request.setAttribute("cuentas", usuarioDao.listar(cuentaslog.getIdCuentas()));
                request.getRequestDispatcher("manager/miPerfilManager.jsp").forward(request, response);
                break;

            case "perfil2":
                String id5 = request.getParameter("id5");
                request.setAttribute("cuentas", usuarioDao.listar(Integer.parseInt(id5)));
                request.setAttribute("listarRegistro", usuarioDao.ListarRegistro(id5));
                request.setAttribute("historial",usuarioDao.tablaHistorial(id5));
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
                // envio de correo
                Cuentas cuentas = usuarioDao.correo(id1);
                String asunto = "Has sido Baneado";
                String contenido = "Hola," + cuentas.getNombre() + " " + cuentas.getApellido() + ", has sido Baneado de Javagos.com, Puedes pedir mayor informacion escribiendo a uno de nustros administradores";
                String correo = cuentas.getCorreo();
                envioCorreos.createEmail(correo,asunto,contenido);
                response.sendRedirect(request.getContextPath() + "/ManagerCuentasServlet?a=ListaUsuarios");
                envioCorreos.sendEmail();
                break;

            case "desbaneo":
                String id2 = request.getParameter("id2");
                usuarioDao.habilitarCuenta(id2);
                request.getSession().setAttribute("info2","Usuario Desbaneado");
                // envio de correo
                cuentas = usuarioDao.correo(id2);
                asunto = "Has sido Desbaneado";
                contenido = "Hola," + cuentas.getNombre() + " " + cuentas.getApellido() + ", has sido Desbaneado de Javagos.com, Felicidades podras seguir gastando tu dinero en nuestra pagina";
                correo = cuentas.getCorreo();
                envioCorreos.createEmail(correo,asunto,contenido);
                response.sendRedirect(request.getContextPath() + "/ManagerCuentasServlet?a=ListaUsuarios");
                envioCorreos.sendEmail();
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
                // envio de correo
                cuentas = usuarioDao.correo(id4);
                asunto = "Has sido Despedido";
                contenido = "Hola," + cuentas.getNombre() + " " + cuentas.getApellido() + ", has sido despedido de Javagos.com, pero no te preocupes te daremos una carta de recomendacion para tu futuro trabajo. que tengas buen dia ";
                correo = cuentas.getCorreo();
                envioCorreos.createEmail(correo,asunto,contenido);
                response.sendRedirect(request.getContextPath() + "/ManagerCuentasServlet?a=ListaEmpleados");
                envioCorreos.sendEmail();
                break;





        }
    }

}
