/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import utilidades.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Patrick
 */
public class Matricula {
    private Connection connection;

    private int id_Matricula;
    private int id_Apoderado;
    private int id_Estudiante;
    private int id_Grado;    
    private int id_Usuario;
    private String estado;
    private int año;
    
    public Matricula() {
        try {
            Conexion conexion = new Conexion();
            connection = conexion.conecta();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Matricula(Connection connection, int id_Matricula, int id_Apoderado, int id_Estudiante, int id_Grado, int id_Usuario, String estado, int año) {
        this.connection = connection;
        this.id_Matricula = id_Matricula;
        this.id_Apoderado = id_Apoderado;
        this.id_Estudiante = id_Estudiante;
        this.id_Grado = id_Grado;
        this.id_Usuario = id_Usuario;
        this.estado = estado;
        this.año = año;
    }

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    public int getId_Matricula() {
        return id_Matricula;
    }

    public void setId_Matricula(int id_Matricula) {
        this.id_Matricula = id_Matricula;
    }

    public int getId_Apoderado() {
        return id_Apoderado;
    }

    public void setId_Apoderado(int id_Apoderado) {
        this.id_Apoderado = id_Apoderado;
    }

    public int getId_Estudiante() {
        return id_Estudiante;
    }

    public void setId_Estudiante(int id_Estudiante) {
        this.id_Estudiante = id_Estudiante;
    }

    public int getId_Grado() {
        return id_Grado;
    }

    public void setId_Grado(int id_Grado) {
        this.id_Grado = id_Grado;
    }

    public int getId_Usuario() {
        return id_Usuario;
    }

    public void setId_Usuario(int id_Usuario) {
        this.id_Usuario = id_Usuario;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getAño() {
        return año;
    }

    public void setAño(int año) {
        this.año = año;
    }

    public void agregarMatricula(Matricula matricula) {
        try {
            String sql = "INSERT INTO Matricula (id_Apoderado, id_Estudiante, id_Grado, id_Usuario, estado, año) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                statement.setInt(1, matricula.getId_Apoderado());
                statement.setInt(2, matricula.getId_Estudiante());
                statement.setInt(3, matricula.getId_Grado());
                statement.setInt(4, matricula.getId_Usuario());
                statement.setString(5, matricula.getEstado());
                statement.setInt(6, matricula.getAño());
                statement.executeUpdate();

                try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        matricula.setId_Estudiante(generatedKeys.getInt(1));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void actualizarMatricula(Matricula matricula) {
        try {
            String sql = "UPDATE Matricula SET id_Apoderado = ?, id_Estudiante = ?,id_Grado = ?, id_Usuario = ?, estado = ?, año = ? WHERE id_Matricula = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, matricula.getId_Apoderado());
                statement.setInt(2, matricula.getId_Estudiante());
                statement.setInt(3, matricula.getId_Grado());
                statement.setInt(4, matricula.getId_Usuario());
                statement.setString(5, matricula.getEstado());
                statement.setInt(6, matricula.getAño());
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    
    public Matricula obtenerMatricula(int idMatricula) {
        Matricula matricula = null;
        try {
            String sql = "SELECT * FROM Matricula WHERE id_Matricula = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, idMatricula);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        matricula = new Matricula();
                        matricula.setId_Matricula(resultSet.getInt( "id_Matricula"));
                        matricula.setId_Apoderado(resultSet.getInt("id_Apoderado"));
                        matricula.setId_Estudiante(resultSet.getInt("id_Estudiante"));
                        matricula.setId_Grado(resultSet.getInt("id_Grado"));                    
                        matricula.setId_Usuario(resultSet.getInt("id_Usuario"));
                        matricula.setEstado(resultSet.getString("estado"));
                        matricula.setAño(resultSet.getInt("año"));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return matricula;
    }
    
    public Estudiante obtenerEstudiantePorDni(String dni) {
        Estudiante estudiante = null;
        try {
            String sql = "SELECT * FROM Estudiante WHERE dni = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, dni);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        estudiante = new Estudiante();
                        estudiante.setId_Estudiante(resultSet.getInt("id_Estudiante"));
                        estudiante.setDni(resultSet.getString("dni"));
                        estudiante.setApellido_Paterno(resultSet.getString("apellido_Paterno"));
                        estudiante.setApellido_Materno(resultSet.getString("apellido_Materno"));
                        estudiante.setNombres(resultSet.getString("nombres"));
                        estudiante.setDireccion(resultSet.getString("direccion"));
                        estudiante.setDistrito(resultSet.getString("distrito"));
                        estudiante.setDistrito(resultSet.getString("provincia"));
                        estudiante.setDepartamento(resultSet.getString("departamento"));
                        estudiante.setSexo(resultSet.getString("sexo"));
                        estudiante.setFecha_Nacimiento(resultSet.getDate("fecha_Nacimiento"));
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
                    estudiante.setId_Estudiante(resultSet.getInt("id_Estudiante"));
                        estudiante.setDni(resultSet.getString("dni"));
                        estudiante.setApellido_Paterno(resultSet.getString("apellido_Paterno"));
                        estudiante.setApellido_Materno(resultSet.getString("apellido_Materno"));
                        estudiante.setNombres(resultSet.getString("nombres"));
                        estudiante.setDireccion(resultSet.getString("direccion"));
                        estudiante.setDistrito(resultSet.getString("distrito"));
                        estudiante.setDistrito(resultSet.getString("provincia"));
                        estudiante.setDepartamento(resultSet.getString("departamento"));
                        estudiante.setSexo(resultSet.getString("sexo"));
                        estudiante.setFecha_Nacimiento(resultSet.getDate("fecha_Nacimiento"));
                    estudiantes.add(estudiante);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return estudiantes;
    }
}
