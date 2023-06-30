package com.example.proyecto_iweb.controllers;

import com.example.proyecto_iweb.models.daos.DaoImagen;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import org.apache.commons.io.IOUtils;


import java.io.*;


@WebServlet(name = "ImagenServlet", value = "/imagenServlet")
public class ImagenServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listarFotoJuego" : request.getParameter("action");
        DaoImagen imageDao = new DaoImagen();

        switch (action){

            case "listarFotoJuego":
                int id = Integer.parseInt(request.getParameter("id"));
                byte[] content = null;
                content = imageDao.obtenerImagenes(id);
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
            case "listarFotoJuego"->{
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

            /*
            case "listarFotoJuego":
                response.setContentType("image/jpeg");
                response.setContentType("image/png");
                int id = Integer.parseInt(request.getParameter("id"));
                System.out.println(id);
                try{
                    System.out.println("En el try uwu");
                    byte [] data = imageDao.obtenerImagenes(id);
                    System.out.println(" Se debio obtener la imagen");
                    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                    outputStream.write(data,0, data.length);
                    response.setContentLength(outputStream.size());
                    try(OutputStream out = response.getOutputStream()){
                        outputStream.writeTo(out);
                        System.out.println("Listo para salir la imagen");
                        out.flush();

                    }
                }
                catch(IOException e){
                    System.out.println("Error :'v");

                }


                //IOUtils.copy(is,response.getOutputStream());

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
