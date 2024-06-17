package model;

import utilidades.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
 

public class Grado {
    private Connection connection;

    private int id_Grado;
    private String nivel;
    private String grado;
    private int capacidad_Vacantes;
    private int vacantes_Ocupadas;
    private int vacantes_Disponibles;
    
    public Grado() {
        try {
            Conexion conexion = new Conexion();
            connection = conexion.conecta();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Grado(Connection connection, int id_Grado, String nivel, String grado, int capacidad_Vacantes, int vacantes_Ocupadas, int vacantes_Disponibles) {
        this.connection = connection;
        this.id_Grado = id_Grado;
        this.nivel = nivel;
        this.grado = grado;
        this.capacidad_Vacantes = capacidad_Vacantes;
        this.vacantes_Ocupadas = vacantes_Ocupadas;
        this.vacantes_Disponibles = vacantes_Disponibles;
    }

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    public int getId_Grado() {
        return id_Grado;
    }

    public void setId_Grado(int id_Grado) {
        this.id_Grado = id_Grado;
    }

    public String getNivel() {
        return nivel;
    }

    public void setNivel(String nivel) {
        this.nivel = nivel;
    }

    public String getGrado() {
        return grado;
    }

    public void setGrado(String grado) {
        this.grado = grado;
    }

    public int getCapacidad_Vacantes() {
        return capacidad_Vacantes;
    }

    public void setCapacidad_Vacantes(int capacidad_Vacantes) {
        this.capacidad_Vacantes = capacidad_Vacantes;
    }

    public int getVacantes_Ocupadas() {
        return vacantes_Ocupadas;
    }

    public void setVacantes_Ocupadas(int vacantes_Ocupadas) {
        this.vacantes_Ocupadas = vacantes_Ocupadas;
    }

    public int getVacantes_Disponibles() {
        return vacantes_Disponibles;
    }

    public void setVacantes_Disponibles(int vacantes_Disponibles) {
        this.vacantes_Disponibles = vacantes_Disponibles;
    }

    
    public void actualizarGrado(Grado grado){
        try{
            String sql="UPDATE Grado SET nivel = ?, grado = ?, capacidad_Vacantes = ?, vacantes_Ocupadas = ?,vacantes_Disponibles =? WHERE id_Grado = ?";
            try(PreparedStatement statement = connection.prepareStatement(sql)){
                
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public Grado obtenerGradoporFiltro(String nivel, String grados){
        Grado grado =null;
        try{
             String sql = "SELECT * FROM Grado WHERE nivel = ? AND grado = ?";
            
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, nivel);
                statement.setString(2, grados);

                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        grado =new Grado();
                        grado.setId_Grado(resultSet.getInt("id_Grado"));
                        grado.setNivel(resultSet.getString("nivel"));
                        grado.setGrado(resultSet.getString("grado"));
                        grado.setCapacidad_Vacantes(resultSet.getInt("capacidad_Vacantes"));
                        grado.setVacantes_Ocupadas(resultSet.getInt("vacantes_Ocupadas"));
                        grado.setVacantes_Disponibles(resultSet.getInt("vacantes_Disponibles"));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return grado;
    }
    
    public List <Grado> obtenerListaGrado(){
        List<Grado> grados = new ArrayList<>();
        try{
            String sql ="SELECT * FROM grado";
            try (Statement statement = connection.createStatement(); ResultSet resultSet = statement.executeQuery(sql)) {
               while(resultSet.next()){
                   Grado grado = new Grado();
                   grado.setId_Grado(resultSet.getInt("id_Grado"));
                   grado.setNivel(resultSet.getString("nivel"));
                   grado.setGrado(resultSet.getString("grado"));
                   grado.setCapacidad_Vacantes(resultSet.getInt("capacidad_Vacantes"));
                   grado.setVacantes_Ocupadas(resultSet.getInt("vacantes_Ocupadas"));
                   grado.setVacantes_Disponibles(resultSet.getInt("vacantes_Disponibles"));
                   grados.add(grado);
               } 
            }
            
        }catch(SQLException e){
            e.printStackTrace();
        }
    return grados;
    }
}
