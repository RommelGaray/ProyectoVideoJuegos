package com.example.proyecto_iweb.models.daos;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;

public class DaoImagen extends DaoBase {
    private static String sql_imagenes = "select fotoJuego from juego where idJuego=?";

    public byte[] obtenerImagenes(int id) {
        byte[] content = null;
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql_imagenes)) {

            pstmt.setInt(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    content = rs.getBytes("fotoJuego");
                } else{
                    content = new byte[]{(byte) 1};
                }
                return content;
            }

        } catch (SQLException error) {
            error.printStackTrace();
        }
        return content;
    }





    /*
    public byte[] obtenerimagenes_perfil(int id) {
        byte[] content = null;
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql_imagenes_perfil);
        ) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery();) {
                if (rs.next()) {
                    content = rs.getBytes("fotoPerfil");
                } else{
                    content = new byte[]{(byte) 1};
                }
                return content;
            }
        } catch (SQLException error) {
            error.printStackTrace();
        }
        return content;
    }
*/

}
