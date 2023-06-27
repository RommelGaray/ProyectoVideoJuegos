package com.example.proyecto_iweb.models.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DaoImagen extends DaoBase {
    private static String sql_imagenes = "select fotoJuego from juego where idJuego=?";
    private static String sql_imagenes_perfil = "select fotoPerfil from mydb2.usuarios where idUsuario=?";

    public byte[] obtenerimagenes(int id) {
        byte[] content = null;
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql_imagenes);
        ) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery();) {
                if (rs.next()) {
                    content = rs.getBytes("foto");
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
