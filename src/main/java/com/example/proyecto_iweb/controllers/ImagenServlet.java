package com.example.proyecto_iweb.controllers;

import com.example.proyecto_iweb.models.daos.DaoImagen;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet(name = "ImagenServlet", value = "/Image")
public class ImagenServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        DaoImagen imageDao = new DaoImagen();

        switch (action){
            case "listarFotoJuego":
                int id = Integer.parseInt(request.getParameter("id"));
                byte[] content = null;
                content = imageDao.obtenerimagenes(id);
                if (content.length == 1 && content[0] == 0) {
                    System.out.println("Algo falló al nivel de SQL/DB");
                } else if (content.length == 1 && content[0] == 1) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                } else {
                    response.setContentType("image/gif");
                    response.setContentLength(content.length);
                    response.getOutputStream().write(content);

                }
                break;



            /*
            case "lista_imagen_perfil_sql"->{
                int id_usuario = Integer.parseInt(request.getParameter("id"));
                byte[] content = null;
                content = imageDao.obtenerimagenes_perfil(id_usuario);
                if (content.length == 1 && content[0] == 0) {
                    System.out.println("Algo falló al nivel de SQL/DB");
                } else if (content.length == 1 && content[0] == 1) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                } else {
                    response.setContentType("image/gif");
                    response.setContentLength(content.length);
                    response.getOutputStream().write(content);
                }
            }
            */

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
    }
}
