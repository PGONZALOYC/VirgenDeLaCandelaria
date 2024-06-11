/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import model.Apoderado;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "ApoderadoController", urlPatterns = {"/ApoderadoController"})
public class ApoderadoController extends HttpServlet {

    private final Apoderado apoderadoDAO=new Apoderado();
        
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String modulo =request.getSession().getAttribute("modulo").toString();
        
        if("estudiantes".equals(modulo)){
            String accion = request.getParameter("accion");
            int pagina = Integer.parseInt(request.getParameter("page"));
            List<Apoderado> listaApoderados;
            RequestDispatcher dispatcher;
            
            switch (accion.toLowerCase()) {
                case "listar":
                    listaApoderados=apoderadoDAO.obtenerListaApoderado();
                    request.setAttribute("listaApoderados", listaApoderados);
                    request.setAttribute("page", pagina);
                    dispatcher =request.getRequestDispatcher("lista-apoderados.jsp");
                    dispatcher.forward(request, response);
                    break;

                case "eliminar":
                    String idApoderado=request.getParameter("id");
                    apoderadoDAO.eliminarApoderado(Integer.parseInt((idApoderado)));
                    listaApoderados=apoderadoDAO.obtenerListaApoderado();
                    request.setAttribute("listaApoderados", listaApoderados);
                    request.setAttribute("page", pagina);
                    dispatcher = request.getRequestDispatcher("lista-apoderados.jsp");
                    dispatcher.forward(request, response);
                    break;
            }
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String modulo = request.getSession().getAttribute("modulo").toString();
        
        if("estudiantes".equals(modulo)){
            String accion = request.getParameter("accion");
            int pagina = Integer.parseInt(request.getParameter("page"));
            switch (accion.toLowerCase()) {
                case "agregar":
                    Apoderado apoderadoNuevo =new Apoderado();
                    
                    String dni =request.getParameter("a_DNI");
                    String estadoVida =request.getParameter("a_estado-vida");
                    String gradoInstruccion =request.getParameter("a_grado-instruccion");
                    String ocupacion =request.getParameter("a_ocupacion");
                    String telefono=request.getParameter("a_telefono");
                    String apPaterno=request.getParameter("a_ape-paterno");
                    String apMaterno=request.getParameter("a_ape-materno");
                    String direccion = request.getParameter("a_direccion");
                    String distrito = request.getParameter("a_distrito");
                    String departamento = request.getParameter("a_departamento");
                    String genero = "";
                    if (request.getParameter("a_genero").equals("1")) {
                        genero = "Masculino";
                    } else if (request.getParameter("a_genero").equals("2")) {
                        genero = "Femenino";
                    }
                    String fechaNac = request.getParameter("a_birthdate");
                    
                    apoderadoNuevo.setDni(dni);
                    apoderadoNuevo.setEstadoVida(estadoVida);
                    apoderadoNuevo.setGradoInstruccion(gradoInstruccion);
                    apoderadoNuevo.setOcupacion(ocupacion);
                    apoderadoNuevo.setTelefono(telefono);
                    apoderadoNuevo.setApPaterno(apPaterno);
                    apoderadoNuevo.setApMaterno(apMaterno);
                    apoderadoNuevo.setDireccion(direccion);
                    apoderadoNuevo.setDistrito(distrito);
                    apoderadoNuevo.setDepartamento(departamento);
                    apoderadoNuevo.setGenero(genero);
                    apoderadoNuevo.setFecha_Nac(fechaNac);
                    
                    apoderadoDAO.agregarApoderado(apoderadoNuevo);
                    List<Apoderado> listaApoderados=apoderadoDAO.obtenerListaApoderado();
                    
                    request.setAttribute("listaApoderados", listaApoderados);
                    request.setAttribute("page", pagina);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("lista-apoderados.jsp");
                    dispatcher.forward(request, response);
                    break;

                case "actualizar":
                    Apoderado apoderadoActualizar =new Apoderado();
                    
                    String idApoderado=request.getParameter("e_idEditar");
                    dni =request.getParameter("e_DNI");
                    estadoVida =request.getParameter("e_estado-vida");
                    gradoInstruccion =request.getParameter("e_grado-instruccion");
                    ocupacion =request.getParameter("e_ocupacion");
                    telefono=request.getParameter("e_telefono");
                    apPaterno=request.getParameter("e_ape-paterno");
                    apMaterno=request.getParameter("e_ape-materno");
                    direccion = request.getParameter("e_direccion");
                    distrito = request.getParameter("e_distrito");
                    departamento = request.getParameter("e_departamento");
                    genero = "";
                    if (request.getParameter("e_genero").equals("1")) {
                        genero = "Masculino";
                    } else if (request.getParameter("e_genero").equals("2")) {
                        genero = "Femenino";
                    }
                    fechaNac = request.getParameter("e_birthdate");
                    
                    apoderadoActualizar.setIdApoderado(Integer.parseInt(idApoderado));
                    apoderadoActualizar.setDni(dni);
                    apoderadoActualizar.setEstadoVida(estadoVida);
                    apoderadoActualizar.setGradoInstruccion(gradoInstruccion);
                    apoderadoActualizar.setOcupacion(ocupacion);
                    apoderadoActualizar.setTelefono(telefono);
                    apoderadoActualizar.setApPaterno(apPaterno);
                    apoderadoActualizar.setApMaterno(apMaterno);
                    apoderadoActualizar.setDireccion(direccion);
                    apoderadoActualizar.setDistrito(distrito);
                    apoderadoActualizar.setDepartamento(departamento);
                    apoderadoActualizar.setGenero(genero);
                    apoderadoActualizar.setFecha_Nac(fechaNac);
                    
                    apoderadoDAO.actualizarApoderado(apoderadoActualizar);
                    List<Apoderado> listaApoderadosActualizar=apoderadoDAO.obtenerListaApoderado();
                    
                    request.setAttribute("listaApoderados", listaApoderadosActualizar);
                    request.setAttribute("page", pagina);
                    RequestDispatcher dispatcherActualizar = request.getRequestDispatcher("lista-apoderados.jsp");
                    dispatcherActualizar.forward(request, response);
                    
                    break;

                case "listar":
                    List<Apoderado> lista = apoderadoDAO.obtenerListaApoderado();
                    // Puedes agregar mensajes de error o redirigir a una página de error
                    request.setAttribute("listaApoderados", lista);
                    request.setAttribute("page", pagina);
                    break;

                case "buscar": 
                    String dniBuscado = request.getParameter("dniBuscado");
                    Apoderado encontrado = apoderadoDAO.obtenerApoderadoPorDni(dniBuscado );
                    List<Apoderado> listaBusqueda = new ArrayList<>();
                    if (encontrado != null ) {
                        listaBusqueda.add(encontrado);
                    } else if (dniBuscado.equals("") ){
                        listaBusqueda = apoderadoDAO.obtenerListaApoderado();
                    }
                    
                    request.setAttribute("listaApoderados", listaBusqueda);
                    request.setAttribute("page", pagina);
                    RequestDispatcher dispatcherBuscar = request.getRequestDispatcher("lista-apoderados.jsp");
                    dispatcherBuscar.forward(request, response);
                    break;

                case "eliminar":
                    idApoderado = request.getParameter("id");
                    apoderadoDAO.eliminarApoderado(Integer.parseInt(idApoderado));
                    List<Apoderado> listaApoderadosEliminar = apoderadoDAO.obtenerListaApoderado();
                    request.setAttribute("listaApoderados",listaApoderadosEliminar);
                    request.setAttribute("page", pagina);
                    RequestDispatcher dispatcherEliminar = request.getRequestDispatcher("lista-apoderados.jsp");
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
