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
    
    private int id_Apoderado;
    private String dni;
    private String apellido_Paterno;
    private String apellido_Materno;
    private String nombres;
    private String vive;
    private String grado_Instruccion;
    private String ocupado;
    private String telefono;
    private String direccion;
    private String distrito;
    private String provincia;
    private String departamento;
    private String sexo;
    private Date fecha_Nacimiento;
    
    public Apoderado() {
        try {
            Conexion conexion = new Conexion();
            connection = conexion.conecta();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Apoderado(Connection connection, int id_Apoderado, String dni, String apellido_Paterno, String apellido_Materno, String nombres, String vive, String grado_Instruccion, String ocupado, String telefono, String direccion, String distrito, String provincia, String departamento, String sexo, Date fecha_Nacimiento) {
        this.connection = connection;
        this.id_Apoderado = id_Apoderado;
        this.dni = dni;
        this.apellido_Paterno = apellido_Paterno;
        this.apellido_Materno = apellido_Materno;
        this.nombres = nombres;
        this.vive = vive;
        this.grado_Instruccion = grado_Instruccion;
        this.ocupado = ocupado;
        this.telefono = telefono;
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

    public int getId_Apoderado() {
        return id_Apoderado;
    }

    public void setId_Apoderado(int id_Apoderado) {
        this.id_Apoderado = id_Apoderado;
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

    public String getVive() {
        return vive;
    }

    public void setVive(String vive) {
        this.vive = vive;
    }

    public String getGrado_Instruccion() {
        return grado_Instruccion;
    }

    public void setGrado_Instruccion(String grado_Instruccion) {
        this.grado_Instruccion = grado_Instruccion;
    }

    public String getOcupado() {
        return ocupado;
    }

    public void setOcupado(String ocupado) {
        this.ocupado = ocupado;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
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

    
    // Método de validación de DNI
    public boolean esDniValido(String dni) {
        return dni!= null && dni.matches("\\d{8}");
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
    
    



    public void agregarApoderado(Apoderado apoderado){
        if (!esDniValido(apoderado.getDni())) {
            throw new IllegalArgumentException("El DNI debe contener exactamente 8 dígitos.");
        }
        
        if (!esApPaternoValido(apoderado.getApellido_Materno())) {
            throw new IllegalArgumentException("El apellido paterno no es válido.");
        }
        if (!esApMaternoValido(apoderado.getApellido_Materno())) {
            throw new IllegalArgumentException("El apellido materno no es válido.");
        }
        if (!esNombresValido(apoderado.getNombres())) {
            throw new IllegalArgumentException("El nombre no es válido.");
        }
        
        try{
            String sql= "INSERT INTO Apoderado (dni,apellido_Paterno,apellido_Materno,nombres,vive,grado_Instruccion,ocupacion,telefono,direccion,distrito,provincia,departamento,sexo,fecha_Nacimiento) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            try(PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)){
                statement.setString(1, apoderado.getDni());
                statement.setString(2, apoderado.getApellido_Paterno());
                statement.setString(3, apoderado.getApellido_Materno());
                statement.setString(4, apoderado.getNombres());
                statement.setString(5, apoderado.getVive());
                statement.setString(6, apoderado.getGrado_Instruccion());
                statement.setString(7, apoderado.getOcupado());
                statement.setString(8, apoderado.getTelefono());
                statement.setString(9, apoderado.getDireccion());
                statement.setString(10, apoderado.getDistrito());
                statement.setString(11, apoderado.getProvincia());
                statement.setString(12, apoderado.getDepartamento());
                statement.setString(13, apoderado.getSexo());
                statement.setDate(14, apoderado.getFecha_Nacimiento());
                statement.executeUpdate();
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public void actualizarApoderado(Apoderado apoderado){
        try{
            String sql = "UPDATE Apoderado SET dni = ?, apellido_Paterno = ?, apellido_Materno = ?, nombres = ?, vive = ?, grado_Instruccion = ?, ocupacion = ?, telefono = ?, direccion = ?, distrito = ?, provincia = ?, departamento = ?, sexo = ?, fecha_Nacimiento = ?  WHERE Id_apoderado = ? ";
            try(PreparedStatement statement = connection.prepareStatement(sql)){ 
                statement.setString(1, apoderado.getDni());
                statement.setString(2, apoderado.getApellido_Paterno());
                statement.setString(3, apoderado.getApellido_Materno());
                statement.setString(4, apoderado.getNombres());
                statement.setString(5, apoderado.getVive());
                statement.setString(6, apoderado.getGrado_Instruccion());
                statement.setString(7, apoderado.getOcupado());
                statement.setString(8, apoderado.getTelefono());
                statement.setString(9, apoderado.getDireccion());
                statement.setString(10, apoderado.getDistrito());
                statement.setString(11, apoderado.getProvincia());
                statement.setString(12, apoderado.getDepartamento());
                statement.setString(13, apoderado.getSexo());
                statement.setDate(14, apoderado.getFecha_Nacimiento());
                statement.setInt(15,apoderado.getId_Apoderado());
                statement.executeUpdate();
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public void eliminarApoderado(int idApoderado){
        try {
            String sql="DELETE FROM Apoderado WHERE Id_apoderado=?";
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
                        apoderado.setId_Apoderado(resultSet.getInt("id_Apoderado"));
                        apoderado.setDni(resultSet.getString("dni"));
                        apoderado.setApellido_Paterno(resultSet.getString("apellido_Paterno"));
                        apoderado.setApellido_Materno(resultSet.getString("apellido_Materno"));
                        apoderado.setNombres(resultSet.getString("nombres"));
                        apoderado.setVive(resultSet.getString("vive"));
                        apoderado.setGrado_Instruccion(resultSet.getString("grado_Instruccion"));
                        apoderado.setOcupado(resultSet.getString("ocupacion"));
                        apoderado.setTelefono(resultSet.getString("telefono"));
                        apoderado.setDireccion(resultSet.getString("direccion"));
                        apoderado.setDistrito(resultSet.getString("distrito"));
                        apoderado.setProvincia(resultSet.getString("provincia"));
                        apoderado.setDepartamento(resultSet.getString("departamento"));
                        apoderado.setSexo(resultSet.getString("sexo"));
                        apoderado.setFecha_Nacimiento(resultSet.getDate("fecha_Nacimiento"));
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
                    apoderado.setId_Apoderado(resultSet.getInt("id_Apoderado"));
                        apoderado.setDni(resultSet.getString("dni"));
                        apoderado.setApellido_Paterno(resultSet.getString("apellido_Paterno"));
                        apoderado.setApellido_Materno(resultSet.getString("apellido_Materno"));
                        apoderado.setNombres(resultSet.getString("nombres"));
                        apoderado.setVive(resultSet.getString("vive"));
                        apoderado.setGrado_Instruccion(resultSet.getString("grado_Instruccion"));
                        apoderado.setOcupado(resultSet.getString("ocupacion"));
                        apoderado.setTelefono(resultSet.getString("telefono"));
                        apoderado.setDireccion(resultSet.getString("direccion"));
                        apoderado.setDistrito(resultSet.getString("distrito"));
                        apoderado.setProvincia(resultSet.getString("provincia"));
                        apoderado.setDepartamento(resultSet.getString("departamento"));
                        apoderado.setSexo(resultSet.getString("sexo"));
                        apoderado.setFecha_Nacimiento(resultSet.getDate("fecha_Nacimiento"));
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
                    apoderado.setId_Apoderado(resultSet.getInt("id_Apoderado"));
                    apoderado.setDni(resultSet.getString("dni"));
                    apoderado.setApellido_Paterno(resultSet.getString("apellido_Paterno"));
                    apoderado.setApellido_Materno(resultSet.getString("apellido_Materno"));
                    apoderado.setNombres(resultSet.getString("nombres"));
                    apoderado.setVive(resultSet.getString("vive"));
                    apoderado.setGrado_Instruccion(resultSet.getString("grado_Instruccion"));
                    apoderado.setOcupado(resultSet.getString("ocupacion"));
                    apoderado.setTelefono(resultSet.getString("telefono"));
                    apoderado.setDireccion(resultSet.getString("direccion"));
                    apoderado.setDistrito(resultSet.getString("distrito"));
                    apoderado.setProvincia(resultSet.getString("provincia"));
                    apoderado.setDepartamento(resultSet.getString("departamento"));
                    apoderado.setSexo(resultSet.getString("sexo"));
                    apoderado.setFecha_Nacimiento(resultSet.getDate("fecha_Nacimiento"));
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
            String sql = "SELECT Apoderado.id_apoderado, Apoderado.dni, Apoderado.apellido_Paterno, Apoderado.apellido_Materno, Apoderado.nombres, Relacion.vinculo FROM Apoderado \n" +
                         "INNER JOIN Relacion ON Relacion.id_apoderado = Apoderado.id_apoderado\n" +
                         "WHERE Relacion.Id_Estudiante = ?";
            try(PreparedStatement statement = connection.prepareStatement(sql)){
                statement.setInt(1, idEstudiante);
                try(ResultSet resultSet = statement.executeQuery()){
                    if(resultSet.next()){
                        Apoderado apoderado=new Apoderado();
                        apoderado.setId_Apoderado(resultSet.getInt("id_Apoderado"));
                        apoderado.setDni(resultSet.getString("dni"));
                        apoderado.setApellido_Paterno(resultSet.getString("apellido_Paterno"));
                        apoderado.setApellido_Materno(resultSet.getString("apellido_Materno"));
                        apoderado.setNombres(resultSet.getString("nombres"));
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
