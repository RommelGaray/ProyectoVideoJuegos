package com.example.proyecto_iweb.models.daos;

import com.example.proyecto_iweb.models.beans.Juegos;

import java.sql.*;
import java.util.ArrayList;

public class ManagerJuegosDaos extends DaoBase{

    /* ------------------------------ listar Juegos---------------------------*/
    public ArrayList<Juegos> listarJuegos(){
        ArrayList<Juegos> lista = new ArrayList<>();
        String sql = "select * from juego where habilitado = 1";
        String url = "jdbc:mysql://localhost:3306/mydb";

        try (Connection connection = this.getConection();
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while(resultSet.next()){
                Juegos juegoDisponible = new Juegos();

                juegoDisponible.setIdJuegos(resultSet.getInt(1));
                juegoDisponible.setNombre(resultSet.getString(2));
                juegoDisponible.setDescripcion(resultSet.getString(3));
                juegoDisponible.setPrecio(resultSet.getFloat(4));
                juegoDisponible.setDescuento(resultSet.getInt(5));
                juegoDisponible.setFoto(resultSet.getString(6));
                juegoDisponible.setStock(resultSet.getInt("stock"));
                lista.add(juegoDisponible);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }
    /* ------------------------------- barra buscadora -----------------------*/
    public ArrayList<Juegos> buscarPorTitle(String title) {
        ArrayList<Juegos> lista = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "select * from juego where nombre like ?";
        String url = "jdbc:mysql://localhost:3306/mydb";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, "%" + title + "%");

            try (ResultSet rs = preparedStatement.executeQuery()) {

                while (rs.next()) {
                    Juegos juegos = new Juegos();
                    juegos.setIdJuegos(rs.getInt(1));
                    juegos.setNombre(rs.getString(2));
                    juegos.setDescripcion(rs.getString(3));
                    juegos.setPrecio(rs.getDouble(4));
                    juegos.setDescuento(rs.getDouble(5));
                    juegos.setStock(rs.getInt(11));
                    juegos.setFoto(rs.getString(6));
                    juegos.setExistente(rs.getBoolean(7));
                    juegos.setHabilitado(rs.getBoolean(8));
                    juegos.setConsola(rs.getString(9));
                    juegos.setConsola(rs.getString(10));
                    lista.add(juegos);
                }
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }

    /*--------------------------------- borrar juego -------------------------*/

    public void desabilitarJuego(String id) {

        String sql = "UPDATE juego SET habilitado = 0 WHERE idJuego = ?";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, id);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /*------------------------------ top5 -----------------------------*/
    public ArrayList<Juegos> listarJuegosTop5(){
        ArrayList<Juegos> lista = new ArrayList<>();
        String sql = "SELECT j.idJuego, j.nombre, j.descripcion, j.precio, j.descuento, j.foto, j.existente, j.habilitado, j.consola, j.genero, j.stock\n" +
                "FROM juego j\n" +
                "INNER JOIN comprausuario co ON j.idJuego = co.idJuego\n" +
                "WHERE j.habilitado = '1'\n" +
                "GROUP BY j.idJuego, j.nombre, j.descripcion, j.precio, j.descuento, j.foto, j.existente, j.habilitado, j.consola, j.genero, j.stock\n" +
                "ORDER BY (\n" +
                "  SELECT MAX(co.cantidad)\n" +
                "  FROM comprausuario co\n" +
                "  WHERE co.idJuego = j.idJuego\n" +
                ") DESC\n" +
                "LIMIT 5";
        try (Connection connection = this.getConection();
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while(resultSet.next()){
                Juegos juegoDisponible = new Juegos();

                juegoDisponible.setIdJuegos(resultSet.getInt(1));
                juegoDisponible.setNombre(resultSet.getString(2));
                juegoDisponible.setDescripcion(resultSet.getString(3));
                juegoDisponible.setPrecio(resultSet.getFloat(4));
                juegoDisponible.setDescuento(resultSet.getInt(5));
                juegoDisponible.setFoto(resultSet.getString(6));
                juegoDisponible.setStock(resultSet.getInt("stock"));
                lista.add(juegoDisponible);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }
    /*--------------------------------menos Vendidos ------------------*/
    public ArrayList<Juegos> listarJuegosMenosVendidos(){
        ArrayList<Juegos> lista = new ArrayList<>();
        String sql = "SELECT j.idJuego, j.nombre, j.descripcion, j.precio, j.descuento, j.foto, j.existente, j.habilitado, j.consola, j.genero, j.stock\n" +
                "FROM juego j\n" +
                "left JOIN comprausuario co ON j.idJuego = co.idJuego\n" +
                "WHERE j.habilitado = '1'\n" +
                "GROUP BY j.idJuego, j.nombre, j.descripcion, j.precio, j.descuento, j.foto, j.existente, j.habilitado, j.consola, j.genero, j.stock\n" +
                "ORDER BY (\n" +
                "  SELECT MAX(co.cantidad)\n" +
                "  FROM comprausuario co\n" +
                "  WHERE co.idJuego = j.idJuego\n" +
                ")\n" +
                "LIMIT 5";
        try (Connection connection = this.getConection();
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while(resultSet.next()){
                Juegos juegoDisponible = new Juegos();

                juegoDisponible.setIdJuegos(resultSet.getInt(1));
                juegoDisponible.setNombre(resultSet.getString(2));
                juegoDisponible.setDescripcion(resultSet.getString(3));
                juegoDisponible.setPrecio(resultSet.getFloat(4));
                juegoDisponible.setDescuento(resultSet.getInt(5));
                juegoDisponible.setFoto(resultSet.getString(6));
                juegoDisponible.setStock(resultSet.getInt("stock"));
                lista.add(juegoDisponible);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }

}
