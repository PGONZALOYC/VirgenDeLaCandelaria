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
            String sql = "INSERT INTO matricula (id_Grado, id_Apoderado, id_Usuario, estado, id_Estudiante) VALUES (?, ?, ?, ?, ?)";
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
            String sql = "UPDATE matricula SET id_Grado = ?, id_Apoderado = ?, id_Usuario = ?, estado = ?, id_Estudiante = ? WHERE id_Matricula = ?";
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
            String sql = "SELECT * FROM matricula WHERE id_Matricula = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, idMatricula);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        matricula = new Matricula();
                        matricula.setIdMatricula(resultSet.getInt( "id_Matricula"));
                        matricula.setIdGrado(resultSet.getInt("id_Grado"));
                        matricula.setIdApoderado(resultSet.getInt("id_Apoderado"));
                        matricula.setIdUsuario(resultSet.getInt("id_Usuario"));
                        matricula.setEstado(resultSet.getString("estado"));
                        matricula.setIdEstudiante(resultSet.getInt("id_Estudiante"));

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
            String sql = "SELECT * FROM estudiante WHERE  = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, dni);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        estudiante = new Estudiante();
                        estudiante.setIdEstudiante(resultSet.getInt("id_Estudiante"));
                        estudiante.setDni(resultSet.getString("dni"));
                        estudiante.setApPaterno(resultSet.getString("apellido_Paterno"));
                        estudiante.setApMaterno(resultSet.getString("apellido_Materno"));
                        estudiante.setNombres(resultSet.getString("nombres"));
                        estudiante.setDireccion(resultSet.getString("direccion"));
                        estudiante.setDepartamento(resultSet.getString("departamento"));
                        estudiante.setDistrito(resultSet.getString("distrito"));
                        estudiante.setNombres(resultSet.getString("nombres"));
                        estudiante.setSexo(resultSet.getString("sexo"));
                        estudiante.setFecha_Nac(resultSet.getString("fecha_Nacimiento"));
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
            String sql = "SELECT * FROM estudiante";
            try (Statement statement = connection.createStatement(); ResultSet resultSet = statement.executeQuery(sql)) {
                while (resultSet.next()) {
                    Estudiante estudiante = new Estudiante();
                   estudiante.setIdEstudiante(resultSet.getInt("id_Estudiante"));
                        estudiante.setDni(resultSet.getString("dni"));
                        estudiante.setApPaterno(resultSet.getString("apellido_Paterno"));
                        estudiante.setApMaterno(resultSet.getString("apellido_Materno"));
                        estudiante.setNombres(resultSet.getString("nombres"));
                        estudiante.setDireccion(resultSet.getString("direccion"));
                        estudiante.setDepartamento(resultSet.getString("departamento"));
                        estudiante.setDistrito(resultSet.getString("distrito"));
                        estudiante.setNombres(resultSet.getString("nombres"));
                        estudiante.setSexo(resultSet.getString("sexo"));
                        estudiante.setFecha_Nac(resultSet.getString("fecha_Nacimiento"));
                    estudiantes.add(estudiante);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return estudiantes;
    }
}