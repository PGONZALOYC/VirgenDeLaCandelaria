package model;

import utilidades.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
 

public class Grado {
    private Connection connection;

    private int idGrado;
    private String Nivel;
    private String Grado;
    private int Capacidad;
    private int VacOcupa;
    private int VacDisp;
    
    public Grado() {
        try {
            Conexion conexion = new Conexion();
            connection = conexion.conecta();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Grado(Connection connection, int idGrado, String Nivel, String Grado, int Capacidad, int VacOcupa, int VacDisp) {
        this.connection = connection;
        this.idGrado = idGrado;
        this.Nivel = Nivel;
        this.Grado = Grado;
        this.Capacidad = Capacidad;
        this.VacOcupa = VacOcupa;
        this.VacDisp = VacDisp;
    }

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    public int getIdGrado() {
        return idGrado;
    }

    public void setIdGrado(int idGrado) {
        this.idGrado = idGrado;
    }

    public String getNivel() {
        return Nivel;
    }

    public void setNivel(String Nivel) {
        this.Nivel = Nivel;
    }

    public String getGrado() {
        return Grado;
    }

    public void setGrado(String Grado) {
        this.Grado = Grado;
    }

    public int getCapacidad() {
        return Capacidad;
    }

    public void setCapacidad(int Capacidad) {
        this.Capacidad = Capacidad;
    }

    public int getVacOcupa() {
        return VacOcupa;
    }

    public void setVacOcupa(int VacOcupa) {
        this.VacOcupa = VacOcupa;
    }

    public int getVacDisp() {
        return VacDisp;
    }

    public void setVacDisp(int VacDisp) {
        this.VacDisp = VacDisp;
    }
    
    public void actualizarGrado(Grado grado){
        try{
            String sql="UPDATE Grado SET Nivel = ?, Grado = ?, Cap_Vac = ?,Vac_Ocu = ?,Vac_Disp =? WHERE Id_Grado = ?";
            try(PreparedStatement statement = connection.prepareStatement(sql)){
                
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public Grado obtenerGradoporFiltro(String nivel, String grados){
        Grado grado =null;
        try{
             String sql = "SELECT * FROM Grado WHERE Nivel = ? AND Grado = ?";
            
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, nivel);
                statement.setString(2, grados);

                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        grado =new Grado();
                        grado.setIdGrado(resultSet.getInt("Id_Grado"));
                        grado.setNivel(resultSet.getString("Nivel"));
                        grado.setGrado(resultSet.getString("Grado"));
                        grado.setCapacidad(resultSet.getInt("Cap_Vac"));
                        grado.setVacOcupa(resultSet.getInt("Vac_Ocu"));
                        grado.setVacDisp(resultSet.getInt("Vac_Disp"));
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
            String sql ="SELECT * FROM Grado";
            try (Statement statement = connection.createStatement(); ResultSet resultSet = statement.executeQuery(sql)) {
               while(resultSet.next()){
                   Grado grado = new Grado();
                   grado.setIdGrado(resultSet.getInt("Id_Grado"));
                   grado.setNivel(resultSet.getString("Nivel"));
                   grado.setGrado(resultSet.getString("Grado"));
                   grado.setCapacidad(resultSet.getInt("Cap_Vac"));
                   grado.setVacOcupa(resultSet.getInt("Vac_Ocu"));
                   grado.setVacDisp(resultSet.getInt("Vac_Disp"));
                   grados.add(grado);
               } 
            }
            
        }catch(SQLException e){
            e.printStackTrace();
        }
    return grados;
    }
}
