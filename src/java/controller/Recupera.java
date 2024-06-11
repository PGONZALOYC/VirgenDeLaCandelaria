/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "Recupera", urlPatterns = {"/Recupera"})
public class Recupera extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Usuario user = new Usuario();

        String email = request.getParameter("email");

        try {
            int log = user.existeCorreo(email);
            if (log == 1) {
                request.setAttribute("existe", true);
                
                request.setAttribute("correo", (user.obtenerUsuario(email, "abc123$")).getCorreo());
                request.setAttribute("contraseña", user.obtenerUsuario(email, "abc123$").getContraseña());
                request.getRequestDispatcher("recuperacion-contraseña.jsp").forward(request, response);

            } else {
                request.setAttribute("no_existe", true);
                request.getRequestDispatcher("recuperacion-contraseña.jsp").forward(request, response);

            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Recupera.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
