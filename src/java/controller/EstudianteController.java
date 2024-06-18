package controller;

import model.Estudiante;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "EstudianteController", urlPatterns = {"/EstudianteController"})
public class EstudianteController extends HttpServlet {

    private final Estudiante estudianteDAO = new Estudiante();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String modulo = request.getSession().getAttribute("modulo").toString();

        if ("estudiantes".equals(modulo)) {
            String accion = request.getParameter("accion");
            int pagina = Integer.parseInt(request.getParameter("page"));
            List<Estudiante> listaEstudiantes;
            RequestDispatcher dispatcher;

            switch (accion.toLowerCase()) {
                case "listar":
                    listaEstudiantes = estudianteDAO.obtenerListaEstudiantes();
                    request.setAttribute("listaEstudiantes", listaEstudiantes);
                    request.setAttribute("page", pagina);
                    dispatcher = request.getRequestDispatcher("lista-estudiantes.jsp");
                    dispatcher.forward(request, response);
                    break;

                case "eliminar":
                    String idEstudiante = request.getParameter("id");
                    estudianteDAO.eliminarEstudiante(Integer.parseInt(idEstudiante));
                    listaEstudiantes = estudianteDAO.obtenerListaEstudiantes();
                    request.setAttribute("listaEstudiantes", listaEstudiantes);
                    request.setAttribute("page", pagina);
                    dispatcher = request.getRequestDispatcher("lista-estudiantes.jsp");
                    dispatcher.forward(request, response);
                    break;
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String modulo = request.getSession().getAttribute("modulo").toString();

        if ("estudiantes".equals(modulo)) {
            String accion = request.getParameter("accion");
            int pagina = Integer.parseInt(request.getParameter("page"));
            switch (accion.toLowerCase()) {
                case "agregar":
                    Estudiante estudianteNuevo = new Estudiante();

                    /*String dni = request.getParameter("a_DNI");
                    String apPaterno = request.getParameter("a_ape-paterno");
                    String apMaterno = request.getParameter("a_ape-materno");
                    String nombres = request.getParameter("a_nombres");
                    String direccion = request.getParameter("a_direccion");
                    String departamento = request.getParameter("a_departamento");
                    String distrito = request.getParameter("a_distrito");
                    String genero = "";
                    if (request.getParameter("a_genero").equals("1")) {
                        genero = "Masculino";
                    } else if (request.getParameter("a_genero").equals("2")) {
                        genero = "Femenino";
                    }
                    String fechaNac = request.getParameter("a_birthdate");*/
                    String dni =request.getParameter("a_DNI");
                    String apellido_Paterno =request.getParameter("a_ape_paterno");
                    String apellido_Materno =request.getParameter("a_ape_materno");
                    String nombres =request.getParameter("a_nombres");
                    String direccion = request.getParameter("a_direccion");
                    String departamento = request.getParameter("a_departamento");
                    String provincia = request.getParameter("a_provincia");
                    String sexo = "";
                    if (request.getParameter("a_genero").equals("1")) {
                        sexo = "Masculino";
                    } else if (request.getParameter("a_genero").equals("2")) {
                        sexo = "Femenino";
                    }
                    String distrito = request.getParameter("a_distrito");
                    String fecha_Nacimiento_string =request.getParameter("a_birthdate");
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                    Date fecha_Nacimiento = null;
                    try {
                        fecha_Nacimiento = (Date) formatter.parse(fecha_Nacimiento_string);
                    } catch (ParseException ex) {
                        Logger.getLogger(ApoderadoController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    
                    estudianteNuevo.setDni(dni);
                    estudianteNuevo.setApellido_Paterno(apellido_Paterno);
                    estudianteNuevo.setApellido_Materno(apellido_Materno);
                    estudianteNuevo.setNombres(nombres);
                    estudianteNuevo.setDireccion(direccion);
                    estudianteNuevo.setDepartamento(departamento);
                    estudianteNuevo.setProvincia(provincia);
                    estudianteNuevo.setSexo(sexo);
                    estudianteNuevo.setDistrito(distrito);
                    estudianteNuevo.setFecha_Nacimiento(fecha_Nacimiento);

                    /*estudianteNuevo.setDni(dni);
                    estudianteNuevo.setApPaterno(apPaterno);
                    estudianteNuevo.setApMaterno(apMaterno);
                    estudianteNuevo.setNombres(nombres);
                    estudianteNuevo.setDireccion(direccion);
                    estudianteNuevo.setDepartamento(departamento);
                    estudianteNuevo.setDistrito(distrito);
                    estudianteNuevo.setGenero(genero);
                    estudianteNuevo.setFecha_Nac(fechaNac);*/

                    estudianteDAO.agregarEstudiante(estudianteNuevo);

                    List<Estudiante> listaEstudiantes = estudianteDAO.obtenerListaEstudiantes();

                    request.setAttribute("listaEstudiantes", listaEstudiantes);
                    request.setAttribute("page", pagina);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("lista-estudiantes.jsp");
                    dispatcher.forward(request, response);
                    break;

                case "actualizar":
                    Estudiante estudianteActualizar = new Estudiante();

                    /*String idEstudiante = request.getParameter("e_idEditar");
                    dni = request.getParameter("e_DNI");
                    apPaterno = request.getParameter("e_ape-paterno");
                    apMaterno = request.getParameter("e_ape-materno");
                    nombres = request.getParameter("e_nombres");
                    direccion = request.getParameter("e_direccion");
                    departamento = request.getParameter("e_departamento");
                    distrito = request.getParameter("e_distrito");
                    if (request.getParameter("e_genero").equals("1")) {
                        genero = "Masculino";
                    } else if (request.getParameter("e_genero").equals("2")) {
                        genero = "Femenino";
                    } else {
                        genero = estudianteActualizar.obtenerEstudiante(Integer.parseInt(idEstudiante)).getGenero();
                    }

                    fechaNac = request.getParameter("e_birthdate");*/
                    
                    String idEstudiante =request.getParameter("e_idEditar");
                    dni =request.getParameter("a_DNI");
                    apellido_Paterno =request.getParameter("a_ape_paterno");
                    apellido_Materno =request.getParameter("a_ape_materno");
                    nombres =request.getParameter("a_nombres");
                    direccion = request.getParameter("a_direccion");
                    departamento = request.getParameter("a_departamento");
                    provincia = request.getParameter("a_provincia");
                    sexo = "";
                    if (request.getParameter("a_genero").equals("1")) {
                        sexo = "Masculino";
                    } else if (request.getParameter("a_genero").equals("2")) {
                        sexo = "Femenino";
                    }
                    distrito = request.getParameter("a_distrito");
                    fecha_Nacimiento_string =request.getParameter("a_birthdate");
                    SimpleDateFormat formatter01 = new SimpleDateFormat("yyyy-MM-dd");
                    fecha_Nacimiento = null;
                    try {
                        fecha_Nacimiento = (Date) formatter01.parse(fecha_Nacimiento_string);
                    } catch (ParseException ex) {
                        Logger.getLogger(ApoderadoController.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    /*estudianteActualizar.setIdEstudiante(Integer.parseInt(idEstudiante));
                    estudianteActualizar.setDni(dni);
                    estudianteActualizar.setApPaterno(apPaterno);
                    estudianteActualizar.setApMaterno(apMaterno);
                    estudianteActualizar.setNombres(nombres);
                    estudianteActualizar.setDireccion(direccion);
                    estudianteActualizar.setDepartamento(departamento);
                    estudianteActualizar.setDistrito(distrito);
                    estudianteActualizar.setGenero(genero);
                    estudianteActualizar.setFecha_Nac(fechaNac);*/
                    estudianteActualizar.setId_Estudiante(Integer.parseInt(idEstudiante));
                    estudianteActualizar.setApellido_Paterno(apellido_Paterno);
                    estudianteActualizar.setApellido_Materno(apellido_Materno);
                    estudianteActualizar.setNombres(nombres);
                    estudianteActualizar.setDireccion(direccion);
                    estudianteActualizar.setDepartamento(departamento);
                    estudianteActualizar.setProvincia(provincia);
                    estudianteActualizar.setSexo(sexo);
                    estudianteActualizar.setDistrito(distrito);
                    estudianteActualizar.setFecha_Nacimiento(fecha_Nacimiento);

                    estudianteDAO.actualizarEstudiante(estudianteActualizar);

                    List<Estudiante> listaEstudiantesActualizar = estudianteDAO.obtenerListaEstudiantes();
                    request.setAttribute("listaEstudiantes", listaEstudiantesActualizar);
                    request.setAttribute("page", pagina);
                    RequestDispatcher dispatcherActualizar = request.getRequestDispatcher("lista-estudiantes.jsp");
                    dispatcherActualizar.forward(request, response);
                    break;

                case "listar":
                    List<Estudiante> lista = estudianteDAO.obtenerListaEstudiantes();
                    // Puedes agregar mensajes de error o redirigir a una página de error
                    request.setAttribute("listaEstudiantes", lista);
                    request.setAttribute("page", pagina);
                    break;

                case "buscar": 
                    String dniBuscado = request.getParameter("dniBuscado");
                    Estudiante encontrado = estudianteDAO.obtenerEstudiantePorDni(dniBuscado);
                    List<Estudiante> listaBusqueda = new ArrayList<>();
                    if (encontrado != null ) {
                        listaBusqueda.add(encontrado);
                    } else if (dniBuscado.equals("") ){
                        listaBusqueda = estudianteDAO.obtenerListaEstudiantes();
                    }
                    
                    request.setAttribute("listaEstudiantes", listaBusqueda);
                    request.setAttribute("page", pagina);
                    RequestDispatcher dispatcherBuscar = request.getRequestDispatcher("lista-estudiantes.jsp");
                    dispatcherBuscar.forward(request, response);
                    break;

                case "eliminar":
                    idEstudiante = request.getParameter("id");
                    estudianteDAO.eliminarEstudiante(Integer.parseInt(idEstudiante));
                    List<Estudiante> listaEstudiantesEliminar = estudianteDAO.obtenerListaEstudiantes();
                    request.setAttribute("listaEstudiantes", listaEstudiantesEliminar);
                    request.setAttribute("page", pagina);
                    RequestDispatcher dispatcherEliminar = request.getRequestDispatcher("lista-estudiantes.jsp");
                    dispatcherEliminar.forward(request, response);
                    break;

                default:
                    System.out.println("Acción no reconocida");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
