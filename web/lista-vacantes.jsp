
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Grado"%>
<%@page import="java.util.ArrayList"%>

<%@ page import="model.Estudiante" %>
<jsp:useBean id="estudiante" class="model.Estudiante" />

<%@ page import="model.Apoderado" %>
<jsp:useBean id="apoderado" class="model.Apoderado" />

<%@ page import="model.Relacion" %>
<jsp:useBean id="relacion" class="model.Relacion" />

<%
int pagina = (Integer) request.getAttribute("page");
int modal = (Integer) request.getAttribute("modal");
boolean imprimeEst = false;

List<Grado> listaGrados = (List<Grado>) request.getAttribute("listaGrados");
int cant_residuo = listaGrados.size() % 7;
int cant_paginas = (listaGrados.size() - cant_residuo) / 7;
if (cant_residuo != 0){
    cant_paginas += 1;
}

List<List<Grado>> listaPaginas = new ArrayList<>();
List<Integer> entradas_pag = new ArrayList<>();
int ultimo_index = 0;

if (listaGrados.size()<7){
entradas_pag.add(listaGrados.size());
} else{
for (int i=1; i <= cant_paginas; i++){
    if (cant_residuo!=0 && i == cant_paginas){
        entradas_pag.add(cant_residuo);
    } else {
    entradas_pag.add(7);
    }  
}
    }

for (int i=1; i <= cant_paginas; i++){
    List<Grado> lista7Grados = new ArrayList<>();
    for (int j=ultimo_index; j < (ultimo_index+entradas_pag.get(i-1)); j++){
        lista7Grados.add(listaGrados.get(j));
    }
    ultimo_index += 7;
    listaPaginas.add(i-1, lista7Grados);
}

