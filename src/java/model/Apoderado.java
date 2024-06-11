/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import utilidades.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Apoderado {
    
    private Connection connection;
    
    private int idApoderado;
    private String Dni;
    private String estadoVida;
    private String gradoInstruccion;
    private String ocupacion;
    private String Telefono;
    private String ApPaterno;
    private String ApMaterno;
    private String Nombres;
    private String Direccion;
    private String Distrito;
    private String Departamento;
    private String Genero;
    private String Fecha_Nac;
    
    public Apoderado() {
        try {
            Conexion conexion = new Conexion();
            connection = conexion.conecta();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Apoderado(Connection connection, int idApoderado, String Dni, String estadoVida, String gradoInstruccion, String ocupacion, String Telefono, String ApPaterno, String ApMaterno, String Nombres, String Direccion, String Distrito, String Departamento, String Genero, String Fecha_Nac) {
        this.connection = connection;
        this.idApoderado = idApoderado;
        this.Dni = Dni;
        this.estadoVida = estadoVida;
        this.gradoInstruccion = gradoInstruccion;
        this.ocupacion = ocupacion;
        this.Telefono = Telefono;
        this.ApPaterno = ApPaterno;
        this.ApMaterno = ApMaterno;
        this.Nombres = Nombres;
        this.Direccion = Direccion;
        this.Distrito = Distrito;
        this.Departamento = Departamento;
        this.Genero = Genero;
        this.Fecha_Nac = Fecha_Nac;
    }

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    public int getIdApoderado() {
        return idApoderado;
    }

    public void setIdApoderado(int idApoderado) {
        this.idApoderado = idApoderado;
    }

    public String getDni() {
        return Dni;
    }

    public void setDni(String Dni) {
        this.Dni = Dni;
    }

    public String getEstadoVida() {
        return estadoVida;
    }

    public void setEstadoVida(String estadoVida) {
        this.estadoVida = estadoVida;
    }

    public String getGradoInstruccion() {
        return gradoInstruccion;
    }

    public void setGradoInstruccion(String gradoInstruccion) {
        this.gradoInstruccion = gradoInstruccion;
    }

    public String getOcupacion() {
        return ocupacion;
    }

    public void setOcupacion(String ocupacion) {
        this.ocupacion = ocupacion;
    }

    public String getTelefono() {
        return Telefono;
    }

    public void setTelefono(String Telefono) {
        this.Telefono = Telefono;
    }

    public String getApPaterno() {
        return ApPaterno;
    }

    public void setApPaterno(String ApPaterno) {
        this.ApPaterno = ApPaterno;
    }

    public String getApMaterno() {
        return ApMaterno;
    }

    public void setApMaterno(String ApMaterno) {
        this.ApMaterno = ApMaterno;
    }

    public String getNombres() {
        return Nombres;
    }

    public void setNombres(String Nombres) {
        this.Nombres = Nombres;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getDistrito() {
        return Distrito;
    }

    public void setDistrito(String Distrito) {
        this.Distrito = Distrito;
    }

    public String getDepartamento() {
        return Departamento;
    }

    public void setDepartamento(String Departamento) {
        this.Departamento = Departamento;
    }

    public String getGenero() {
        return Genero;
    }

    public void setGenero(String Genero) {
        this.Genero = Genero;
    }

    public String getFecha_Nac() {
        return Fecha_Nac;
    }

    public void setFecha_Nac(String Fecha_Nac) {
        this.Fecha_Nac = Fecha_Nac;
    }
    
    public void agregarApoderado(Apoderado apoderado){
        try{
            String sql= "INSERT INTO Apoderado (Dni,Estado_Vida,Grado_Instruccion,Ocupacion,Telefono,Ap_Paterno,Ap_Materno,Nombres,Direccion,Distrito,Departamento,Genero,Fecha_Nac) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
            try(PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)){
                statement.setString(1, apoderado.getDni());
                statement.setString(2, apoderado.getEstadoVida());
                statement.setString(3, apoderado.getGradoInstruccion());
                statement.setString(4, apoderado.getOcupacion());
                statement.setString(5, apoderado.getTelefono());
                statement.setString(6, apoderado.getApPaterno());
                statement.setString(7, apoderado.getApMaterno());
                statement.setString(8, apoderado.getNombres());
                statement.setString(9, apoderado.getDireccion());
                statement.setString(10, apoderado.getDistrito());
                statement.setString(11, apoderado.getDepartamento());
                statement.setString(12, apoderado.getGenero());
                statement.setString(13, apoderado.getFecha_Nac());
                statement.executeUpdate();
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public void actualizarApoderado(Apoderado apoderado){
        try{
            String sql = "UPDATE Apoderado SET Dni = ?,Estado_Vida = ?,Grado_Instruccion=?, Ocupacion=?,Telefono=?,Ap_Paterno=?,Ap_Materno=?,Nombres=?,Direccion=?, Distrito=?,Departamento=?,Genero=? ,Fecha_Nac=? WHERE ID_Apoderado=?";
            try(PreparedStatement statement = connection.prepareStatement(sql)){
                statement.setString(1, apoderado.getDni());
                statement.setString(2, apoderado.getEstadoVida());
                statement.setString(3, apoderado.getGradoInstruccion());
                statement.setString(4, apoderado.getOcupacion());
                statement.setString(5, apoderado.getTelefono());
                statement.setString(6, apoderado.getApPaterno());
                statement.setString(7, apoderado.getApMaterno());
                statement.setString(8, apoderado.getNombres());
                statement.setString(9, apoderado.getDireccion());
                statement.setString(10, apoderado.getDistrito());
                statement.setString(11, apoderado.getDepartamento());
                statement.setString(12, apoderado.getGenero());
                statement.setString(13, apoderado.getFecha_Nac());
                statement.setInt(10,apoderado.getIdApoderado());
                statement.executeUpdate();
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public void eliminarApoderado(int idApoderado){
        try {
            String sql="DELETE FROM Apoderado WHERE Id_Apoderado=?";
            try(PreparedStatement statement = connection.prepareStatement(sql)){
                statement.setInt(1, idApoderado);
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public Apoderado obtenerApoderado(int idApoderado){
        Apoderado apoderado =null;
        try{
            String sql = "SELECT * FROM Estudiante WHERE Id_Estudiante = ?";
            try(PreparedStatement statement = connection.prepareStatement(sql)){
                statement.setInt(1, idApoderado);
                try(ResultSet resultSet = statement.executeQuery()){
                    if(resultSet.next()){
                        apoderado=new Apoderado();
                        apoderado.setIdApoderado(resultSet.getInt("Id_Apoderado"));
                        apoderado.setDni(resultSet.getString("Dni"));
                        apoderado.setEstadoVida(resultSet.getString("Estado_Vida"));
                        apoderado.setGradoInstruccion(resultSet.getString("Grado_Instruccion"));
                        apoderado.setOcupacion(resultSet.getString("Ocupacion"));
                        apoderado.setTelefono(resultSet.getString("Telefono"));
                        apoderado.setApPaterno(resultSet.getString("Ap_Paterno"));
                        apoderado.setApMaterno(resultSet.getString("Ap_Materno"));
                        apoderado.setNombres(resultSet.getString("Nombres"));
                        apoderado.setDireccion(resultSet.getString("Direccion"));
                        apoderado.setDistrito(resultSet.getString("Distrito"));
                        apoderado.setDepartamento(resultSet.getString("Departamento"));
                        apoderado.setGenero(resultSet.getString("Genero"));
                        apoderado.setFecha_Nac(resultSet.getString("Fecha_Nac"));
                    }
                }
            }
        }catch(SQLException E){
            E.printStackTrace();
        }
        return apoderado;
    }
    public Apoderado obtenerApoderadoPorDni(String dni){
        Apoderado apoderado=null;
        try{
            String sql="SELECT * FROM Apoderado WHERE Dni=?";
            try(PreparedStatement statement = connection.prepareStatement(sql)){
                statement.setString(1, dni);
                try(ResultSet resultSet = statement.executeQuery()){
                    apoderado=new Apoderado();
                        apoderado.setIdApoderado(resultSet.getInt("Id_Apoderado"));
                        apoderado.setDni(resultSet.getString("Dni"));
                        apoderado.setEstadoVida(resultSet.getString("Estado_Vida"));
                        apoderado.setGradoInstruccion(resultSet.getString("Grado_Instruccion"));
                        apoderado.setOcupacion(resultSet.getString("Ocupacion"));
                        apoderado.setTelefono(resultSet.getString("Telefono"));
                        apoderado.setApPaterno(resultSet.getString("Ap_Paterno"));
                        apoderado.setApMaterno(resultSet.getString("Ap_Materno"));
                        apoderado.setNombres(resultSet.getString("Nombres"));
                        apoderado.setDireccion(resultSet.getString("Direccion"));
                        apoderado.setDistrito(resultSet.getString("Distrito"));
                        apoderado.setDepartamento(resultSet.getString("Departamento"));
                        apoderado.setGenero(resultSet.getString("Genero"));
                        apoderado.setFecha_Nac(resultSet.getString("Fecha_Nac"));
                }
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return  apoderado;
    }
    
    public List<Apoderado>obtenerListaApoderado(){
        List<Apoderado>apoderados=new ArrayList<>();
        try{
            String sql ="SELECT * FROM Apoderado";
            try(Statement statement = connection.createStatement(); ResultSet resultSet = statement.executeQuery(sql)){
                while(resultSet.next()){
                    Apoderado apoderado=new Apoderado();
                    apoderado.setIdApoderado(resultSet.getInt("Id_Apoderado"));
                    apoderado.setDni(resultSet.getString("Dni"));
                    apoderado.setEstadoVida(resultSet.getString("Estado_Vida"));
                    apoderado.setGradoInstruccion(resultSet.getString("Grado_Instruccion"));
                    apoderado.setOcupacion(resultSet.getString("Ocupacion"));
                    apoderado.setTelefono(resultSet.getString("Telefono"));
                    apoderado.setApPaterno(resultSet.getString("Ap_Paterno"));
                    apoderado.setApMaterno(resultSet.getString("Ap_Materno"));
                    apoderado.setNombres(resultSet.getString("Nombres"));
                    apoderado.setDireccion(resultSet.getString("Direccion"));
                    apoderado.setDistrito(resultSet.getString("Distrito"));
                    apoderado.setDepartamento(resultSet.getString("Departamento"));
                    apoderado.setGenero(resultSet.getString("Genero"));
                    apoderado.setFecha_Nac(resultSet.getString("Fecha_Nac"));
                    apoderados.add(apoderado);
                }
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return  apoderados;
    }
    
    public List<Apoderado>obtenerListaApoderadoRelacionados(int idEstudiante){
        List<Apoderado>apoderados=new ArrayList<>();
        try{
            String sql = "SELECT Apoderado.Id_Apoderado, Apoderado.Dni, Apoderado.Ap_Paterno, Apoderado.Ap_Materno, Apoderado.Nombres, Relacion.Vinculo FROM Apoderado \n"
                    + "INNER JOIN Relacion ON Relacion.Id_Apoderado = Apoderado.Id_Apoderado \n"
                    + "WHERE Relacion.Id_Estudiante = ?";
            try(PreparedStatement statement = connection.prepareStatement(sql)){
                statement.setInt(1, idEstudiante);
                try(ResultSet resultSet = statement.executeQuery()){
                    if(resultSet.next()){
                        Apoderado apoderado=new Apoderado();
                        apoderado.setIdApoderado(resultSet.getInt("Id_Apoderado"));
                        apoderado.setDni(resultSet.getString("Dni"));
                        apoderado.setApPaterno(resultSet.getString("Ap_Paterno"));
                        apoderado.setApMaterno(resultSet.getString("Ap_Materno"));
                        apoderado.setNombres(resultSet.getString("Nombres"));
                        apoderado.setDireccion(resultSet.getString("Vinculo"));
                        apoderados.add(apoderado);
                    }
                }
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return  apoderados;
    }
}
