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

    
    private int idMatricula;
    private int idGrado;
    private int idApoderado;
    private int idUsuario;
    private String estado;
    private int idEstudiante;
    
    public Matricula() {
        try {
            Conexion conexion = new Conexion();
            connection = conexion.conecta();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Matricula(int idMatricula, int idGrado, int idApoderado, int idUsusario, String estado) {
        this.idMatricula = idMatricula;
        this.idGrado = idGrado;
        this.idApoderado = idApoderado;
        this.idUsuario = idUsusario;
        this.estado = estado;
    }

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    public int getIdMatricula() {
        return idMatricula;
    }

    public void setIdMatricula(int idMatricula) {
        this.idMatricula = idMatricula;
    }

    public int getIdGrado() {
        return idGrado;
    }

    public void setIdGrado(int idGrado) {
        this.idGrado = idGrado;
    }

    public int getIdApoderado() {
        return idApoderado;
    }

    public void setIdApoderado(int idApoderado) {
        this.idApoderado = idApoderado;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsusario) {
        this.idUsuario = idUsusario;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getIdEstudiante() {
        return idEstudiante;
    }

    public void setIdEstudiante(int idEstudiante) {
        this.idEstudiante = idEstudiante;
    }
    
    public void agregarMatricula(Matricula matricula) {
        try {
            String sql = "INSERT INTO Matricula (Id_Grado, Id_Apoderado, Id_Usuario, Estado, Id_Estudiante) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                statement.setInt(1, matricula.getIdGrado());
                statement.setInt(2, matricula.getIdApoderado());
                statement.setInt(3, matricula.getIdUsuario());
                statement.setString(4, matricula.getEstado());
                statement.setInt(5, matricula.getIdEstudiante());
               
                statement.executeUpdate();

                try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        matricula.setIdEstudiante(generatedKeys.getInt(1));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void actualizarMatricula(Matricula matricula) {
        try {
            String sql = "UPDATE Matricula SET Id_Grado = ?, Id_Apoderado = ?, Id_Usuario = ?, Estado = ?, Id_Estudiante = ? WHERE Id_Matricula = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, matricula.getIdGrado());
                statement.setInt(2, matricula.getIdApoderado());
                statement.setInt(3, matricula.getIdUsuario());
                statement.setString(4, matricula.getEstado());
                statement.setInt(5, matricula.getIdEstudiante());
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    
    public Matricula obtenerMatricula(int idMatricula) {
        Matricula matricula = null;
        try {
            String sql = "SELECT * FROM Matricula WHERE Id_Matricula = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, idMatricula);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        matricula = new Matricula();
                        matricula.setIdMatricula(resultSet.getInt( "Id_Matricula"));
                        matricula.setIdGrado(resultSet.getInt("Id_Grado"));
                        matricula.setIdApoderado(resultSet.getInt("Id_Apoderado"));
                        matricula.setIdUsuario(resultSet.getInt("Id_Usuario"));
                        matricula.setEstado(resultSet.getString("Estado"));
                        matricula.setIdEstudiante(resultSet.getInt("Id_Estudiante"));

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
            String sql = "SELECT * FROM Estudiante WHERE  = ?";
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
