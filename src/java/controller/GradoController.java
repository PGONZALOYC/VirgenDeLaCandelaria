package controller;

import java.io.*;
import model.Grado;
import model.Estudiante;
import model.Apoderado;
import model.Documento;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.http.Part;

/**
 *
 * @author Patrick
 */
@WebServlet(name = "GradoController", urlPatterns = {"/GradoController"})
public class GradoController extends HttpServlet {

    private final Grado gradoDAO = new Grado();
    private final Estudiante estudianteDAO = new Estudiante();
    private final Apoderado apoderadoDAO = new Apoderado();
    private final Documento documentoDAO = new Documento();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String modulo = request.getSession().getAttribute("modulo").toString();

        if ("vacantes".equals(modulo)) {
            String accion = request.getParameter("accion");
            int pagina = Integer.parseInt(request.getParameter("page"));
            int modal = Integer.parseInt(request.getParameter("modal"));
            List<Grado> listaGrados;
            RequestDispatcher dispatcher;

            switch (accion.toLowerCase()) {
                case "listar":
                    listaGrados = gradoDAO.obtenerListaGrado();
                    request.setAttribute(("listaGrados"), listaGrados);
                    request.setAttribute("page", pagina);
                    request.setAttribute("modal", modal);
                    dispatcher = request.getRequestDispatcher("lista-vacantes.jsp");
                    dispatcher.forward(request, response);
                    break;

            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String modulo = request.getSession().getAttribute("modulo").toString();
        int modal = Integer.parseInt(request.getParameter("modal"));

        if ("vacantes".equals(modulo)) {
            String accion = request.getParameter("accion");
            int pagina = Integer.parseInt(request.getParameter("page"));
            switch (accion.toLowerCase()) {
                case "listar":
                    String dniEstudiante = request.getParameter("dniEstudiante");
                    List<Grado> lista = gradoDAO.obtenerListaGrado();
                    Estudiante estudiante = estudianteDAO.obtenerEstudiantePorDni(dniEstudiante);
                    List<Apoderado> listaApoRel = apoderadoDAO.obtenerListaApoderadoRelacionados(estudiante.getId_Estudiante());
                    request.setAttribute("listaApoRel", listaApoRel);
                    request.setAttribute("listaGrados", lista);
                    request.setAttribute("page", pagina);
                    request.setAttribute("modal", modal);
                    request.setAttribute("estudianteEncontrado", estudiante);

                    RequestDispatcher dispatcherBuscar = request.getRequestDispatcher("lista-vacantes.jsp");
                    dispatcherBuscar.forward(request, response);
                    break;
                case "buscar":
                    String nivel = request.getParameter("nivelbuscar");
                    String grado = request.getParameter("gradobuscar");
                    Grado encontrado = gradoDAO.obtenerGradoporFiltro(nivel, grado);
                    List<Grado> listabusqueda = new ArrayList<>();
                    if (encontrado != null) {
                        listabusqueda.add(encontrado);
                    } else if (nivel.equals("") && grado.equals((""))) {
                        listabusqueda = gradoDAO.obtenerListaGrado();
                    }
                    request.setAttribute(("listagrados"), listabusqueda);
                    request.setAttribute("page", pagina);
                    request.setAttribute("modal", modal);
                    dispatcherBuscar = request.getRequestDispatcher("lista-vacantes.jsp");
                    dispatcherBuscar.forward(request, response);
                    break;
                case "matricular":
                    String dniEstudiante1 = request.getParameter("dniEstudiante");
                    
                    Part fileLibreta = request.getPart("libretaNotas");
                    InputStream contentLibreta = fileLibreta.getInputStream();

                    Part fileCertificado = request.getPart("certificadoEstudios");
                    InputStream contentCertificado = fileCertificado.getInputStream();

                    Part fileDniApod = request.getPart("dniApoderado");
                    InputStream contentDniApod = fileDniApod.getInputStream();

                    Part fileDniEst = request.getPart("dniEstudiante");
                    InputStream contentDniEst = fileDniEst.getInputStream();

                    Part filePartida = request.getPart("partidaNacimiento");
                    InputStream contentPartida = filePartida.getInputStream();
                    
                    Documento docLibreta = new Documento(1, fileLibreta, contentLibreta, fileLibreta.getContentType());
                    Documento docCertificado = new Documento(1, fileCertificado, contentCertificado, fileLibreta.getContentType());
                    Documento docDniApod = new Documento(1, fileDniApod, contentDniApod, fileLibreta.getContentType());
                    Documento docDniEst = new Documento(1, fileDniEst, contentDniEst, fileLibreta.getContentType());
                    Documento docPartida = new Documento(1, filePartida, contentPartida, fileLibreta.getContentType());
                    
                    documentoDAO.agregarDocumento(docLibreta);
                    documentoDAO.agregarDocumento(docCertificado);
                    documentoDAO.agregarDocumento(docDniApod);
                    documentoDAO.agregarDocumento(docDniEst);
                    documentoDAO.agregarDocumento(docPartida);
                    
                    dispatcherBuscar = request.getRequestDispatcher("lista-matriculas.jsp");
                    dispatcherBuscar.forward(request, response);             
                    break;
                default:
                    System.out.println("Accion no encontrada");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
