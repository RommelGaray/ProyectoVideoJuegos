package com.example.proyecto_iweb.models.daos;

import com.example.proyecto_iweb.models.beans.*;
import com.example.proyecto_iweb.models.dtos.Consolas;
import com.example.proyecto_iweb.models.dtos.Generos;

import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;

public class AdminJuegosDaos  extends DaoBase{
    /** SECCIÓN DE ROMMEL **/
    /** Juegos disponibles **/
    /** Listar todos los juegos (View: Index principal del Admin) **/
    public ArrayList<Juegos> listarJuegosDisponibles(){

        ArrayList<Juegos> lista = new ArrayList<>();
        String sql = "select * from juego where habilitado = 1";

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
                juegoDisponible.setFotoJuego(resultSet.getString("fotoJuego"));
                lista.add(juegoDisponible);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }

    public ArrayList<Consolas> consolas(){

        ArrayList<Consolas> lista = new ArrayList<>();
        String sql = "select distinct consola from juego";

        try (Connection connection = this.getConection();
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while (resultSet.next()) {
                Consolas consolas = new Consolas();

                consolas.setNombre(resultSet.getString(1));
                lista.add(consolas);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }

    public ArrayList<Generos> generos(){

        ArrayList<Generos> lista = new ArrayList<>();
        String sql = "select distinct genero from juego";

        try (Connection connection = this.getConection();
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while (resultSet.next()) {
                Generos generos = new Generos();

                generos.setNombre(resultSet.getString(1));
                lista.add(generos);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }

    public void crearJuego(String nombre, String descripcion, double precio, int stock, String consola, String genero, InputStream file){

        String sql = "INSERT INTO juego (nombre,descripcion,precio,descuento,stock,consola,genero,fotoJuego,existente,habilitado) VALUES (?,?,?,'0',?,?,?,?,'1','1')";

        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, nombre);
            pstmt.setString(2, descripcion);
            pstmt.setDouble(3, precio);
            pstmt.setDouble(4, stock);
            pstmt.setString(5, consola);
            pstmt.setString(6, genero);

            pstmt.setBlob(7, file);
            //pstmt.setBytes(7, foto);
            pstmt.executeUpdate();


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public Juegos obtenerJuego(String idJuego) {

        Juegos juegos = null;
        String sql = "SELECT * FROM juego WHERE idJuego = ?";

        try {
            try (Connection conn = this.getConection();
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, idJuego);

                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        juegos = new Juegos();
                        juegos.setIdJuegos(rs.getInt(1));
                        juegos.setNombre(rs.getString(2));
                        juegos.setDescripcion(rs.getString(3));
                        juegos.setPrecio(rs.getDouble(4));
                        juegos.setDescuento(rs.getDouble(5));
                        juegos.setFoto(rs.getString(6));
                        juegos.setConsola(rs.getString(9));
                        juegos.setGenero(rs.getString(10));
                        juegos.setStock(rs.getInt(11));
                    }
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return juegos;
    }

    public void actualizarJuego(int idJuego, String nombre, String descripcion, double precio, double descuento, String consola, String genero, int stock, InputStream file){
        String sql = "UPDATE juego SET nombre = ?,descripcion = ?,precio = ?, descuento = ?, consola = ?, genero = ?, stock = ?, fotoJuego = ? WHERE idJuego = ?";
        try (Connection connection = this.getConection()){

            try (PreparedStatement pstmt = connection.prepareStatement(sql)){
                pstmt.setString(1, nombre);
                pstmt.setString(2, descripcion);
                pstmt.setDouble(3, precio);
                pstmt.setDouble(4, descuento);
                pstmt.setString(5, consola);
                pstmt.setString(6, genero);
                pstmt.setInt(7, stock);
                pstmt.setBlob(8, file);
                pstmt.setInt(9, idJuego);
                pstmt.executeUpdate();
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


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

    /** Reservas y comprados**/
    public ArrayList<CompraUsuario> compradosAndReservados(){

        ArrayList<CompraUsuario> lista = new ArrayList<>();
        String sql1 = "select * from comprausuario cu\n" +
                "left join estados e on cu.idEstados = e.idestados \n" +
                "left join cuenta c on cu.idUsuario = c.idCuenta\n" +
                "left join juego j on cu.idJuego = j.idJuego";

        try (Connection connection = this.getConection();
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql1)) {

            while(resultSet.next()){
                CompraUsuario compraUsuario = new CompraUsuario();
                compraUsuario.setIdCompra(resultSet.getInt(1));
                compraUsuario.setIdUsuario(resultSet.getInt(2));
                compraUsuario.setIdJuego(resultSet.getInt(3));
                compraUsuario.setCantidad(resultSet.getInt(4));
                compraUsuario.setFechaCompra(resultSet.getDate(5));
                compraUsuario.setDireccion(resultSet.getString(6));
                compraUsuario.setIdAdmin(resultSet.getInt(7));
                compraUsuario.setPrecioCompra(resultSet.getInt(8));
                compraUsuario.setIdEstados(resultSet.getInt(9));

                Cuentas cuentas = new Cuentas();
                cuentas.setIdCuentas(resultSet.getInt("c.idCuenta"));
                cuentas.setNombre(resultSet.getString("c.nombre"));
                cuentas.setApellido(resultSet.getString("c.apellido"));
                compraUsuario.setUsuario(cuentas);

                Estados estados = new Estados();
                estados.setIdEstados(resultSet.getInt("e.idestados"));
                estados.setEstados(resultSet.getString("e.nombreEstados"));
                compraUsuario.setEstados(estados);

                Juegos juegos = new Juegos();
                juegos.setIdJuegos(resultSet.getInt("j.idJuego"));
                juegos.setNombre(resultSet.getString("j.nombre"));
                compraUsuario.setJuegos(juegos);

                lista.add(compraUsuario);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }

    public CompraUsuario comprados(int idVenta) {

        CompraUsuario compraUsuario = null;

        String sql1 = "SELECT * FROM comprausuario cu\n" +
                "LEFT JOIN estados e ON cu.idEstados = e.idestados\n" +
                "LEFT JOIN cuenta c ON cu.idUsuario = c.idCuenta\n" +
                "LEFT JOIN juego j ON cu.idJuego = j.idJuego\n" +
                "WHERE cu.idCompra = ?";  // Agregar condición para el idVenta

        try (Connection connection = this.getConection();
             PreparedStatement stmt = connection.prepareStatement(sql1)) {

            stmt.setInt(1, idVenta);  // Establecer el valor del parámetro idVenta

            try (ResultSet resultSet = stmt.executeQuery()) {
                while (resultSet.next()) {
                    compraUsuario = new CompraUsuario();
                    compraUsuario.setIdCompra(resultSet.getInt(1));
                    compraUsuario.setIdUsuario(resultSet.getInt(2));
                    compraUsuario.setIdJuego(resultSet.getInt(3));
                    compraUsuario.setCantidad(resultSet.getInt(4));
                    compraUsuario.setFechaCompra(resultSet.getDate(5));
                    compraUsuario.setDireccion(resultSet.getString(6));
                    compraUsuario.setIdAdmin(resultSet.getInt(7));
                    compraUsuario.setPrecioCompra(resultSet.getInt(8));
                    compraUsuario.setIdEstados(resultSet.getInt(9));

                    Cuentas cuentas = new Cuentas();
                    cuentas.setIdCuentas(resultSet.getInt("c.idCuenta"));
                    cuentas.setNombre(resultSet.getString("c.nombre"));
                    cuentas.setApellido(resultSet.getString("c.apellido"));
                    compraUsuario.setUsuario(cuentas);

                    Estados estados = new Estados();
                    estados.setIdEstados(resultSet.getInt("e.idestados"));
                    estados.setEstados(resultSet.getString("e.nombreEstados"));
                    compraUsuario.setEstados(estados);

                    Juegos juegos = new Juegos();
                    juegos.setIdJuegos(resultSet.getInt("j.idJuego"));
                    juegos.setNombre(resultSet.getString("j.nombre"));
                    compraUsuario.setJuegos(juegos);

                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return compraUsuario;
    }


    public ArrayList<VentaUsuario> juegosPropuestos(){

        ArrayList<VentaUsuario> lista = new ArrayList<>();
        String sql1 = "select * from ventausuario v \n" +
                "left join estados e on v.idEstados = e.idestados \n" +
                "left join cuenta c on v.idUsuario = c.idCuenta\n" +
                "left join juego j on v.idJuego = j.idJuego where e.idestados in (1, 3)";

        try (Connection connection = this.getConection();
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql1)) {

            while(resultSet.next()){
                VentaUsuario ventaUsuario = new VentaUsuario();
                ventaUsuario.setIdVenta(resultSet.getInt(1));
                ventaUsuario.setIdUsuario(resultSet.getInt(2));
                ventaUsuario.setIdJuego(resultSet.getInt(3));
                ventaUsuario.setPrecioVenta(resultSet.getDouble(4));
                ventaUsuario.setMensajeAdmin(resultSet.getString(5));
                ventaUsuario.setIdEstados(resultSet.getInt(7));

                Cuentas cuentas = new Cuentas();
                cuentas.setIdCuentas(resultSet.getInt("c.idCuenta"));
                cuentas.setNombre(resultSet.getString("c.nombre"));
                ventaUsuario.setUsuario(cuentas);

                Estados estados = new Estados();
                estados.setIdEstados(resultSet.getInt("e.idestados"));
                estados.setEstados(resultSet.getString("e.nombreEstados"));
                ventaUsuario.setEstados(estados);

                Juegos juegos = new Juegos();
                juegos.setIdJuegos(resultSet.getInt("j.idJuego"));
                juegos.setNombre(resultSet.getString("j.nombre"));
                ventaUsuario.setJuegos(juegos);

                lista.add(ventaUsuario);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }


    /** Ofertas **/
    public ArrayList<Juegos> listarOfertas() {

        ArrayList<Juegos> ofertas = new ArrayList<>();
        String sql1 = "select * from juego where descuento != 0";

        try (Connection connection = this.getConection();
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql1)) {

            while (resultSet.next()) {
                Juegos juegoOferta = new Juegos();

                juegoOferta.setIdJuegos(resultSet.getInt(1));
                juegoOferta.setNombre(resultSet.getString(2));
                juegoOferta.setPrecio(resultSet.getInt(4));
                juegoOferta.setDescuento(resultSet.getInt(5));

                juegoOferta.setFoto(resultSet.getString(6));
                juegoOferta.setStock(resultSet.getInt(11));
                ofertas.add(juegoOferta);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return ofertas;
    }

    public Juegos listarJuegoAdmin(String id) {
        Juegos juego = null;

        String sql = "select * from juego where idJuego = ?";
        try (Connection connection = this.getConection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, id);

            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    juego = new Juegos();
                    juego.setIdJuegos(rs.getInt(1));
                    juego.setNombre(rs.getString(2));
                    juego.setDescripcion(rs.getString(3));
                    juego.setPrecio(rs.getDouble(4));
                    juego.setDescuento(rs.getDouble(5));
                    juego.setFoto(rs.getString(6));
                    juego.setExistente(rs.getBoolean(7));
                    juego.setHabilitado(rs.getBoolean(8));
                    juego.setConsola(rs.getString(9));
                    juego.setGenero(rs.getString(10));
                    juego.setStock(rs.getInt(11));
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return juego;
    }

    public void eliminarOferta(String id){

        String sql = "UPDATE juego SET descuento = 0 WHERE idJuego = ?";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void ofertarJuego(int id, double descuento){

        String sql = "UPDATE juego SET descuento = ? WHERE idJuego = ?";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, String.valueOf(descuento));
            pstmt.setString(2, String.valueOf(id));
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public void aceptarUsuario(String id){

        String sql = "UPDATE ventausuario SET idEstados = 2 WHERE idVenta = ?";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void rechazarUsuario(String id){

        String sql = "UPDATE ventausuario SET idEstados = 4 WHERE idVenta = ?";
        try (Connection connection = this.getConection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }



    /** SECCIÓN DE OSCAR **/
    public ArrayList<VentaUsuario> listarCola(){
        ArrayList<VentaUsuario> lista = new ArrayList<>();

        String sql =    "SELECT c.nombre, c.apellido, j.nombre, v.idEstados, j.existente , v.idVenta\n" +
                        "FROM cuenta AS c\n" +
                        "JOIN ventausuario AS v ON c.idCuenta = v.idUsuario\n" +
                        "JOIN juego AS j ON v.idJuego = j.idJuego\n" +
                        "WHERE v.idEstados = 1;";

        try (Connection connection = this.getConection();
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while(resultSet.next()){

                VentaUsuario ventausuario = new VentaUsuario();

                Cuentas cuenta = new Cuentas();
                cuenta.setNombre(resultSet.getNString(1));
                cuenta.setApellido(resultSet.getNString(2));
                ventausuario.setUsuario(cuenta);

                Juegos juegos = new Juegos();
                juegos.setNombre(resultSet.getString(3));

                ventausuario.setIdEstados(resultSet.getInt(4));

                juegos.setExistente(resultSet.getBoolean(5));
                ventausuario.setJuegos(juegos);

                ventausuario.setIdVenta(resultSet.getInt(6));


                lista.add(ventausuario);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }

    public ArrayList<Juegos> listarnuevos(){ //categoria, fecga agregado, estado

        ArrayList<Juegos> lista = new ArrayList<>();

        String sql =   "select * from juego where existente=0";

        try (Connection connection = this.getConection();
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while(resultSet.next()){
                Juegos juegos = new Juegos();
                juegos.setIdJuegos(resultSet.getInt(1));
                juegos.setNombre(resultSet.getString(2));
                juegos.setDescripcion(resultSet.getString(3));
                juegos.setPrecio(resultSet.getDouble(4));
                juegos.setDescuento(resultSet.getDouble(5));
                juegos.setStock(resultSet.getInt(11));
                juegos.setFoto(resultSet.getString(6));
                juegos.setExistente(resultSet.getBoolean(7));
                juegos.setHabilitado(resultSet.getBoolean(8));
                juegos.setConsola(resultSet.getString(9));
                juegos.setGenero(resultSet.getString(10));

                lista.add(juegos);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }

    public ArrayList<Juegos> listarexistentes(){ //num stock, reg venta
        ArrayList<Juegos> lista = new ArrayList<>();

        String sql =   "select * from juego where existente=1";

        String url = "jdbc:mysql://localhost:3306/mydb";
        try (Connection connection = this.getConection();
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while(resultSet.next()){
                Juegos juegos = new Juegos();
                juegos.setIdJuegos(resultSet.getInt(1));
                juegos.setNombre(resultSet.getString(2));
                juegos.setDescripcion(resultSet.getString(3));
                juegos.setPrecio(resultSet.getDouble(4));
                juegos.setDescuento(resultSet.getDouble(5));
                juegos.setStock(resultSet.getInt(11));
                juegos.setFoto(resultSet.getString(6));
                juegos.setExistente(resultSet.getBoolean(7));
                juegos.setHabilitado(resultSet.getBoolean(8));
                juegos.setConsola(resultSet.getString(9));
                juegos.setGenero(resultSet.getString(10));
                lista.add(juegos);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }

    public void cambiarestadoaceptar(String idventa){

        String sql = "UPDATE ventausuario SET idEstados = 2 WHERE idVenta = ?;";
        try (Connection connection = this.getConection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, idventa);

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void cambiarestadonoaceptar(String idventa){

        String sql = "UPDATE ventausuario SET idEstados = 3 WHERE idVenta = ?;";
        try (Connection connection = this.getConection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, idventa);

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void cambiarestadorechazar(String idventa){

        String sql = "UPDATE ventausuario SET idEstados = 4 WHERE idVenta = ?;";
        try (Connection connection = this.getConection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, idventa);

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void actualizarJuego1(int idJuego, String nombre, String descripcion, double precio, double descuento, String consola, String genero, int stock){
        String sql = "UPDATE juego SET nombre = ?,descripcion = ?,precio = ?, descuento = ?, consola = ?, genero = ?, stock = ? WHERE idJuego = ?";
        try (Connection connection = this.getConection()){

            try (PreparedStatement pstmt = connection.prepareStatement(sql)){
                pstmt.setString(1, nombre);
                pstmt.setString(2, descripcion);
                pstmt.setDouble(3, precio);
                pstmt.setDouble(4, descuento);
                pstmt.setString(5, consola);
                pstmt.setString(6, genero);
                pstmt.setInt(7, stock);
                pstmt.setInt(8, idJuego);

                pstmt.executeUpdate();
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void dejarMensaje(String mensajeAdmin, String idventa){
        String sql = "UPDATE ventausuario SET mensajeAdmin = ? WHERE idVenta = ?";
        try (Connection connection = this.getConection()){

            try (PreparedStatement pstmt = connection.prepareStatement(sql)){
                pstmt.setString(1, mensajeAdmin);
                pstmt.setString(2, idventa);

                pstmt.executeUpdate();
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
