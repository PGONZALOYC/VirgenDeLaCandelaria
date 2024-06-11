package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "NavController", urlPatterns = {"/NavController"})
public class NavController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener el módulo de la barra lateral
        String modulo = request.getParameter("modulo");

        if (null == modulo) {
            // Manejar otros módulos si es necesario
            // ...
        } else 
           
            switch (modulo) {
                case "menu_principal":
                    request.getSession().setAttribute("modulo", "menu_principal");
                    response.sendRedirect("menu-principal.jsp");
                    break;
                case "vacantes":
                    request.getSession().setAttribute("modulo", "vacantes");
                    response.sendRedirect("GradoController?accion=listar&page=1&modal=0");
                    break;
                case "estudiantes":
                    request.getSession().setAttribute("modulo", "estudiantes");
                    response.sendRedirect("EstudianteController?accion=listar&page=1");
                    break;
                case "matriculas":
                    request.getSession().setAttribute("modulo", "matriculas");
                    response.sendRedirect("lista-matriculas.jsp");
                    break;
                case "pagos":
                    request.getSession().setAttribute("modulo", "pagos");
                    response.sendRedirect("lista-pagos.jsp");
                    break;
                case "utiles":
                    request.getSession().setAttribute("modulo", "utiles");
                    response.sendRedirect("ProduController?accion=listar");
                    break;
                case "reportes":
                    request.getSession().setAttribute("modulo", "reportes");
                    response.sendRedirect("EmpleController?accion=listar");
                    break;
                case "logout":
                    request.getSession().setAttribute("modulo", "logout");
                    response.sendRedirect("index.jsp");
                    break;
                default:

                    break;
            }
        }
    

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
