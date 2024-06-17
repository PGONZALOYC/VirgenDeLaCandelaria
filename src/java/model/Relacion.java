package model;

import utilidades.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class Relacion {
    
     private Connection connection;
    
    private int id_Estudiante;
    private int id_Apoderado;
    private String vinculo;

    public Relacion() {
        try {
            Conexion conexion = new Conexion();
            connection = conexion.conecta();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Relacion(Connection connection, int id_Estudiante, int id_Apoderado, String vinculo) {
        this.connection = connection;
        this.id_Estudiante = id_Estudiante;
        this.id_Apoderado = id_Apoderado;
        this.vinculo = vinculo;
    }

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    public int getId_Estudiante() {
        return id_Estudiante;
    }

    public void setId_Estudiante(int id_Estudiante) {
        this.id_Estudiante = id_Estudiante;
    }

    public int getId_Apoderado() {
        return id_Apoderado;
    }

    public void setId_Apoderado(int id_Apoderado) {
        this.id_Apoderado = id_Apoderado;
    }

    public String getVinculo() {
        return vinculo;
    }

    public void setVinculo(String vinculo) {
        this.vinculo = vinculo;
    }
    
    public void agregarRelacion(Relacion relacion){
        try{
            String sql= "INSERT INTO Relacion (id_Estudiante,id_Apoderado,vinculo) VALUES (?, ?, ?)";
            try(PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)){
                statement.setInt(1, relacion.getId_Estudiante());
                statement.setInt(2, relacion.getId_Apoderado());
                statement.setString(3, relacion.getVinculo());
                statement.executeUpdate();
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    public void eliminarRelacion(int idEstudiante,int idApoderado) {
        try {
            String sql="DELETE FROM Relacion WHERE id_Estudiante = ? AND id_Apoderado";
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
            String sql="SELECT * FROM Relacion WHERE id_Apoderado=?";
            try(Statement statement = connection.createStatement(); ResultSet resultSet = statement.executeQuery(sql)){
                while (resultSet.next()) {
                    Relacion relacion =new Relacion();
                    
                    relacion.setId_Estudiante(resultSet.getInt("Id_Estudiante"));
                    relacion.setId_Apoderado(resultSet.getInt("Id_Apoderado"));
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
            String sql="SELECT E.id_Estudiante, E.dni, E.apellido_Paterno, E.apellido_Materno, E.nombres FROM Relacion R\n" +
                        "JOIN Estudiante E ON R.id_Estudiante = E.id_Estudiante\n" +
                        "WHERE R.id_Apoderado = ? ";
            try(Statement statement = connection.createStatement(); ResultSet resultSet = statement.executeQuery(sql)){
                while (resultSet.next()) {
                    Estudiante estudiante=new Estudiante();
                    estudiante.setId_Estudiante(resultSet.getInt("id_Estudiantes"));
                    estudiante.setDni(resultSet.getString("dni"));
                    estudiante.setApellido_Paterno(resultSet.getString("apellido_Paterno"));
                    estudiante.setApellido_Paterno(resultSet.getString("apellido_Materno"));
                    estudiante.setNombres(resultSet.getString("nombres"));
                    estudiantes.add(estudiante);
                }
            }
        }catch(SQLException E){
            E.printStackTrace();
        }
        return estudiantes;
    }
}
