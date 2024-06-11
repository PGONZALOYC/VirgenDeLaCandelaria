/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import utilidades.Conexion;

/**
 *
 * @author salaz
 */
public class Usuario {
    private Connection connection;
    
    private String Id_Usuario;
    private String correo;
    private String contraseña;

    public Usuario() {
        try {
            Conexion conexion = new Conexion();
            connection = conexion.conecta();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Usuario(String Id_Usuario, String correo, String contraseña) {
        this.Id_Usuario = Id_Usuario;
        this.correo = correo;
        this.contraseña = contraseña;
    }

    public String getId_Usuario() {
        return Id_Usuario;
    }

    public void setId_Usuario(String Id_Usuario) {
        this.Id_Usuario = Id_Usuario;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public int autoriza(String usr, String psw) throws ClassNotFoundException {
        int logueado;
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            int cont = 0;
            String query = "select * from usuario ";
            query += "where Correo='" + usr + "' and ";
            query += "Contraseña='" + psw + "'";
            Statement sentencia = cnx.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            while (resultado.next()) {
                cont++;
            }
            if (cont != 0) {
                logueado = 1;
            } else {
                logueado = 0;
            }
            return logueado;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return -666;
    }

    public Usuario obtenerUsuario(String email, String psw) {
        Usuario usuario = null;
        try {
            String sql = "select * from usuario where Correo = ? and Contraseña = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, email);
                statement.setString(2, psw);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        usuario = new Usuario();
                        usuario.setId_Usuario(resultSet.getString("idUsuario"));
                        usuario.setCorreo(resultSet.getString("Correo"));
                        usuario.setContraseña(resultSet.getString("Contraseña"));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }
    
    public int existeCorreo(String correo) throws ClassNotFoundException {
        int logueado;
        try {
            Conexion c = new Conexion();
            Connection cnx = c.conecta();
            int cont = 0;
            String query = "select * from usuario ";
            query += "where Correo='" + correo + "'";
            Statement sentencia = cnx.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            while (resultado.next()) {
                cont++;
            }
            if (cont != 0) {
                logueado = 1;
            } else {
                logueado = 0;
            }
            return logueado;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return -666;
    }
    
    public Usuario obtenerUsuarioPorCorreo(String email) {
        Usuario usuario = null;
        try {
            String sql = "select * from usuario where Correo = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, email);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        usuario = new Usuario();
                        usuario.setId_Usuario(resultSet.getString("idUsuario"));
                        usuario.setCorreo(resultSet.getString("Correo"));
                        usuario.setContraseña(resultSet.getString("Contraseña"));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }

}
