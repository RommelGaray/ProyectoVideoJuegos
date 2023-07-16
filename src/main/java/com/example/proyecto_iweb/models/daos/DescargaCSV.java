package com.example.proyecto_iweb.models.daos;

import com.example.proyecto_iweb.models.dtos.UsuarioTabla;
import com.opencsv.CSVWriter;

import java.io.FileWriter;
import java.io.IOException;

public class DescargaCSV {
    public static void exportarListaCSV(UsuarioTabla usuario) {

        // Obtener la ruta del directorio del proyecto en el servidor
        String archivoCSV = "C:\\Users\\user\\Desktop\\proyecto_ingweb\\ProyectoVideoJuegos\\Descargas\\" + usuario.getNombre()+".csv";

        try (CSVWriter writer = new CSVWriter(new FileWriter(archivoCSV))) {

            String[] encabezados = {"Nombre Completo", "Juegos Comprados", "Juegos Vendidos", "Dinero Ganado", "Dinero Gastado"};
            writer.writeNext(encabezados);

            String[] fila = {usuario.getNombre(), String.valueOf(usuario.getJuegosComprados()), String.valueOf(usuario.getJuegosVendidos()), String.valueOf((int) usuario.getDineroGanado()), String.valueOf((int) usuario.getDineroGastado())};
            writer.writeNext(fila);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