%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Lista de vacantes</title>
        <!--FontAwesome-->
        <script src="https://kit.fontawesome.com/3cafd6d965.js" crossorigin="anonymous"></script>
        <!--CSS-->
        <link rel="stylesheet" href="css/lista-vacantes.css">
        <%@include file="referencias.jsp" %>

    </head>
    <body>
        <%
        String modalId = "";
            if (modal != 0){
        switch (modal){
        case 1:
            modalId = "modal-est";
            break;
        case 2:
            modalId = "modal-apo-tit";
            break;
        case 3:
            modalId = "modal-doc";
            break;
            }
        %>
        <script>
            $(window).ready(function () {
                $('#<%=modalId%>').modal('show'); // Esta línea abrirá el modal cuando la página esté lista
            });
        </script><%
    }    
        %>

        <input type="checkbox" id="checkbox">
        <div class="body">
            <%@include file="barra-lateral.jsp" %>
        </div>
        <div class="container" style="position: absolute;top: 40px; left: 150px;"> 
            <div class="row my-3 ">
                <div class="col">
                    <h1>Lista de Vacantes</h1>
                    <br><!-- comment -->
                    <p>Filtros:</p>
                </div>                
            </div>
            <!--Filtros-->
            <div class="row my-3">
                <div class="col">
                    <form class="d-flex" role="search" action="GradoController" method="post">
                        <input type="hidden" name="accion" value="buscar">
                        <input type="hidden" name="page" value="1">
                        <select id="seleccionar-nivel" name="nivelbuscar" class="form-control" type="search" aria-label="Search" onchange="actualizarGrados()">
                            <option value="" disabled selected hidden>Seleccionar nivel</option>
                            <option value="Inicial">Inicial</option>
                            <option value="Primaria">Primaria</option>
                            <option value="Secundaria">Secundaria</option>
                        </select>


                        <select id="seleccionar-grado" name="gradobuscar" class="form-control" type="search" aria-label="search">
                            <option value="" disabled selected hidden>Seleccionar grado</option>
                        </select>

                        <script>
                            function actualizarGrados() {
                                var nivelSeleccionado = document.getElementById("seleccionar-nivel").value;
                                var gradosComboBox = document.getElementById("seleccionar-grado");

                                // Limpiar opciones actuales
                                gradosComboBox.innerHTML = "";

                                // Añadir nuevas opciones según el nivel seleccionado
                                if (nivelSeleccionado === "Inicial") {
                                    agregarOpcion("3 años", gradosComboBox);
                                    agregarOpcion("4 años", gradosComboBox);
                                    agregarOpcion("5 años", gradosComboBox);
                                } else if (nivelSeleccionado === "Primaria") {
                                    agregarOpcion("Primero", gradosComboBox);
                                    agregarOpcion("Segundo", gradosComboBox);
                                    agregarOpcion("Tercero", gradosComboBox);
                                    agregarOpcion("Cuarto", gradosComboBox);
                                    agregarOpcion("Quinto", gradosComboBox);
                                    agregarOpcion("Sexto", gradosComboBox);
                                } else if (nivelSeleccionado === "Secundaria") {
                                    agregarOpcion("Primero", gradosComboBox);
                                    agregarOpcion("Segundo", gradosComboBox);
                                    agregarOpcion("Tercero", gradosComboBox);
                                    agregarOpcion("Cuarto", gradosComboBox);
                                    agregarOpcion("Quinto", gradosComboBox);
                                }
                                // Puedes agregar más casos según tus necesidades
                            }

                            function agregarOpcion(texto, selectElement) {
                                var opcion = document.createElement("option");
                                opcion.text = texto;
                                selectElement.add(opcion);
                            }
                        </script>

                        <button id="btm-filtar" class="btn btn-outline-success mx-5 px-4" type="submit">
                            <i id="icon-buscar" class="fa-solid fa-magnifying-glass" style="color: #ffffff;"></i>
                            Filtrar    
                        </button>
                    </form>
                </div>
            </div>
            <!--Lista de estudiantes-->
            <div class="row my-4">
                <div class="col">
                    <div class="table-container table-responsive">
                        <table id="tabla" class="table table-borderless table-hover">
                            <thead>
                                <tr>
                                    <th>Nivel</th>
                                    <th>Grado</th>
                                    <th>Vacantes ocupadas</th>
                                    <th>Vacantes disponibles</th>
                                    <th> </th>                                                          
                                </tr>
                            </thead>
                            <tbody>

                                <% if (listaGrados != null && !listaGrados.isEmpty()) {
                                    List<Grado> paginaActual = listaPaginas.get(pagina-1); %>
                                <%for(Grado grado : paginaActual){ %>
                                <tr>
                                    <td><%= grado.getNivel()%></td>
                                    <td><%= grado.getGrado()%></td>
                                    <td><%= grado.getVacOcupa()%></td>
                                    <td><%= grado.getVacDisp()%></td>
                                    <td><a class="icono-accion mx-1" href="#" data-bs-toggle="modal" data-bs-toggle="modal" data-bs-target="#modal-est" style="color:#ffffff">
                                            <i class="fa-solid fa-file-zipper"></i>
                                            Generar matrícula
                                        </a>
                                    </td>
                                </tr>
                                <% } %>
                                <% } else { %>
                                <tr>
                                    <td colspan="7">no hay vacantes disponibles.</td>
                                </tr>
                                <% } %>


                            </tbody>
                        </table>
                    </div>
                </div>
            </div>    
            <!--Número de paginado-->
            <div class="row">
                <div class="col">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination d-flex justify-content-end align-items-center">
                            <li id="contenedor-pag" class="<%
                                if (pagina == 1){
                                %>page-item disabled<%
                                } else{

                                %>page-item<%
}
                                %>">
                                <a  class="page-link" href="GradoController?accion=listar&page=<%=pagina-1%>" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <%
                                for (int i=0; i < cant_paginas; i++){
                            %><li <%
                                if  (i+1 == pagina){
                                %>style="border:1px solid black;
                                box-shadow: 5px 5px 0px 0px rgba(0,0,0,0.75);"<%
    }%> id="contenedor-pag" class="page-item  px-1"><a class="page-link" href="
                                                                           <%
                                                                               if (pagina == i-1){
                                                                           %>#<%
                                                                               } else {
                                                                           %>GradoController?accion=listar&page=<%=i+1%><%
}
                                                                           %>"><span><%=i+1%></span></a></li><%
                            }
                                        %>
                            <li id="contenedor-pag" class="<%
                                if (pagina == cant_paginas){
                                %>page-item disabled<%
                                } else{
                                %>page-item<%
}
                                %>">
                                <a class="page-link" href="GradoController?accion=listar&page=<%=pagina+1%>" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>

            <!--MODAL Matricula / Seccion Estudiante-->
            <div class="modal modal-xl" data-bs-backdrop="static" data-bs-keyboard="false" id="modal-est">
                <div class="modal-dialog">
                    <div class="modal-content px-4" id="modal-contenido">

                        <div class="modal-header">
                            <h4 class="modal-title">Nueva matrícula</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col my-4">
                                    <!--Secciones-->
                                    <div class="Secciones">
                                        <button type="button" id="btn-est" class="btn btn-success">
                                            <i class="fa-solid fa-check fa-xl" style="color: #ffffff;"></i>
                                        </button>
                                        <h5 style="color: #f2d12e; margin: 0px 23px; margin-top: 10px; font-weight: bold;font-size: 17px;">Estudiante</h5>
                                        <i class="fa-solid fa-chevron-right fa-lg" style="color: #00ae86;margin-top: 21px;"></i>
                                        <button type="button" id="btn-apo-tit" class="btn btn-success mx-4" data-bs-toggle="modal" data-bs-target="#modal-apo-tit">02</button>
                                        <h5 style="color: white;margin-top: 10px; font-weight: bold;font-size: 17px;">Apoderado Titular</h5>
                                        <i class="fa-solid fa-chevron-right fa-lg" style="color: #00ae86;margin: 21px 21px;"></i>
                                        <button type="button" id="btn-doc" class="btn btn-success mx-2" data-bs-toggle="modal" data-bs-target="#modal-doc">03</button>
                                        <h5 style="color: white;margin: 10px 15px; font-weight: bold;font-size: 17px;">Documentos</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <h6 class="label-dni">Ingrese el DNI del estudiante:</h6>
                                    <form class="d-flex" role="search" action="GradoController?accion=listar&page=1&modal=1" method="POST">
                                        <input id="campo-buscar" name="dniEstudiante" class="form-control" type="search" aria-label="Search" style="background-color: #222222; border: 3px solid white; border-radius: 3px; color: white;"
                                               <% 
                                                Estudiante estEncontrado = (Estudiante) request.getAttribute("estudianteEncontrado");
                                                if (estEncontrado != null){
                                                imprimeEst = true;
                                               %> value = "<%=estEncontrado.getDni()%>"<%
                                                   }
                                               %>>
                                        <button id="btn-buscar" class="btn btn-outline-success mx-5 px-4" type="submit" onclick="copiarValor()">
                                            Buscar
                                        </button>
                                    </form>
                                </div>
                                <div class="col">
                                    <form class="d-flex  form-niv-grad" role="search" action="GradoController" method="post">
                                        <input type="hidden" name="accion" value="buscar">
                                        <input type="hidden" name="page" value="1">
                                        <div class="contenedor-nivel">
                                            <h6 style="color: white; font-weight: bold;">Nivel:</h6>
                                            <select id="seleccionar-nivel1" name="nivelbuscar" class="form-control" style="border: 2px solid black;border-radius: 3px; "type="search" aria-label="Search" onchange="actualizarGrados()">
                                                <option value="" disabled selected hidden>Seleccionar</option>
                                                <option value="Inicial">Inicial</option>
                                                <option value="Primaria">Primaria</option>
                                                <option value="Secundaria">Secundaria</option>
                                            </select>
                                        </div>
                                        <div class="contenedor-grado">
                                            <h6 style="color: white; font-weight: bold;">Grado:</h6>
                                            <select id="seleccionar-grado1" name="gradobuscar" class="form-control" style="border: 2px solid black;border-radius: 3px; "type="search" aria-label="search">
                                                <option value="" disabled selected hidden>Seleccionar</option>
                                            </select>
                                        </div>

                                        <script>
                                            function actualizarGrados() {
                                                var nivelSeleccionado = document.getElementById("seleccionar-nivel1").value;
                                                var gradosComboBox = document.getElementById("seleccionar-grado1");

                                                // Limpiar opciones actuales
                                                gradosComboBox.innerHTML = "";

                                                // Añadir nuevas opciones según el nivel seleccionado
                                                if (nivelSeleccionado === "Inicial") {
                                                    agregarOpcion("3 años", gradosComboBox);
                                                    agregarOpcion("4 años", gradosComboBox);
                                                    agregarOpcion("5 años", gradosComboBox);
                                                } else if (nivelSeleccionado === "Primaria") {
                                                    agregarOpcion("Primero", gradosComboBox);
                                                    agregarOpcion("Segundo", gradosComboBox);
                                                    agregarOpcion("Tercero", gradosComboBox);
                                                    agregarOpcion("Cuarto", gradosComboBox);
                                                    agregarOpcion("Quinto", gradosComboBox);
                                                    agregarOpcion("Sexto", gradosComboBox);
                                                } else if (nivelSeleccionado === "Secundaria") {
                                                    agregarOpcion("Primero", gradosComboBox);
                                                    agregarOpcion("Segundo", gradosComboBox);
                                                    agregarOpcion("Tercero", gradosComboBox);
                                                    agregarOpcion("Cuarto", gradosComboBox);
                                                    agregarOpcion("Quinto", gradosComboBox);
                                                }
                                                // Puedes agregar más casos según tus necesidades
                                            }

                                            function agregarOpcion(texto, selectElement) {
                                                var opcion = document.createElement("option");
                                                opcion.text = texto;
                                                selectElement.add(opcion);
                                            }
                                        </script>


                                    </form>
                                </div>
                            </div>
                            <div class="contenedor-info-est my-4">
                                <div class="row">
                                    <div class="col">
                                        <h6 class="label-info">Apellido Paterno:</h6>
                                        <h6 style="font-weight: normal" class="label-info"> <% 
                                                if (imprimeEst){
                                            %><%=estEncontrado.getApPaterno()%><%
                                                   }
                                            %></h6>
                                    </div>
                                    <div class="col">
                                        <h6 class="label-info">Apellido Materno:</h6>
                                        <h6 style="font-weight: normal" class="label-info"> <% 
                                                if (imprimeEst){
                                            %><%=estEncontrado.getApMaterno()%><%
                                                   }
                                            %></h6>
                                    </div>
                                    <div class="col">
                                        <h6 class="label-info">Nombres:</h6>
                                        <h6 style="font-weight: normal" class="label-info"> <% 
                                                if (imprimeEst){
                                            %><%=estEncontrado.getNombres()%><%
                                                   }
                                            %></h6>
                                    </div>
                                    <div class="col">
                                        <h6 class="label-info">Sexo:</h6>
                                        <h6 style="font-weight: normal" class="label-info"> <% 
                                                if (imprimeEst){
                                            %><%=estEncontrado.getGenero()%><%
                                                   }
                                            %></h6>
                                    </div>
                                </div>
                                <div class="row my-5">
                                    <div class="col-6">
                                        <h6 class="label-info">Dirección:</h6>
                                        <h6 style="font-weight: normal" class="label-info"> <% 
                                                if (imprimeEst){
                                            %><%=estEncontrado.getDireccion()%><%
                                                   }
                                            %></h6>
                                    </div>
                                    <div class="col-3">
                                        <h6 class="label-info">Distrito:</h6>
                                        <h6 style="font-weight: normal" class="label-info"> <% 
                                                if (imprimeEst){
                                            %><%=estEncontrado.getDistrito()%><%
                                                   }
                                            %></h6>
                                    </div>
                                    <div class="col-3">
                                        <h6 class="label-info">Provincia:</h6>
                                        <h6 style="font-weight: normal" class="label-info"> 
                                            <%--
                                                    <% 
                                                    if (imprimeEst){
                                                %><%=estEncontrado.getDistrito()%><%
                                                       }
                                                %>
                                            --%>
                                        </h6>
                                    </div>
                                </div>
                                <div class="row my-4">
                                    <div class="col">
                                        <h6 class="label-info">Departamento:</h6>
                                        <h6 style="font-weight: normal" class="label-info"> <% 
                                                if (imprimeEst){
                                            %><%=estEncontrado.getDepartamento()%><%
                                                   }
                                            %></h6>
                                    </div>
                                    <div class="col">
                                        <h6 class="label-info">Fecha de nacimiento:</h6>
                                        <h6 style="font-weight: normal" class="label-info"> <% 
                                                if (imprimeEst){
                                            %><%=estEncontrado.getFecha_Nac()%><%
                                                   }
                                            %></h6>
                                    </div>
                                </div>
                            </div>


                        </div>

                    </div>
                </div>
            </div>

            <!--MODAL Matricula / Seccion Apoderado titular-->
            <div class="modal modal-xl" data-bs-backdrop="static" data-bs-keyboard="false" id="modal-apo-tit">
                <div class="modal-dialog">
                    <div class="modal-content px-4" id="modal-contenido">
                        <div class="modal-header">
                            <h4 class="modal-title">Nueva matricula</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col my-4">
                                    <!--Secciones-->
                                    <div class="Secciones">
                                        <button type="button" id="btn-est2" class="btn btn-success"data-bs-toggle="modal" data-bs-target="#modal-est">
                                            01
                                        </button>
                                        <h5 style="color: white; margin: 0px 23px; margin-top: 10px; font-weight: bold;font-size: 17px;">Estudiante</h5>
                                        <i class="fa-solid fa-chevron-right fa-lg" style="color: #00ae86;margin-top: 21px;"></i>
                                        <button type="button" id="btn-apo-tit2" class="btn btn-success mx-4" >
                                            <i class="fa-solid fa-check fa-xl" style="color: #ffffff;"></i>
                                        </button>
                                        <h5 style="color: #f2d12e;margin-top: 10px; font-weight: bold;font-size: 17px;">Apoderado Titular</h5>
                                        <i class="fa-solid fa-chevron-right fa-lg" style="color: #00ae86;margin: 21px 21px;"></i>
                                        <button type="button" id="btn-doc" class="btn btn-success mx-2" data-bs-toggle="modal" data-bs-target="#modal-doc">03</button>
                                        <h5 style="color: white;margin: 10px 15px; font-weight: bold;font-size: 17px;">Documentos</h5>
                                    </div>
                                </div>
                            </div>
                            <!--Tabla-->
                            <div class="row my-3">
                                <div class="col">
                                    <h4 style="color: white;">Seleccione un apoderado:</h4><br>
                                    <div class="table-container table-responsive">
                                        <table id="tabla" class="table table-borderless table-hover">
                                            <thead>
                                                <tr>
                                                    <th>N° de DNI</th>
                                                    <th>Apellido Paterno</th>
                                                    <th>Apellido Materno</th>
                                                    <th>Nombres</th>
                                                    <th>Tipo de apoderado</th>
                                                    <th>Seleccionar</th>                                                          
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% 
                                                List<Apoderado> listaApoRel = (List<Apoderado>) request.getAttribute("listaApoRel");
                                                if (listaApoRel != null){
                                                for(Apoderado apoderadoRela : listaApoRel){ 
                                                %>
                                                <tr>
                                                    <td><%=apoderadoRela.getDni()%></td>
                                                    <td><%=apoderadoRela.getApPaterno() %></td>
                                                    <td><%=apoderadoRela.getApMaterno() %></td>
                                                    <td><%=apoderadoRela.getNombres()%></td>
                                                    <td><%=apoderadoRela.getDireccion()%></td>
                                                    <td>
                                                        <input type="radio" name="apoderado" value="1">
                                                    </td>
                                                </tr>
                                                <% }
                                                }
                                                %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <!--MODAL Matricula / Seccion Documentos-->
            <div class="modal modal-xl" data-bs-backdrop="static" data-bs-keyboard="false" id="modal-doc">
                <div class="modal-dialog">
                    <div class="modal-content px-4" id="modal-contenido">
                        <div class="modal-header">
                            <h4 class="modal-title">Nueva matricula</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col my-4">
                                    <!--Secciones-->
                                    <div class="Secciones">
                                        <button type="button" id="btn-est2" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modal-est">
                                            01
                                        </button>
                                        <h5 style="color: white; margin: 0px 23px; margin-top: 10px; font-weight: bold;font-size: 17px;">Estudiante</h5>
                                        <i class="fa-solid fa-chevron-right fa-lg" style="color: #00ae86;margin-top: 21px;"></i>
                                        <button type="button" id="btn-apo-tit" class="btn btn-success mx-4" data-bs-toggle="modal" data-bs-target="#modal-apo-tit">02</button>
                                        <h5 style="color: white;margin-top: 10px; font-weight: bold;font-size: 17px;">Apoderado Titular</h5>
                                        <i class="fa-solid fa-chevron-right fa-lg" style="color: #00ae86;margin: 21px 21px;"></i>
                                        <button type="button" id="btn-doc2" class="btn btn-success mx-2">
                                            <i class="fa-solid fa-check fa-xl" style="color: #ffffff;"></i>
                                        </button>
                                        <h5 style="color: #f2d12e;margin: 10px 15px; font-weight: bold;font-size: 17px;">Documentos</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <form action="GradoController?accion=matricular&page=1&modal=1" method="post" enctype="multipart/form-data">
                                    <div class="col-8 my-4" id="contenedor-info-est">
                                        <h6 class="label-doc">Libreta de notas:</h6>
                                        <input type="file" class="form-control my-2" name= "libretaNotas" id="libretaNotas" accept=".pdf, .jpg, .png, .docx">

                                        <h6 class="label-doc">Certificado de estudios:</h6>        
                                        <input type="file" class="form-control my-2" name= "certificadoEstudios" id="certificadoEstudios" accept=".pdf, .jpg, .png, .docx">

                                        <h6 class="label-doc">Copia de DNI del apoderado:</h6>        
                                        <input type="file" class="form-control my-2" name= "dniApoderado" id="dniApoderado" accept=".pdf, .jpg, .png, .docx">

                                        <h6 class="label-doc">Copia de DNI del estudiante:</h6>        
                                        <input type="file" class="form-control my-2" name= "dniEstudiante" id="dniEstudiante" accept=".pdf, .jpg, .png, .docx">

                                        <h6 class="label-doc">Partida de nacimiento:</h6>        
                                        <input type="file" class="form-control my-2" name= "partidaNacimiento" id="partidaNacimiento" accept=".pdf, .jpg, .png, .docx">

                                    </div>
                                    <div class="col">

                                        <input type="hidden" id="campo-buscar2" name="dniEstudiante" value="<% 
                                                    if (estEncontrado != null){
                                                    imprimeEst = true;
                                               %><%=estEncontrado.getDni()%><%
                                                       }
                                               %>">
                                        <button id="btn-grabar" class="btn btn-outline-success mx-5 px-4" type="submit" value="Grabar">
                                            Grabar
                                        </button>

                                    </div>
                                </form>
                            </div>  
                        </div>

                    </div>
                </div>
            </div>

        </div>

    </body>
</html>
