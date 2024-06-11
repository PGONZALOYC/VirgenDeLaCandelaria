/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import utilidades.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Estudiante {

    private Connection connection;
    private int idEstudiante;
    private String Dni;
    private String ApPaterno;
    private String ApMaterno;
    private String Nombres;
    private String Direccion;
    private String Departamento;
    private String Distrito;
    private String Genero;
    private String Fecha_Nac;

    public Estudiante() {
        try {
            Conexion conexion = new Conexion();
            connection = conexion.conecta();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Estudiante(Connection connection, int idEstudiante, String Dni, String ApPaterno, String ApMaterno, String Nombres, String Direccion, String Departamento, String Distrito, String Genero, String Fecha_Nac) {
        this.connection = connection;
        this.idEstudiante = idEstudiante;
        this.Dni = Dni;
        this.ApPaterno = ApPaterno;
        this.ApMaterno = ApMaterno;
        this.Nombres = Nombres;
        this.Direccion = Direccion;
        this.Departamento = Departamento;
        this.Distrito = Distrito;
        this.Genero = Genero;
        this.Fecha_Nac = Fecha_Nac;
    }

    public int getIdEstudiante() {
        return idEstudiante;
    }

    public void setIdEstudiante(int idEstudiante) {
        this.idEstudiante = idEstudiante;
    }

    public String getDni() {
        return Dni;
    }

    public void setDni(String Dni) {
        this.Dni = Dni;
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

    public String getDistrito() {
        return Distrito;
    }

    public void setDistrito(String Distrito) {
        this.Distrito = Distrito;
    }

    public void agregarEstudiante(Estudiante estudiante) {
        try {
            String sql = "INSERT INTO Estudiante (Dni, Ap_Paterno, Ap_Materno, Nombres, Direccion, Departamento, Distrito, Genero, Fecha_Nac) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                statement.setString(1, estudiante.getDni());
                statement.setString(2, estudiante.getApPaterno());
                statement.setString(3, estudiante.getApMaterno());
                statement.setString(4, estudiante.getNombres());
                statement.setString(5, estudiante.getDireccion());
                statement.setString(6, estudiante.getDepartamento());
                statement.setString(7, estudiante.getDistrito());
                statement.setString(8, estudiante.getGenero());
                statement.setString(9, estudiante.getFecha_Nac());
                statement.executeUpdate();

                try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        estudiante.setIdEstudiante(generatedKeys.getInt(1));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void actualizarEstudiante(Estudiante estudiante) {
        try {
            String sql = "UPDATE Estudiante SET Dni = ?, Ap_Paterno = ?, Ap_Materno = ?, Nombres = ?, Direccion = ?, Departamento = ?, Distrito = ?, Genero = ?, Fecha_Nac = ? WHERE Id_Estudiante = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, estudiante.getDni());
                statement.setString(2, estudiante.getApPaterno());
                statement.setString(3, estudiante.getApMaterno());
                statement.setString(4, estudiante.getNombres());
                statement.setString(5, estudiante.getDireccion());
                statement.setString(6, estudiante.getDepartamento());
                statement.setString(7, estudiante.getDistrito());
                statement.setString(8, estudiante.getGenero());
                statement.setString(9, estudiante.getFecha_Nac());
                statement.setInt(10, estudiante.getIdEstudiante());
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void eliminarEstudiante(int idEstudiante) {
        try {
            String sql = "DELETE FROM Estudiante WHERE Id_Estudiante = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, idEstudiante);
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Estudiante obtenerEstudiante(int idEstudiante) {
        Estudiante estudiante = null;
        try {
            String sql = "SELECT * FROM Estudiante WHERE Id_Estudiante = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, idEstudiante);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        estudiante = new Estudiante();
                        estudiante.setIdEstudiante(resultSet.getInt("Id_Estudiante"));
                        estudiante.setDni(resultSet.getString("Dni"));
                        estudiante.setApPaterno(resultSet.getString("Ap_Paterno"));
                        estudiante.setApMaterno(resultSet.getString("Ap_Materno"));
                        estudiante.setNombres(resultSet.getString("Nombres"));
                        estudiante.setDireccion(resultSet.getString("Direccion"));
                        estudiante.setDepartamento(resultSet.getString("Departamento"));
                        estudiante.setDistrito(resultSet.getString("Distrito"));
                        estudiante.setNombres(resultSet.getString("Nombres"));
                        estudiante.setGenero(resultSet.getString("Genero"));
                        estudiante.setFecha_Nac(resultSet.getString("Fecha_Nac"));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return estudiante;
    }
    
    public Estudiante obtenerEstudiantePorDni(String dni) {
        Estudiante estudiante = null;
        try {
            String sql = "SELECT * FROM Estudiante WHERE Dni = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, dni);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        estudiante = new Estudiante();
                        estudiante.setIdEstudiante(resultSet.getInt("Id_Estudiante"));
                        estudiante.setDni(resultSet.getString("Dni"));
                        estudiante.setApPaterno(resultSet.getString("Ap_Paterno"));
                        estudiante.setApMaterno(resultSet.getString("Ap_Materno"));
                        estudiante.setNombres(resultSet.getString("Nombres"));
                        estudiante.setDireccion(resultSet.getString("Direccion"));
                        estudiante.setDepartamento(resultSet.getString("Departamento"));
                        estudiante.setDistrito(resultSet.getString("Distrito"));
                        estudiante.setNombres(resultSet.getString("Nombres"));
                        estudiante.setGenero(resultSet.getString("Genero"));
                        estudiante.setFecha_Nac(resultSet.getString("Fecha_Nac"));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return estudiante;
    }

    public List<Estudiante> obtenerListaEstudiantes() {
        List<Estudiante> estudiantes = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Estudiante";
            try (Statement statement = connection.createStatement(); ResultSet resultSet = statement.executeQuery(sql)) {
                while (resultSet.next()) {
                    Estudiante estudiante = new Estudiante();
                    estudiante.setIdEstudiante(resultSet.getInt("Id_Estudiante"));
                    estudiante.setDni(resultSet.getString("Dni"));
                    estudiante.setApPaterno(resultSet.getString("Ap_Paterno"));
                    estudiante.setApMaterno(resultSet.getString("Ap_Materno"));
                    estudiante.setNombres(resultSet.getString("Nombres"));
                    estudiante.setDireccion(resultSet.getString("Direccion"));
                    estudiante.setDepartamento(resultSet.getString("Departamento"));
                    estudiante.setDistrito(resultSet.getString("Distrito"));
                    estudiante.setNombres(resultSet.getString("Nombres"));
                    estudiante.setGenero(resultSet.getString("Genero"));
                    estudiante.setFecha_Nac(resultSet.getString("Fecha_Nac"));
                    estudiantes.add(estudiante);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return estudiantes;
    }
}
