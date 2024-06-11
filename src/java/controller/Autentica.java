/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Usuario;

import java.io.InputStream;
import java.net.URL;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URLEncoder;

@WebServlet(name = "Autentica", urlPatterns = {"/Autentica"})
public class Autentica extends HttpServlet {

    private static final String SECRET_KEY = "6Lelo-gpAAAAABv2k47-2hVjnd4VMzIkpU62Dnil";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
        boolean verificado = verificarRecaptcha(gRecaptchaResponse);

        Usuario user = new Usuario();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        try {
            int log = user.autoriza(email, password);
            if (log == 1) {
                if (verificado) {
                    request.getSession().setAttribute("usuario_email", email);
                    // cli.create("soluciones", "web123", "UPN", "El sol 461", 999888777);
                    request.getSession().setAttribute("modulo", "menu_principal");
                    request.getRequestDispatcher("menu-principal.jsp").forward(request, response);
                } else {
                    request.setAttribute("captcha_incorrecto", true);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }

            } else {
                if (verificado) {
                    request.setAttribute("credenciales_incorrectas", true);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    request.setAttribute("credenciales_incorrectas", true);
                    request.setAttribute("captcha_incorrecto", true);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }

            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Autentica.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private boolean verificarRecaptcha(String gRecaptchaResponse) {
        try {
            String url = "https://www.google.com/recaptcha/api/siteverify";
            String params = "secret=" + SECRET_KEY + "&response=" + URLEncoder.encode(gRecaptchaResponse, "UTF-8");

            // Crear conexión HTTP
            HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setRequestMethod("POST");
            connection.setDoOutput(true);

            // Escribir datos al servidor
            DataOutputStream wr = new DataOutputStream(connection.getOutputStream());
            wr.writeBytes(params);
            wr.flush();
            wr.close();

            // Leer respuesta del servidor
            InputStream is = connection.getInputStream();
            BufferedReader rd = new BufferedReader(new InputStreamReader(is));
            StringBuilder responseBuilder = new StringBuilder();
            String line;
            while ((line = rd.readLine()) != null) {
                responseBuilder.append(line);
            }
            rd.close();

            // Verificar respuesta del servidor
            String responseBody = responseBuilder.toString();
            return responseBody.contains("\"success\": true");
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
