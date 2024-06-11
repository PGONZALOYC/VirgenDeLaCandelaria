package model;

import utilidades.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class Relacion {
    
     private Connection connection;
    
    private int idEstudiante;
    private int idApoderado;
    private String Vinculo;

    public Relacion() {
        try {
            Conexion conexion = new Conexion();
            connection = conexion.conecta();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    
    public Relacion(Connection connection, int idEstudiante, int idApoderado, String Vinculo) {
        this.connection = connection;
        this.idEstudiante = idEstudiante;
        this.idApoderado = idApoderado;
        this.Vinculo = Vinculo;
    }

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    public int getIdEstudiante() {
        return idEstudiante;
    }

    public void setIdEstudiante(int idEstudiante) {
        this.idEstudiante = idEstudiante;
    }

    public int getIdApoderado() {
        return idApoderado;
    }

    public void setIdApoderado(int idApoderado) {
        this.idApoderado = idApoderado;
    }

    public String getVinculo() {
        return Vinculo;
    }

    public void setVinculo(String Vinculo) {
        this.Vinculo = Vinculo;
    }
    
    public void agregarRelacion(Relacion relacion){
        try{
            String sql= "INSERT INTO Relacion (Id_Estudiante,Id_Apoderado,vinculo)";
            try(PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)){
                statement.setInt(1, relacion.getIdEstudiante());
                statement.setInt(2, relacion.getIdApoderado());
                statement.setString(3, relacion.getVinculo());
                statement.executeUpdate();
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    public void eliminarRelacion(int idEstudiante,int idApoderado) {
        try {
            String sql="DELETE FROM Relacion WHERE Id_Estudiante=? AND Id_Apoderado";
            try(PreparedStatement statement = connection.prepareStatement(sql)){
                statement.setInt(1, idEstudiante);
                statement.setInt(2, idApoderado);
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public List<Relacion>obtenerListaRelacion(int id_Apoderado){
        List<Relacion>relaciones=new ArrayList<>();
        try{
            String sql="SELECT * FROM Relacion WHERE Id_Apoderado=?";
            try(Statement statement = connection.createStatement(); ResultSet resultSet = statement.executeQuery(sql)){
                while (resultSet.next()) {
                    Relacion relacion =new Relacion();
                    
                    relacion.setIdEstudiante(resultSet.getInt("Id_Estudiante"));
                    relacion.setIdApoderado(resultSet.getInt("Id_Apoderado"));
                    relacion.setVinculo(resultSet.getString("Vinculo"));
                    relaciones.add(relacion);
                }
            }
        }catch(SQLException E){
            E.printStackTrace();
        }
        return relaciones;
    }
    public List<Estudiante>obtenerListaRelacionEstudiante(int id_Apoderado){
        List<Estudiante>estudiantes=new ArrayList<>();
        try{
            String sql="SELECT E.Id_Estudiante, E.Dni, E.Ap_Paterno, E.Ap_Materno, E.Nombres\n" +
                        "FROM Relacion R\n" +
                        "JOIN Estudiante E ON R.Id_Estudiante = E.Id_Estudiante\n" +
                        "WHERE R.Id_Apoderado = ?;";
            try(Statement statement = connection.createStatement(); ResultSet resultSet = statement.executeQuery(sql)){
                while (resultSet.next()) {
                    Estudiante estudiante=new Estudiante();
                    estudiante.setIdEstudiante(resultSet.getInt("Id_Estudiantes"));
                    estudiante.setDni(resultSet.getString("Dni"));
                    estudiante.setApPaterno(resultSet.getString("Ap_Paterno"));
                    estudiante.setApPaterno(resultSet.getString("Ap_Materno"));
                    estudiante.setNombres(resultSet.getString("Nombres"));
                    estudiantes.add(estudiante);
                }
            }
        }catch(SQLException E){
            E.printStackTrace();
        }
        return estudiantes;
    }
}
