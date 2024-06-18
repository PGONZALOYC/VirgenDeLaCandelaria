/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import utilidades.Conexion;
import java.sql.*;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.http.Part;
/**
 *
 * @author salaz
 */
public class Documento {
    
    private Connection connection;
    
    private int idDocumento;
    private int idMatricula;
    private Part filePart;
    private InputStream fileContent;
    private String tipo_doc;

    public Documento() {
    }

    public Documento(int idMatricula, Part filePart, InputStream fileContent, String tipo_doc) {
        this.idMatricula = idMatricula;
        this.filePart = filePart;
        this.fileContent = fileContent;
        this.tipo_doc = tipo_doc;
    }

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    public int getIdDocumento() {
        return idDocumento;
    }

    public void setIdDocumento(int idDocumento) {
        this.idDocumento = idDocumento;
    }

    public int getIdMatricula() {
        return idMatricula;
    }

    public void setIdMatricula(int idMatricula) {
        this.idMatricula = idMatricula;
    }

    public InputStream getFileContent() {
        return fileContent;
    }

    public void setFileContent(InputStream fileContent) {
        this.fileContent = fileContent;
    }

    public String getTipo_doc() {
        return tipo_doc;
    }

    public void setTipo_doc(String tipo_doc) {
        this.tipo_doc = tipo_doc;
    }

    public Part getFilePart() {
        return filePart;
    }

    public void setFilePart(Part filePart) {
        this.filePart = filePart;
    }
    
    
    
    
    public void agregarDocumento(Documento documento){
        try {
            String sql = "INSERT INTO Documento (Id_Matricula, Contenido, Tipo_Doc) VALUES (?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                statement.setInt(1, documento.getIdMatricula());
                statement.setBinaryStream(2, documento.fileContent, (int) documento.filePart.getSize());
                statement.setString(3, documento.getTipo_doc());
               
                statement.executeUpdate();

                try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        documento.setIdDocumento(generatedKeys.getInt(1));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
}
