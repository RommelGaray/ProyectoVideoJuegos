package com.example.proyecto_iweb.models.daos;

import com.example.proyecto_iweb.models.beans.Cuentas;
import com.example.proyecto_iweb.models.beans.Roles;

import java.sql.*;
import java.util.ArrayList;

public class UsuarioCuentasDaos extends DaoBase{
    /*-------------------USUARIOS----------------------------*/

    public Cuentas listar(int id) {
        Cuentas cuentas = null;


        String sql = "select * from cuenta where idCuenta = ?";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);

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

    public void actualizar(Cuentas cuentas) {

        String sql = "UPDATE cuenta SET descripcion = ?,direccion = ?,correo = ? WHERE idCuenta = ?";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, cuentas.getDescripcion());
            pstmt.setString(2, cuentas.getDireccion());
            pstmt.setString(3,cuentas.getCorreo());
            //pstmt.setString(4,cuentas.getPasswordHashed());
            pstmt.setInt(4, cuentas.getIdCuentas());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Cuentas validateUsernameAndPassword(String correo, String password) {

        Cuentas cuentas = null;

        String sql = "SELECT * FROM cuenta \n" +
                "where correo = ? and passwordHashed = sha2(?,256);";

        try (Connection connection = getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, correo);
            pstmt.setString(2, password);

            try (ResultSet rs = pstmt.executeQuery()) {

                if (rs.next()) {
                    cuentas = obtenerCuentas(rs.getInt(1));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return cuentas;
    }

    public Cuentas obtenerCuentas(int idCuenta) {

        Cuentas cuentas = null;

        String sql = "select * from cuenta c\n" +
                "inner join rol r on c.idRol = r.idRol\n" +
                "where c.idCuenta = ?;";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idCuenta);

            try (ResultSet rs = pstmt.executeQuery()) {

                if (rs.next()) {
                    cuentas = new Cuentas();
                    fetchUsuarioData(cuentas, rs);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return cuentas;
    }

    private void fetchUsuarioData(Cuentas cuentas, ResultSet rs) throws SQLException {

        cuentas.setIdCuentas(rs.getInt(1));
        cuentas.setNombre(rs.getString(2));
        cuentas.setApellido(rs.getString(3));
        cuentas.setNickname(rs.getString(4));
        cuentas.setDireccion(rs.getString(5));
        cuentas.setCorreo(rs.getString(6));
        cuentas.setFoto(rs.getString(7));
        cuentas.setDescripcion(rs.getString(8));
        cuentas.setDesabilitado(rs.getBoolean(9));
        cuentas.setIdRol(rs.getInt(10));
        cuentas.setPasswordHashed(rs.getString(11));

        Roles roles = new Roles();
        roles.setIdRol(rs.getInt(12));
        roles.setRol(rs.getString(13));
        cuentas.setRoles(roles);

    }

    public void guardarUsuario (Cuentas cuentas) throws SQLException{

        String sql = "insert INTO cuenta (nombre,apellido,nickname,direccion,correo,desabilitado,idRol,passwordHashed)\n" +
                "values (?,?,?,?,?,0,3,SHA2(?, 256));";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            setUsuarioParams(pstmt, cuentas);
            pstmt.executeUpdate();
        }

    }

    private void setUsuarioParams (PreparedStatement pstmt, Cuentas cuentas) throws SQLException{

        pstmt.setString(1,cuentas.getNombre());
        pstmt.setString(2,cuentas.getApellido());
        pstmt.setString(3,cuentas.getNickname());
        pstmt.setString(4,cuentas.getDireccion());
        pstmt.setString(5,cuentas.getCorreo());
        pstmt.setString(6,cuentas.getPasswordHashed());
        //pstmt.setInt(7,usuarios.getIdEstatus());

    }

    public void actualizarFoto1(int idUsuario) {



        String sql = "update cuenta set foto = 'img/usuario/pokemon1.png' where idCuenta = ?;";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, idUsuario);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void actualizarFoto2(int idUsuario) {

        String sql = "update cuenta set foto = 'img/usuario/pokemon2.png' where idCuenta = ?;";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, idUsuario);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void actualizarFoto3(int idUsuario) {

        String sql = "update cuenta set foto = 'img/usuario/pokemon3.png' where idCuenta = ?;";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, idUsuario);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void actualizarFoto4(int idUsuario) {

        String sql = "update cuenta set foto = 'img/usuario/pokemon4.png' where idCuenta = ?;";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, idUsuario);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /*public ArrayList<Cuentas> perfil(int idCuenta){

        ArrayList<Cuentas> lista = new ArrayList<>();


        String sql = "SELECT * FROM cuenta where idRol = 3 and idCuenta = ?";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            ResultSet resultSet = pstmt.executeQuery();
            pstmt.setInt(1, idCuenta);

            while(resultSet.next()){
                Cuentas cuentas = new Cuentas();
                cuentas.setIdCuentas(resultSet.getInt(1));
                cuentas.setNombre(resultSet.getString(2));
                cuentas.setApellido(resultSet.getString(3));
                cuentas.setNickname(resultSet.getString(4));
                cuentas.setDireccion(resultSet.getString(5));
                cuentas.setCorreo(resultSet.getString(6));
                cuentas.setFoto(resultSet.getString(7));
                cuentas.setDescripcion(resultSet.getString(8));
                cuentas.setDesabilitado(resultSet.getBoolean(9));
                cuentas.setIdRol(resultSet.getInt(10));
                cuentas.setPasswordHashed(resultSet.getString(11));

                lista.add(cuentas);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }*/
}

