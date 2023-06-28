package com.example.proyecto_iweb.models.daos;

import com.example.proyecto_iweb.models.beans.Cuentas;
import com.example.proyecto_iweb.models.dtos.EmpleadosTabla;
import com.example.proyecto_iweb.models.dtos.UsuarioTabla;

import java.sql.*;
import java.util.ArrayList;

public class ManagerCuentasDaos extends DaoBase{

    /* ------------------------------- DTOS ----------------------- */

    /* --------- dto:empeladostabla -------*/
    public ArrayList<EmpleadosTabla> listarEmpleadosTabla(){
        ArrayList<EmpleadosTabla> lista = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "SELECT\n" +
                "  c.idCuenta,\n" +
                "  CONCAT(c.nombre, \" \", c.apellido) AS \"Nombres\",\n" +
                "  SUM(co.cantidad) AS \"Juegos vendidos\",\n" +
                "  COUNT(DISTINCT v.idVenta) AS \"Juegos comprados\",\n" +
                "  SUM(co.precioCompra) AS \"Dinero ganado\",\n" +
                "  SUM(v.precioVenta) AS \"Dinero Gastado\",\n" +
                "  c.foto\n" +
                "FROM\n" +
                "  cuenta c\n" +
                "LEFT JOIN ventausuario v ON c.idCuenta = v.idAdmin AND v.idEstados = \"2\"\n" +
                "LEFT JOIN comprausuario co ON c.idCuenta = co.idAdmin AND co.idEstados = \"2\"\n" +
                "WHERE\n" +
                "  c.idRol = \"2\" and c.desabilitado = \"0\"\n" +
                "GROUP BY\n" +
                "  c.idCuenta,\n" +
                "  c.nombre,\n" +
                "  c.apellido,\n" +
                "  c.foto\n" +
                "ORDER BY\n" +
                " SUM(co.precioCompra)- SUM(v.precioVenta) desc";


        String url = "jdbc:mysql://localhost:3306/mydb";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql);) {

            while(resultSet.next() ){
                EmpleadosTabla empleadosTabla = new EmpleadosTabla();
                empleadosTabla.setIdCuenta(resultSet.getInt(1));
                empleadosTabla.setNombre(resultSet.getString(2));
                empleadosTabla.setJuegosVendidos(resultSet.getInt(3));
                empleadosTabla.setJuegosComprados(resultSet.getInt(4));
                empleadosTabla.setDineroGanado(resultSet.getDouble(5));
                empleadosTabla.setDineroGastado(resultSet.getDouble(6));
                empleadosTabla.setFoto(resultSet.getString(7));

                lista.add(empleadosTabla);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }

    /* --------- dto:usuariotabla --------*/
    public ArrayList<UsuarioTabla> listarUsuariosTabla(){
        ArrayList<UsuarioTabla> lista = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "SELECT\n" +
                "  c.idCuenta,\n" +
                "  CONCAT(c.nombre, \" \", c.apellido) AS \"Nombres\",\n" +
                "  SUM(co.cantidad) AS \"Juegos Comprados\",\n" +
                "  COUNT(DISTINCT v.idVenta) AS \"Juegos Vendidos\",\n" +
                "  SUM(co.precioCompra) AS \"Dinero Gastado\",\n" +
                "  SUM(v.precioVenta) AS \"Dinero Ganado\"\n" +
                "FROM\n" +
                "  cuenta c\n" +
                "LEFT JOIN ventausuario v ON c.idCuenta = v.idUsuario AND v.idEstados = \"2\"\n" +
                "LEFT JOIN comprausuario co ON c.idCuenta = co.idUsuario AND co.idEstados = \"2\"\n" +
                "WHERE\n" +
                "  c.idRol = \"3\" and c.desabilitado = \"0\"\n" +
                "GROUP BY\n" +
                "  c.idCuenta,\n" +
                "  c.nombre,\n" +
                "  c.apellido\n" +
                "ORDER BY\n" +
                "SUM(co.cantidad) desc";

        String url = "jdbc:mysql://localhost:3306/mydb";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while(resultSet.next()){
                UsuarioTabla usuarioTabla = new UsuarioTabla();
                usuarioTabla.setIdCuenta(resultSet.getInt(1));
                usuarioTabla.setNombre(resultSet.getString(2));
                usuarioTabla.setJuegosComprados(resultSet.getInt(3));
                usuarioTabla.setJuegosVendidos(resultSet.getInt(4));
                usuarioTabla.setDineroGastado(resultSet.getDouble(5));
                usuarioTabla.setDineroGanado(resultSet.getDouble(6));

                lista.add(usuarioTabla);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }
    /* ----------------------------------------------------------- */

    public UsuarioTabla ListarRegistro(String id){
        UsuarioTabla usuarioTabla = null ;

        String sql = "SELECT\n" +
                "  c.idCuenta,\n" +
                "  CONCAT(c.nombre, \" \", c.apellido) AS \"Nombres\",\n" +
                "  SUM(co.cantidad) AS \"Juegos vendidos\",\n" +
                "  COUNT(DISTINCT v.idVenta) AS \"Juegos comprados\",\n" +
                "  SUM(co.precioCompra) AS \"Dinero ganado\",\n" +
                "  SUM(v.precioVenta) AS \"Dinero Gastado\",\n" +
                "  c.foto\n" +
                "FROM\n" +
                "  cuenta c\n" +
                "LEFT JOIN ventausuario v ON c.idCuenta = v.idAdmin AND v.idEstados = \"2\"\n" +
                "LEFT JOIN comprausuario co ON c.idCuenta = co.idAdmin AND co.idEstados = \"2\"\n" +
                "WHERE\n" +
                "  c.idCuenta = ?\n" +
                "GROUP BY\n" +
                "  c.idCuenta,\n" +
                "  c.nombre,\n" +
                "  c.apellido,\n" +
                "  c.foto";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    usuarioTabla = new UsuarioTabla();
                    usuarioTabla.setIdCuenta(rs.getInt(1));
                    usuarioTabla.setNombre(rs.getString(2));
                    usuarioTabla.setJuegosVendidos(rs.getInt(3));
                    usuarioTabla.setJuegosComprados(rs.getInt(4));
                    usuarioTabla.setDineroGanado(rs.getDouble(5));
                    usuarioTabla.setDineroGastado(rs.getDouble(6));
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return usuarioTabla;
    }


    /* ------------ botones de banear/despedir ------- */

    public void deshabilitarCuenta(String id) {

        String sql = "UPDATE cuenta SET desabilitado = 1 WHERE idCuenta = ?";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, id);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void habilitarCuenta(String id) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String url = "jdbc:mysql://localhost:3306/mydb";
        String sql = "UPDATE cuenta SET desabilitado = 0 WHERE idCuenta = ?";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, id);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /*------------------------------------------------*/

    /* ---------------- Perfil -----------------------*/
    public Cuentas listar(String id) {
        Cuentas cuentas = null;


        String sql = "select * from cuenta where idCuenta = ?";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    cuentas = new Cuentas();
                    cuentas.setIdCuentas(rs.getInt(1));
                    cuentas.setNombre(rs.getString(2));
                    cuentas.setApellido(rs.getString(3));
                    cuentas.setNickname(rs.getString(4));
                    cuentas.setDireccion(rs.getString(5));
                    cuentas.setCorreo(rs.getString(6));
                    cuentas.setFoto(rs.getString(7));
                    cuentas.setDescripcion(rs.getString(8));
                    cuentas.setPasswordHashed(rs.getString(11));

                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return cuentas;
    }


}
