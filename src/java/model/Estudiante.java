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
    
    private int id_Estudiante;
    private String dni;
    private String apellido_Paterno;
    private String apellido_Materno;
    private String nombres;
    private String direccion;
    private String distrito;
    private String provincia;
    private String departamento;
    private String sexo;
    private Date fecha_Nacimiento;

    public Estudiante() {
        try {
            Conexion conexion = new Conexion();
            connection = conexion.conecta();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Estudiante(Connection connection, int id_Estudiante, String dni, String apellido_Paterno, String apellido_Materno, String nombres, String direccion, String distrito, String provincia, String departamento, String sexo, Date fecha_Nacimiento) {
        this.connection = connection;
        this.id_Estudiante = id_Estudiante;
        this.dni = dni;
        this.apellido_Paterno = apellido_Paterno;
        this.apellido_Materno = apellido_Materno;
        this.nombres = nombres;
        this.direccion = direccion;
        this.distrito = distrito;
        this.provincia = provincia;
        this.departamento = departamento;
        this.sexo = sexo;
        this.fecha_Nacimiento = fecha_Nacimiento;
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

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getApellido_Paterno() {
        return apellido_Paterno;
    }

    public void setApellido_Paterno(String apellido_Paterno) {
        this.apellido_Paterno = apellido_Paterno;
    }

    public String getApellido_Materno() {
        return apellido_Materno;
    }

    public void setApellido_Materno(String apellido_Materno) {
        this.apellido_Materno = apellido_Materno;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getDistrito() {
        return distrito;
    }

    public void setDistrito(String distrito) {
        this.distrito = distrito;
    }


    // Método de validación de DNI
    public boolean esDniValido(String dni) {
        return dni != null && dni.matches("\\d{8}");
    }

    // Método de validación de ApPaterno 
    public boolean esApPaternoValido(String apPaterno) {
        return apPaterno != null && apPaterno.matches("[A-Za-zÁÉÍÓÚáéíóúñÑ ]+") && apPaterno.length() <= 20;
    }

    // Método de validación de ApMaterno 
    public boolean esApMaternoValido(String apMaterno) {
        return apMaterno != null && apMaterno.matches("[A-Za-zÁÉÍÓÚáéíóúñÑ ]+") && apMaterno.length() <= 20;
    }

    // Método de validación de Nombres 
    public boolean esNombresValido(String nombres) {
        return nombres != null && nombres.matches("[A-Za-zÁÉÍÓÚáéíóúñÑ ]+") && nombres.length() <= 50;
    }
    

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    public String getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public Date getFecha_Nacimiento() {
        return fecha_Nacimiento;
    }

    public void setFecha_Nacimiento(Date fecha_Nacimiento) {
        this.fecha_Nacimiento = fecha_Nacimiento;
    }

    


    public void agregarEstudiante(Estudiante estudiante) {
        if (!esDniValido(estudiante.getDni())) {
            throw new IllegalArgumentException("El DNI debe contener exactamente 8 dígitos.");
        }

        if (!esApPaternoValido(estudiante.getApellido_Materno())) {
            throw new IllegalArgumentException("El apellido paterno no es válido.");
        }
        if (!esApMaternoValido(estudiante.getApellido_Materno())) {
            throw new IllegalArgumentException("El apellido materno no es válido.");
        }
        if (!esNombresValido(estudiante.getNombres())) {
            throw new IllegalArgumentException("El nombre no es válido.");
        }
        
        try {
            String sql = "INSERT INTO Estudiante (dni, apellido_Paterno, apellido_Materno, nombres, direccion, distrito, provincia, departamento, sexo, fecha_Nacimiento) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                statement.setString(1, estudiante.getDni());
                statement.setString(2,estudiante.getApellido_Paterno());
                statement.setString(3,estudiante.getApellido_Materno());
                statement.setString(4, estudiante.getNombres());
                statement.setString(5, estudiante.getDireccion());
                statement.setString(6, estudiante.getDistrito());
                statement.setString(7, estudiante.getProvincia());
                statement.setString(8, estudiante.getDepartamento());
                statement.setString(9, estudiante.getSexo());
                statement.setDate(10, estudiante.getFecha_Nacimiento());
                statement.executeUpdate();

                try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        estudiante.setId_Estudiante(generatedKeys.getInt(1));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void actualizarEstudiante(Estudiante estudiante) {
        try {
            String sql = "UPDATE Estudiante SET dni = ?, apellido_Paterno = ?, apellido_Materno = ?, nombres = ?, direccion = ?, distrito = ?,provincia = ?, departamento = ?,  sexo = ?, fecha_Nacimiento = ? WHERE id_Estudiante = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, estudiante.getDni());
                statement.setString(2,estudiante.getApellido_Paterno());
                statement.setString(3,estudiante.getApellido_Materno());
                statement.setString(4, estudiante.getNombres());
                statement.setString(5, estudiante.getDireccion());
                statement.setString(6, estudiante.getDistrito());
                statement.setString(7, estudiante.getProvincia());
                statement.setString(8, estudiante.getDepartamento());
                statement.setString(9, estudiante.getSexo());
                statement.setDate(10, estudiante.getFecha_Nacimiento());
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void eliminarEstudiante(int idEstudiante) {
        try {
            String sql = "DELETE FROM Estudiante WHERE id_Estudiante = ?";
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
            String sql = "SELECT * FROM Estudiante WHERE id_Estudiante = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, idEstudiante);
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
