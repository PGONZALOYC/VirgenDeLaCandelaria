<%-- 
    Document   : lista_apoderados
    Created on : 20 nov. 2023, 23:46:31
    Author     : salaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Apoderado"%>
<%@page import="java.util.ArrayList"%>
<%int pagina = (Integer) request.getAttribute("page");
List<Apoderado> listaApoderados = (List<Apoderado>) request.getAttribute("listaApoderados");
int cant_residuo = listaApoderados.size() % 7;
int cant_paginas = (listaApoderados.size() - cant_residuo) / 7;
if (cant_residuo != 0){
    cant_paginas += 1;
}


List<List<Apoderado>> listaPaginas = new ArrayList<>();
List<Integer> entradas_pag = new ArrayList<>();
int ultimo_index = 0;

if (listaApoderados.size()<7){
entradas_pag.add(listaApoderados.size());
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
    List<Apoderado> lista7Apoderados = new ArrayList<>();
    for (int j=ultimo_index; j < (ultimo_index+entradas_pag.get(i-1)); j++){
        lista7Apoderados.add(listaApoderados.get(j));
    }
    ultimo_index += 7;
    listaPaginas.add(i-1, lista7Apoderados);
}

%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Lista de apoderados</title>
        <!--FontAwesome-->
        <script src="https://kit.fontawesome.com/3cafd6d965.js" crossorigin="anonymous"></script>
        <!--CSS-->
        <link rel="stylesheet" href="css/lista-apoderados.css">

        <%@include file="referencias.jsp" %>


    </head>
    <body>



        <input type="checkbox" id="checkbox">

        <div class="body">
            <%@include file="barra-lateral.jsp" %></div>
        <div class="container" style="position: absolute;top: 40px;
             left: 150px;">
            <!--Secciones-->
            <div class="row my-3 ">
                <div class="col">
                    <a href="EstudianteController?accion=listar&page=1">
                        <button type="button"id="btn-listaEst" class="btn btn-light">Lista de estudiantes</button>
                    </a>
                    <a href="#">
                        <button type="button"id="btn-listaApo" class="btn btn-light">Lista de apoderados</button>
                    </a> 
                </div>
            </div>
            <!--Buscar y agregar apoderado-->
            <div class="row my-3">
                <div class="col">
                    <h6 class="label-dni">N° de DNI del apoderado</h6>
                    <form class="d-flex" role="search" action="ApoderadoController" method="post">
                        <input type="hidden" name="accion" value="buscar">
                        <input type="hidden" name="page" value="1">
                        <input id="campo-buscar" class="form-control " type="search" aria-label="Search" name="dniBuscado">
                        <button id="btn-buscar" class="btn btn-outline-success mx-5 px-4" type="submit">
                            <i id="icon-buscar" class="fa-solid fa-magnifying-glass" style="color: #ffffff;"></i>
                            Buscar    
                        </button>
                    </form>

                </div>
                <div class="col contenedor-btnAgregar d-flex justify-content-end align-items-center">
                    <button type="button" id="btn-agregarApo" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#modal-datos-apo">
                        <i id="icon-agregar" class="fa-solid fa-plus" style="color: #ffffff;"></i>
                        Agregar apoderado
                    </button>
                </div>
            </div>
            <!--Listado de apoderados-->
            <div class="row my-4">
                <div class="col">
                    <div class="table-container table-responsive">
                        <table id="tabla" class="table table-borderless table-hover">
                            <thead>
                                <tr>
                                    <th>N° de apoderado</th>
                                    <th>N° de DNI</th>
                                    <th>Apellido Paterno</th>
                                    <th>Apellido Materno</th>
                                    <th>Nombres</th>
                                    <th>Acciones</th>                                                          
                                </tr>
                            </thead>
                            <tbody>
                                <% if(listaApoderados !=null && !listaApoderados.isEmpty()){
                                List<Apoderado>paginaActual=listaPaginas.get(pagina-1);%>
                                <%for(Apoderado apoderado : paginaActual){ %>
                                <tr>
                                    <td><%=apoderado.getId_Apoderado()%></td>
                                    <td><%=apoderado.getDni()%></td>
                                    <td><%=apoderado.getApellido_Paterno() %></td>
                                    <td><%=apoderado.getApellido_Materno()%></td>
                                    <td><%=apoderado.getNombres()%></td>
                                    <td>
                                        <a onclick="document.getElementById('e_idEditar').value = '<%=apoderado.getId_Apoderado()%>';
                                            document.getElementById('e_dniImput').value = '<%=apoderado.getDni()%>';
                                            document.getElementById('e_estadoVidaImput').value = '<%=apoderado.getVive()%>';
                                            document.getElementById('e_gradoInstruccionImput').value = '<%=apoderado.getGrado_Instruccion()%>';
                                            document.getElementById('e_ocupacionImput').value = '<%=apoderado.getOcupado()%>';
                                            document.getElementById('e_telefonoImput').value = '<%=apoderado.getTelefono()%>';
                                            document.getElementById('e_apPaternoImput').value = '<%=apoderado.getApellido_Paterno()%>';
                                            document.getElementById('e_apMaternoImput').value = '<%=apoderado.getApellido_Materno()%>';
                                            document.getElementById('e_nombresImput').value = '<%=apoderado.getNombres()%>';
                                            document.getElementById('e_direccionImput').value = '<%=apoderado.getDireccion()%>';
                                            document.getElementById('e_distritoImput').value = '<%=apoderado.getDistrito()%>';
                                            document.getElementById('e_departamentoImput').value = '<%=apoderado.getDepartamento()%>';
                                           <%if (("Masculino").equals(apoderado.getSexo())) {
                                           %> document.getElementById('e_generoInput').value = 1;<%
                                              } else if (("Femenino").equals(apoderado.getSexo())){
                                           %>document.getElementById('e_generoInput').value = 2;<%
                                            }%>
                                            document.getElementById('e_fecNacImput').value = '<%=apoderado.getFecha_Nacimiento()%>';"
                                           class="icono-accion mx-1" href="#" data-bs-toggle="modal" data-bs-target="#modal-editar-datos-apo">
                                            <i class="fa-solid fa-pen-to-square fa-lg" style="color: #ffffff;"></i>      
                                        </a>      

                                        <a class="icono-accion mx-1" href="#" data-bs-toggle="modal" data-bs-target="#modal-ver-datos">
                                            <i class="fa-solid fa-eye fa-lg" style="color: #ffffff;"></i>      
                                        </a>
                                    </td>            
                                </tr>

                                <% } %>
                                <% } else { %>
                                <tr>
                                    <td colspan="7">No hay apoderado disponibles.</td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-------Número de paginado--------->
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
                                <a  class="page-link" href="ApoderadoController?accion=listar&page=<%=pagina-1%>" aria-label="Previous">
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
                                                                           %>ApoderadoController?accion=listar&page=<%=i+1%><%
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
                                <a class="page-link" href="ApoderadoController?accion=listar&page=<%=pagina+1%>" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <script>
                function validateInput(event) {
                    const input = event.target;
                    const value = input.value;
                    const regex = /^\d*$/;
                    if (!regex.test(value)) {
                        alert('Por favor, ingrese solo números.');
                        input.value = value.replace(/[^0-9]/g, '');
                    }
                }

                function validateInput2(event) {
                    const input = event.target;
                    const value = input.value;
                    // Expresión regular para permitir solo letras y espacios (A-Z, a-z, y espacios)
                    const regex = /^[a-zA-Z\s]*$/;
                    // Si el valor no cumple con la expresión regular, muestra un mensaje de error
                    if (!regex.test(value)) {
                        // Maneja el caso en que el valor no sea válido
                        alert('Por favor, ingrese solo letras.');
                        // Opcional: también puedes eliminar caracteres no permitidos
                        input.value = value.replace(/[^a-zA-Z\s]/g, '');
                    }
                }

                function actualizarProvincias() {
                    var departamentoSeleccionado = document.getElementById("a_departamentoInput").value;
                    var provinciaComboBox = document.getElementById("a_provinciaInput");
                    // Limpiar opciones actuales
                    provinciaComboBox.innerHTML = "";
                    // Añadir nuevas opciones según el nivel seleccionado
                    if (departamentoSeleccionado === "Amazonas") {
                        agregarOpcion("Chachapoyas", provinciaComboBox);
                        agregarOpcion("Bagua", provinciaComboBox);
                        agregarOpcion("Bongará", provinciaComboBox);
                        agregarOpcion("Condorcanqui", provinciaComboBox);
                        agregarOpcion("Luya", provinciaComboBox);
                        agregarOpcion("Rodríguez de Mendoza", provinciaComboBox);
                        agregarOpcion("Utcubamba", provinciaComboBox);
                    } else if (departamentoSeleccionado === "Áncash") {
                        agregarOpcion("Huaraz", provinciaComboBox);
                        agregarOpcion("Aija", provinciaComboBox);
                        agregarOpcion("Bolognesi", provinciaComboBox);
                        agregarOpcion("Carhuaz", provinciaComboBox);
                        agregarOpcion("Carlos Fermín Fitzcarrald", provinciaComboBox);
                        agregarOpcion("Casma", provinciaComboBox);
                        agregarOpcion("Corongo", provinciaComboBox);
                        agregarOpcion("Huari", provinciaComboBox);
                        agregarOpcion("Huarmey", provinciaComboBox);
                        agregarOpcion("Mariscal Luzuriaga", provinciaComboBox);
                        agregarOpcion("Ocros", provinciaComboBox);
                        agregarOpcion("Pallasca", provinciaComboBox);
                        agregarOpcion("Pomabamba", provinciaComboBox);
                        agregarOpcion("Recuay", provinciaComboBox);
                        agregarOpcion("Santa", provinciaComboBox);
                        agregarOpcion("Sihuas", provinciaComboBox);
                        agregarOpcion("Yungay", provinciaComboBox);
                    } else if (departamentoSeleccionado === "Apurímac") {
                        agregarOpcion("Abancay", provinciaComboBox);
                        agregarOpcion("Andahuaylas", provinciaComboBox);
                        agregarOpcion("Antabamba", provinciaComboBox);
                        agregarOpcion("Aymaraes", provinciaComboBox);
                        agregarOpcion("Cotabambas", provinciaComboBox);
                        agregarOpcion("Chincheros", provinciaComboBox);
                        agregarOpcion("Grau", provinciaComboBox);
                    } else if (departamentoSeleccionado === "Arequipa") {
                        agregarOpcion("Arequipa", provinciaComboBox);
                        agregarOpcion("Camaná", provinciaComboBox);
                        agregarOpcion("Caravelí", provinciaComboBox);
                        agregarOpcion("Castilla", provinciaComboBox);
                        agregarOpcion("Caylloma", provinciaComboBox);
                        agregarOpcion("Condesuyos", provinciaComboBox);
                        agregarOpcion("Islay", provinciaComboBox);
                        agregarOpcion("La Unión", provinciaComboBox);
                    } else if (departamentoSeleccionado === "Ayacucho") {
                        agregarOpcion("Huamanga", provinciaComboBox);
                        agregarOpcion("Cangallo", provinciaComboBox);
                        agregarOpcion("Huanta", provinciaComboBox);
                        agregarOpcion("La Mar", provinciaComboBox);
                        agregarOpcion("Lucanas", provinciaComboBox);
                        agregarOpcion("Parinacochas", provinciaComboBox);
                        agregarOpcion("Paucar del Sara Sara", provinciaComboBox);
                        agregarOpcion("Sucre", provinciaComboBox);
                        agregarOpcion("Vilcashuamán", provinciaComboBox);
                        agregarOpcion("Víctor Fajardo", provinciaComboBox);
                    } else if (departamentoSeleccionado === "Cajamarca") {
                        agregarOpcion("Cajamarca", provinciaComboBox);
                        agregarOpcion("Cajabamba", provinciaComboBox);
                        agregarOpcion("Celendín", provinciaComboBox);
                        agregarOpcion("Chota", provinciaComboBox);
                        agregarOpcion("Contumazá", provinciaComboBox);
                        agregarOpcion("Cutervo", provinciaComboBox);
                        agregarOpcion("Hualgayoc", provinciaComboBox);
                        agregarOpcion("Jaén", provinciaComboBox);
                        agregarOpcion("San Ignacio", provinciaComboBox);
                        agregarOpcion("San Marcos", provinciaComboBox);
                        agregarOpcion("San Miguel", provinciaComboBox);
                        agregarOpcion("San Pablo", provinciaComboBox);
                        agregarOpcion("Santa Cruz", provinciaComboBox);
                    } else if (departamentoSeleccionado === "Cusco") {
                        agregarOpcion("Cusco", provinciaComboBox);
                        agregarOpcion("Acomayo", provinciaComboBox);
                        agregarOpcion("Anta", provinciaComboBox);
                        agregarOpcion("Calca", provinciaComboBox);
                        agregarOpcion("Canas", provinciaComboBox);
                        agregarOpcion("Canchis", provinciaComboBox);
                        agregarOpcion("Chumbivilcas", provinciaComboBox);
                        agregarOpcion("Espinar", provinciaComboBox);
                        agregarOpcion("La Convención", provinciaComboBox);
                        agregarOpcion("Paruro", provinciaComboBox);
                        agregarOpcion("Paucartambo", provinciaComboBox);
                        agregarOpcion("Quispicanchi", provinciaComboBox);
                        agregarOpcion("Urubamba", provinciaComboBox);
                    } else if (departamentoSeleccionado === "Huancavelica") {
                        agregarOpcion("Huancavelica", provinciaComboBox);
                        agregarOpcion("Acobamba", provinciaComboBox);
                        agregarOpcion("Angaraes", provinciaComboBox);
                        agregarOpcion("Castrovirreyna", provinciaComboBox);
                        agregarOpcion("Churcampa", provinciaComboBox);
                        agregarOpcion("Huaytará", provinciaComboBox);
                        agregarOpcion("Tayacaja", provinciaComboBox);
                    } else if (departamentoSeleccionado === "Huánuco") {
                        agregarOpcion("Huánuco", provinciaComboBox);
                        agregarOpcion("Ambo", provinciaComboBox);
                        agregarOpcion("Dos de Mayo", provinciaComboBox);
                        agregarOpcion("Huacaybamba", provinciaComboBox);
                        agregarOpcion("Huamalíes", provinciaComboBox);
                        agregarOpcion("Leoncio Prado", provinciaComboBox);
                        agregarOpcion("Marañón", provinciaComboBox);
                        agregarOpcion("Puerto Inca", provinciaComboBox);
                        agregarOpcion("Pillco Marca", provinciaComboBox);
                        agregarOpcion("Lauricocha", provinciaComboBox);
                        agregarOpcion("Yarowilca", provinciaComboBox);
                    } else if (departamentoSeleccionado === "Ica") {
                        agregarOpcion("Ica", provinciaComboBox);
                        agregarOpcion("Chincha", provinciaComboBox);
                        agregarOpcion("Nasca", provinciaComboBox);
                        agregarOpcion("Palpa", provinciaComboBox);
                        agregarOpcion("Pisco", provinciaComboBox);
                    } else if (departamentoSeleccionado === "Junín") {
                        agregarOpcion("Huancayo", provinciaComboBox);
                        agregarOpcion("Chanchamayo", provinciaComboBox);
                        agregarOpcion("Chupaca", provinciaComboBox);
                        agregarOpcion("Concepción", provinciaComboBox);
                        agregarOpcion("Jauja", provinciaComboBox);
                        agregarOpcion("Junín", provinciaComboBox);
                        agregarOpcion("Satipo", provinciaComboBox);
                        agregarOpcion("Tarma", provinciaComboBox);
                        agregarOpcion("Yauli", provinciaComboBox);
                    } else if (departamentoSeleccionado === "La Libertad") {
                        agregarOpcion("Trujillo", provinciaComboBox);
                        agregarOpcion("Ascope", provinciaComboBox);
                        agregarOpcion("Bolívar", provinciaComboBox);
                        agregarOpcion("Chepén", provinciaComboBox);
                        agregarOpcion("Gran Chimú", provinciaComboBox);
                        agregarOpcion("Guadalupes", provinciaComboBox);
                        agregarOpcion("Julcán", provinciaComboBox);
                        agregarOpcion("Otuzco", provinciaComboBox);
                        agregarOpcion("Pacasmayo", provinciaComboBox);
                        agregarOpcion("Pataz", provinciaComboBox);
                        agregarOpcion("Sánchez Carrión", provinciaComboBox);
                        agregarOpcion("Santiago de Chuco", provinciaComboBox);
                        agregarOpcion("Virú", provinciaComboBox);
                    } else if (departamentoSeleccionado === "Lambayeque") {
                        agregarOpcion("Chiclayo", provinciaComboBox);
                        agregarOpcion("Ferreñafe", provinciaComboBox);
                        agregarOpcion("Lambayeque", provinciaComboBox);
                    } else if (departamentoSeleccionado === "Lima") {
                        agregarOpcion("Lima", provinciaComboBox);
                        agregarOpcion("Barranca", provinciaComboBox);
                        agregarOpcion("Cajatambo", provinciaComboBox);
                        agregarOpcion("Canta", provinciaComboBox);
                        agregarOpcion("Cañete", provinciaComboBox);
                        agregarOpcion("Huaral", provinciaComboBox);
                        agregarOpcion("Huarochirí", provinciaComboBox);
                        agregarOpcion("Huaura", provinciaComboBox);
                        agregarOpcion("Oyon", provinciaComboBox);
                        agregarOpcion("Yauyos", provinciaComboBox);
                    } else if (departamentoSeleccionado === "Loreto") {
                        agregarOpcion("Maynas", provinciaComboBox);
                        agregarOpcion("Alto Amazonas", provinciaComboBox);
                        agregarOpcion("Loreto", provinciaComboBox);
                        agregarOpcion("Requena", provinciaComboBox);
                        agregarOpcion("Ucayali", provinciaComboBox);
                        agregarOpcion("Mariscal Ramón Castilla", provinciaComboBox);
                        agregarOpcion("Putumayo", provinciaComboBox);
                        agregarOpcion("Alto Amazonas", provinciaComboBox);
                        agregarOpcion("Datem del Marañón", provinciaComboBox);
                        agregarOpcion("Loreto", provinciaComboBox);
                    } else if (departamentoSeleccionado === "Madre de Dios") {
                        agregarOpcion("Tambopata", provinciaComboBox);
                        agregarOpcion("Manu", provinciaComboBox);
                        agregarOpcion("Tahuamanu", provinciaComboBox);
                    } else if (departamentoSeleccionado === "Moquegua") {
                        agregarOpcion("Mariscal Nieto", provinciaComboBox);
                        agregarOpcion("General Sánchez Cerro", provinciaComboBox);
                        agregarOpcion("Ilo", provinciaComboBox);
                    } else if (departamentoSeleccionado === "Pasco") {
                        agregarOpcion("Pasco", provinciaComboBox);
                        agregarOpcion("Daniel Alcides Carrión", provinciaComboBox);
                        agregarOpcion("Oxapampa", provinciaComboBox);
                    } else if (departamentoSeleccionado === "Piura") {
                        agregarOpcion("Piura", provinciaComboBox);
                        agregarOpcion("Ayabaca", provinciaComboBox);
                        agregarOpcion("Huancabamba", provinciaComboBox);
                        agregarOpcion("Morropon", provinciaComboBox);
                        agregarOpcion("Paita", provinciaComboBox);
                        agregarOpcion("Sullana", provinciaComboBox);
                        agregarOpcion("Talara", provinciaComboBox);
                        agregarOpcion("Sechura", provinciaComboBox);
                    } else if (departamentoSeleccionado === "Puno") {
                        agregarOpcion("Puno", provinciaComboBox);
                        agregarOpcion("Azángaro", provinciaComboBox);
                        agregarOpcion("Carabaya", provinciaComboBox);
                        agregarOpcion("Chucuito", provinciaComboBox);
                        agregarOpcion("El Collao", provinciaComboBox);
                        agregarOpcion("Huancané", provinciaComboBox);
                        agregarOpcion("Lampa", provinciaComboBox);
                        agregarOpcion("Melgar", provinciaComboBox);
                        agregarOpcion("Moho", provinciaComboBox);
                        agregarOpcion("San Antonio de Putina", provinciaComboBox);
                        agregarOpcion("San Román", provinciaComboBox);
                        agregarOpcion("Sandia", provinciaComboBox);
                        agregarOpcion("Yunguyo", provinciaComboBox);
                    } else if (departamentoSeleccionado === "San Martín") {
                        agregarOpcion("Moyobamba", provinciaComboBox);
                        agregarOpcion("Bellavista", provinciaComboBox);
                        agregarOpcion("El Dorado", provinciaComboBox);
                        agregarOpcion("Huallaga", provinciaComboBox);
                        agregarOpcion("Lamas", provinciaComboBox);
                        agregarOpcion("Mariscal Cáceres", provinciaComboBox);
                        agregarOpcion("Picota", provinciaComboBox);
                        agregarOpcion("Rioja", provinciaComboBox);
                        agregarOpcion("San Martín", provinciaComboBox);
                        agregarOpcion("Tocache", provinciaComboBox);
                    } else if (departamentoSeleccionado === "Tacna") {
                        agregarOpcion("Tacna", provinciaComboBox);
                        agregarOpcion("Candarave", provinciaComboBox);
                        agregarOpcion("Jorge Basadre", provinciaComboBox);
                        agregarOpcion("Tarata", provinciaComboBox);
                    } else if (departamentoSeleccionado === "Tumbes") {
                        agregarOpcion("Tumbes", provinciaComboBox);
                        agregarOpcion("Contralmirante Villar", provinciaComboBox);
                        agregarOpcion("Zarumilla", provinciaComboBox);
                    } else if (departamentoSeleccionado === "Ucayali") {
                        agregarOpcion("Coronel Portillo", provinciaComboBox);
                        agregarOpcion("Atalaya", provinciaComboBox);
                        agregarOpcion("Padre Abad", provinciaComboBox);
                        agregarOpcion("Purus", provinciaComboBox);
                    }

                    actualizarDistritos();
                }

                function actualizarDistritos() {
                    var provinciaSeleccionada = document.getElementById("a_provinciaInput").value;
                    var distritosComboBox = document.getElementById("a_distritoInput");
                    // Limpiar opciones actuales
                    distritosComboBox.innerHTML = "";
                    // Añadir nuevas opciones según el nivel seleccionado
                    if (provinciaSeleccionada === "Chachapoyas") {
                        agregarOpcion("Chachapoyas", distritosComboBox);
                        agregarOpcion("Asunción", distritosComboBox);
                        agregarOpcion("Balsas", distritosComboBox);
                        agregarOpcion("Chiliquín", distritosComboBox);
                        agregarOpcion("Granada", distritosComboBox);
                        agregarOpcion("Huancas", distritosComboBox);
                        agregarOpcion("La Jalca", distritosComboBox);
                        agregarOpcion("Leimebamba", distritosComboBox);
                        agregarOpcion("Levanto", distritosComboBox);
                        agregarOpcion("Magdalena", distritosComboBox);
                        agregarOpcion("Mariscal Benavides", distritosComboBox);
                        agregarOpcion("Molino", distritosComboBox);
                        agregarOpcion("Montevideo", distritosComboBox);
                        agregarOpcion("Olleros", distritosComboBox);
                        agregarOpcion("Quinjalca", distritosComboBox);
                        agregarOpcion("San Francisco de Daguas", distritosComboBox);
                        agregarOpcion("San Isidro de Maino", distritosComboBox);
                        agregarOpcion("Soloco", distritosComboBox);
                        agregarOpcion("Sonche", distritosComboBox);
                    } else if (provinciaSeleccionada === "Bagua") {
                        agregarOpcion("Bagua", distritosComboBox);
                        agregarOpcion("Aramango", distritosComboBox);
                        agregarOpcion("Copallín", distritosComboBox);
                        agregarOpcion("El Parco", distritosComboBox);
                        agregarOpcion("Imaza", distritosComboBox);
                        agregarOpcion("La Peca", distritosComboBox);
                    } else if (provinciaSeleccionada === "Bongará") {
                        agregarOpcion("Jumbilla", distritosComboBox);
                        agregarOpcion("Chisquilla", distritosComboBox);
                        agregarOpcion("Churuja", distritosComboBox);
                        agregarOpcion("Corosha", distritosComboBox);
                        agregarOpcion("Cuispes", distritosComboBox);
                        agregarOpcion("Florida", distritosComboBox);
                        agregarOpcion("Recta", distritosComboBox);
                        agregarOpcion("San Carlos", distritosComboBox);
                        agregarOpcion("Shipasbamba", distritosComboBox);
                        agregarOpcion("Valera", distritosComboBox);
                        agregarOpcion("Yambrasbamba", distritosComboBox);
                    } else if (provinciaSeleccionada === "Condorcanqui") {
                        agregarOpcion("Nieva", distritosComboBox);
                        agregarOpcion("Río Santiago", distritosComboBox);
                        agregarOpcion("El Cenepa", distritosComboBox);
                    } else if (provinciaSeleccionada === "Luya") {
                        agregarOpcion("Lamud", distritosComboBox);
                        agregarOpcion("Cocabamba", distritosComboBox);
                        agregarOpcion("Colcamar", distritosComboBox);
                        agregarOpcion("Conila", distritosComboBox);
                        agregarOpcion("Inguilpata", distritosComboBox);
                        agregarOpcion("Longuita", distritosComboBox);
                        agregarOpcion("Longar", distritosComboBox);
                        agregarOpcion("Luya Viejo", distritosComboBox);
                        agregarOpcion("María", distritosComboBox);
                        agregarOpcion("Ocalli", distritosComboBox);
                        agregarOpcion("Ocumal", distritosComboBox);
                        agregarOpcion("Pisuquia", distritosComboBox);
                        agregarOpcion("Providencia", distritosComboBox);
                        agregarOpcion("San Cristóbal", distritosComboBox);
                        agregarOpcion("San Francisco de Yeso", distritosComboBox);
                        agregarOpcion("San Jerónimo", distritosComboBox);
                        agregarOpcion("San Juan de Lopecancha", distritosComboBox);
                        agregarOpcion("Santa Catalina", distritosComboBox);
                        agregarOpcion("Santo Tomás", distritosComboBox);
                        agregarOpcion("Tingo", distritosComboBox);
                        agregarOpcion("Valera", distritosComboBox);
                    } else if (provinciaSeleccionada === "Rodríguez de Mendoza") {
                        agregarOpcion("San Nicolás", distritosComboBox);
                        agregarOpcion("Cochamal", distritosComboBox);
                        agregarOpcion("Huambo", distritosComboBox);
                        agregarOpcion("Limabamba", distritosComboBox);
                        agregarOpcion("Longar", distritosComboBox);
                        agregarOpcion("Mariscal Benavides", distritosComboBox);
                        agregarOpcion("Omia", distritosComboBox);
                        agregarOpcion("San Nicolás", distritosComboBox);
                    } else if (provinciaSeleccionada === "Utcubamba") {
                        agregarOpcion("Bagua Grande", distritosComboBox);
                        agregarOpcion("Cajaruro", distritosComboBox);
                        agregarOpcion("Cumba", distritosComboBox);
                        agregarOpcion("El Milagro", distritosComboBox);
                        agregarOpcion("Jamalca", distritosComboBox);
                        agregarOpcion("Lonya Grande", distritosComboBox);
                        agregarOpcion("Yamón", distritosComboBox);
                    } else
                    if (provinciaSeleccionada === "Huaraz") {
                        agregarOpcion("Huaraz", distritosComboBox);
                        agregarOpcion("Cochabamba", distritosComboBox);
                        agregarOpcion("Colcabamba", distritosComboBox);
                        agregarOpcion("Huanchay", distritosComboBox);
                        agregarOpcion("Independencia", distritosComboBox);
                        agregarOpcion("Jangas", distritosComboBox);
                        agregarOpcion("La Libertad", distritosComboBox);
                        agregarOpcion("Olleros", distritosComboBox);
                        agregarOpcion("Pampas Grande", distritosComboBox);
                        agregarOpcion("Pariacoto", distritosComboBox);
                        agregarOpcion("Pira", distritosComboBox);
                        agregarOpcion("Taricá", distritosComboBox);
                        agregarOpcion("Tocachi", distritosComboBox);
                        agregarOpcion("Yuracmarca", distritosComboBox);
                    } else if (provinciaSeleccionada === "Aija") {
                        agregarOpcion("Aija", distritosComboBox);
                        agregarOpcion("Coris", distritosComboBox);
                        agregarOpcion("Huacllán", distritosComboBox);
                        agregarOpcion("La Merced", distritosComboBox);
                        agregarOpcion("Succha", distritosComboBox);
                    } else if (provinciaSeleccionada === "Bolognesi") {
                        agregarOpcion("Chiquián", distritosComboBox);
                        agregarOpcion("Abelardo Pardo Lezameta", distritosComboBox);
                        agregarOpcion("Antonio Raymondi", distritosComboBox);
                        agregarOpcion("Aquia", distritosComboBox);
                        agregarOpcion("Cajacay", distritosComboBox);
                        agregarOpcion("Canis", distritosComboBox);
                        agregarOpcion("Colquioc", distritosComboBox);
                        agregarOpcion("Huallanca", distritosComboBox);
                        agregarOpcion("Huasta", distritosComboBox);
                        agregarOpcion("Mangas", distritosComboBox);
                        agregarOpcion("Pacllón", distritosComboBox);
                        agregarOpcion("San Miguel de Corpanqui", distritosComboBox);
                        agregarOpcion("Ticllos", distritosComboBox);
                    } else if (provinciaSeleccionada === "Carhuaz") {
                        agregarOpcion("Carhuaz", distritosComboBox);
                        agregarOpcion("Acopampa", distritosComboBox);
                        agregarOpcion("Amashca", distritosComboBox);
                        agregarOpcion("Anta", distritosComboBox);
                        agregarOpcion("Ataquero", distritosComboBox);
                        agregarOpcion("Marcara", distritosComboBox);
                        agregarOpcion("Pariahuanca", distritosComboBox);
                        agregarOpcion("San Miguel de Aco", distritosComboBox);
                        agregarOpcion("Shilla", distritosComboBox);
                        agregarOpcion("Tinco", distritosComboBox);
                        agregarOpcion("Yungay", distritosComboBox);
                    } else if (provinciaSeleccionada === "Caraz") {
                        agregarOpcion("Caraz", distritosComboBox);
                        agregarOpcion("Huallanca", distritosComboBox);
                        agregarOpcion("Huata", distritosComboBox);
                        agregarOpcion("Paria", distritosComboBox);
                        agregarOpcion("San Acasio", distritosComboBox);
                        agregarOpcion("Santa Cruz", distritosComboBox);
                        agregarOpcion("Taguasco", distritosComboBox);
                    } else if (provinciaSeleccionada === "Casma") {
                        agregarOpcion("Casma", distritosComboBox);
                        agregarOpcion("Buenavista Alta", distritosComboBox);
                        agregarOpcion("Comandante Noel", distritosComboBox);
                        agregarOpcion("Yaután", distritosComboBox);
                    } else if (provinciaSeleccionada === "Corongo") {
                        agregarOpcion("Corongo", distritosComboBox);
                        agregarOpcion("Aco", distritosComboBox);
                        agregarOpcion("Bambas", distritosComboBox);
                        agregarOpcion("Cusca", distritosComboBox);
                        agregarOpcion("La Pampa", distritosComboBox);
                        agregarOpcion("Pampas Chico", distritosComboBox);
                        agregarOpcion("Yanac", distritosComboBox);
                        agregarOpcion("Yupash", distritosComboBox);
                    } else if (provinciaSeleccionada === "Huari") {
                        agregarOpcion("Huari", distritosComboBox);
                        agregarOpcion("Anra", distritosComboBox);
                        agregarOpcion("Huacachi", distritosComboBox);
                        agregarOpcion("Huacachi", distritosComboBox);
                        agregarOpcion("Huachis", distritosComboBox);
                        agregarOpcion("Huántar", distritosComboBox);
                        agregarOpcion("Masin", distritosComboBox);
                        agregarOpcion("Chavin de Huantar", distritosComboBox);
                        agregarOpcion("San Marcos", distritosComboBox);
                        agregarOpcion("San Pedro de Chana", distritosComboBox);
                        agregarOpcion("Uco", distritosComboBox);
                    } else if (provinciaSeleccionada === "Huarmey") {
                        agregarOpcion("Huarmey", distritosComboBox);
                        agregarOpcion("Culebras", distritosComboBox);
                        agregarOpcion("Huayán", distritosComboBox);
                        agregarOpcion("Malvas", distritosComboBox);
                    } else if (provinciaSeleccionada === "Mariscal Luzuriaga") {
                        agregarOpcion("Piscobamba", distritosComboBox);
                        agregarOpcion("Casca", distritosComboBox);
                        agregarOpcion("Eleazar Guzmán Barrón", distritosComboBox);
                        agregarOpcion("Fidel Olivas Escudero", distritosComboBox);
                        agregarOpcion("Llama", distritosComboBox);
                        agregarOpcion("Llumpa", distritosComboBox);
                        agregarOpcion("Musga", distritosComboBox);
                        agregarOpcion("Piscobamba", distritosComboBox);
                    } else if (provinciaSeleccionada === "Pallasca") {
                        agregarOpcion("Cabana", distritosComboBox);
                        agregarOpcion("Bolognesi", distritosComboBox);
                        agregarOpcion("Conchucos", distritosComboBox);
                        agregarOpcion("Huacaschuque", distritosComboBox);
                        agregarOpcion("Huandoval", distritosComboBox);
                        agregarOpcion("Lacabamba", distritosComboBox);
                        agregarOpcion("Llapo", distritosComboBox);
                        agregarOpcion("Pallasca", distritosComboBox);
                        agregarOpcion("Pampas", distritosComboBox);
                        agregarOpcion("Santa Rosa", distritosComboBox);
                        agregarOpcion("Tauca", distritosComboBox);
                    } else if (provinciaSeleccionada === "Pomabamba") {
                        agregarOpcion("Pomabamba", distritosComboBox);
                        agregarOpcion("Huaccho", distritosComboBox);
                        agregarOpcion("Parobamba", distritosComboBox);
                        agregarOpcion("Quinuabamba", distritosComboBox);
                    } else if (provinciaSeleccionada === "Recuay") {
                        agregarOpcion("Recuay", distritosComboBox);
                        agregarOpcion("Catac", distritosComboBox);
                        agregarOpcion("Cotaparaco", distritosComboBox);
                        agregarOpcion("Huayllapampa", distritosComboBox);
                        agregarOpcion("Llacllín", distritosComboBox);
                        agregarOpcion("Marcará", distritosComboBox);
                        agregarOpcion("Pararin", distritosComboBox);
                    } else if (provinciaSeleccionada === "Santa") {
                        agregarOpcion("Chimbote", distritosComboBox);
                        agregarOpcion("Cáceres del Perú", distritosComboBox);
                        agregarOpcion("Coishco", distritosComboBox);
                        agregarOpcion("Moro", distritosComboBox);
                        agregarOpcion("Nepeña", distritosComboBox);
                        agregarOpcion("Samanco", distritosComboBox);
                        agregarOpcion("Santa", distritosComboBox);
                    } else if (provinciaSeleccionada === "Sihuas") {
                        agregarOpcion("Sihuas", distritosComboBox);
                        agregarOpcion("Acobamba", distritosComboBox);
                        agregarOpcion("Alfonso Ugarte", distritosComboBox);
                        agregarOpcion("Cashapampa", distritosComboBox);
                        agregarOpcion("Chingalpo", distritosComboBox);
                        agregarOpcion("Huayllabamba", distritosComboBox);
                        agregarOpcion("Quiches", distritosComboBox);
                        agregarOpcion("San Juan", distritosComboBox);
                        agregarOpcion("San Pedro de Huacarpana", distritosComboBox);
                    } else if (provinciaSeleccionada === "Yungay") {
                        agregarOpcion("Yungay", distritosComboBox);
                        agregarOpcion("Cascapara", distritosComboBox);
                        agregarOpcion("Mancos", distritosComboBox);
                        agregarOpcion("Matacoto", distritosComboBox);
                        agregarOpcion("Quillo", distritosComboBox);
                        agregarOpcion("Ranrahirca", distritosComboBox);
                        agregarOpcion("Shupluy", distritosComboBox);
                        agregarOpcion("Yanama", distritosComboBox);
                    } else if (provinciaSeleccionada === "Abancay") {
                        agregarOpcion("Abancay", distritosComboBox);
                        agregarOpcion("Chacoche", distritosComboBox);
                        agregarOpcion("Circa", distritosComboBox);
                        agregarOpcion("Huanipaca", distritosComboBox);
                        agregarOpcion("Lambrama", distritosComboBox);
                        agregarOpcion("Pichirhua", distritosComboBox);
                        agregarOpcion("San Pedro de Cachora", distritosComboBox);
                        agregarOpcion("Tamburco", distritosComboBox);
                    } else if (provinciaSeleccionada === "Andahuaylas") {
                        agregarOpcion("Andahuaylas", distritosComboBox);
                        agregarOpcion("Andarapa", distritosComboBox);
                        agregarOpcion("Chiara", distritosComboBox);
                        agregarOpcion("Huancarama", distritosComboBox);
                        agregarOpcion("Huayana", distritosComboBox);
                        agregarOpcion("Kishuara", distritosComboBox);
                        agregarOpcion("Pacobamba", distritosComboBox);
                        agregarOpcion("Pacucha", distritosComboBox);
                        agregarOpcion("Pampachiri", distritosComboBox);
                        agregarOpcion("Pomerape", distritosComboBox);
                        agregarOpcion("San Jerónimo", distritosComboBox);
                        agregarOpcion("San Miguel de Chocce", distritosComboBox);
                        agregarOpcion("Talavera", distritosComboBox);
                        agregarOpcion("Tumay Huaraca", distritosComboBox);
                        agregarOpcion("Turpay", distritosComboBox);
                        agregarOpcion("Vilcabamba", distritosComboBox);
                        agregarOpcion("Vista Alegre", distritosComboBox);
                    } else if (provinciaSeleccionada === "Antabamba") {
                        agregarOpcion("Antabamba", distritosComboBox);
                        agregarOpcion("El Oro", distritosComboBox);
                        agregarOpcion("Huaquirca", distritosComboBox);
                        agregarOpcion("Juan Espinoza Medrano", distritosComboBox);
                        agregarOpcion("Oropesa", distritosComboBox);
                        agregarOpcion("Pachaconas", distritosComboBox);
                        agregarOpcion("Sabaino", distritosComboBox);
                    } else if (provinciaSeleccionada === "Aymaraes") {
                        agregarOpcion("Chalhuanca", distritosComboBox);
                        agregarOpcion("Capaya", distritosComboBox);
                        agregarOpcion("Caraybamba", distritosComboBox);
                        agregarOpcion("Chapimarca", distritosComboBox);
                        agregarOpcion("Cotaarmas", distritosComboBox);
                        agregarOpcion("Ihuayllo", distritosComboBox);
                        agregarOpcion("Justo Apu Sahuaraura", distritosComboBox);
                        agregarOpcion("Lucre", distritosComboBox);
                        agregarOpcion("Pocohuanca", distritosComboBox);
                        agregarOpcion("San Juan de Chacña", distritosComboBox);
                        agregarOpcion("Sañayca", distritosComboBox);
                        agregarOpcion("Soraya", distritosComboBox);
                        agregarOpcion("Tintay", distritosComboBox);
                        agregarOpcion("Toraya", distritosComboBox);
                        agregarOpcion("Yanaca", distritosComboBox);
                    } else if (provinciaSeleccionada === "Cotabambas") {
                        agregarOpcion("Tambobamba", distritosComboBox);
                        agregarOpcion("Cotabambas", distritosComboBox);
                        agregarOpcion("Coyllurqui", distritosComboBox);
                        agregarOpcion("Haquira", distritosComboBox);
                        agregarOpcion("Huanipaca", distritosComboBox);
                        agregarOpcion("Mara", distritosComboBox);
                        agregarOpcion("Pocohuanca", distritosComboBox);
                    } else if (provinciaSeleccionada === "Chincheros") {
                        agregarOpcion("Chincheros", distritosComboBox);
                        agregarOpcion("Anco_Huallo", distritosComboBox);
                        agregarOpcion("Cochahuaico", distritosComboBox);
                        agregarOpcion("Huaccana", distritosComboBox);
                        agregarOpcion("Ongoy", distritosComboBox);
                        agregarOpcion("Ocobamba", distritosComboBox);
                        agregarOpcion("Ranracancha", distritosComboBox);
                        agregarOpcion("Uranmarca", distritosComboBox);
                    } else if (provinciaSeleccionada === "Grau") {
                        agregarOpcion("Chuquibambilla", distritosComboBox);
                        agregarOpcion("Curpahuasi", distritosComboBox);
                        agregarOpcion("Gamarra", distritosComboBox);
                        agregarOpcion("Huayllo", distritosComboBox);
                        agregarOpcion("Mamara", distritosComboBox);
                        agregarOpcion("Micaela Bastidas", distritosComboBox);
                        agregarOpcion("Ocros", distritosComboBox);
                        agregarOpcion("Progreso", distritosComboBox);
                        agregarOpcion("San Antonio", distritosComboBox);
                        agregarOpcion("Santa Rosa", distritosComboBox);
                        agregarOpcion("Turpay", distritosComboBox);
                        agregarOpcion("Vilcabamba", distritosComboBox);
                        agregarOpcion("Virundo", distritosComboBox);
                    } else if (provinciaSeleccionada === "Arequipa") {
                        agregarOpcion("Arequipa", distritosComboBox);
                        agregarOpcion("Alto Selva Alegre", distritosComboBox);
                        agregarOpcion("Cayma", distritosComboBox);
                        agregarOpcion("Cerro Colorado", distritosComboBox);
                        agregarOpcion("Characato", distritosComboBox);
                        agregarOpcion("Chiguata", distritosComboBox);
                        agregarOpcion("Jacobo Hunter", distritosComboBox);
                        agregarOpcion("Jose Luis Bustamante y Rivero", distritosComboBox);
                        agregarOpcion("Mariano Melgar", distritosComboBox);
                        agregarOpcion("Miraflores", distritosComboBox);
                        agregarOpcion("Mollebaya", distritosComboBox);
                        agregarOpcion("Paucarpata", distritosComboBox);
                        agregarOpcion("Pocsi", distritosComboBox);
                        agregarOpcion("Polobaya", distritosComboBox);
                        agregarOpcion("Quequeña", distritosComboBox);
                        agregarOpcion("Sabandia", distritosComboBox);
                        agregarOpcion("Sachaca", distritosComboBox);
                        agregarOpcion("Socabaya", distritosComboBox);
                        agregarOpcion("Tiabaya", distritosComboBox);
                        agregarOpcion("Uchumayo", distritosComboBox);
                        agregarOpcion("Yanahuara", distritosComboBox);
                        agregarOpcion("Yarabamba", distritosComboBox);
                        agregarOpcion("Yura", distritosComboBox);
                    } else if (provinciaSeleccionada === "Camaná") {
                        agregarOpcion("Camaná", distritosComboBox);
                        agregarOpcion("Mariscal Cáceres", distritosComboBox);
                        agregarOpcion("Nicolás de Piérola", distritosComboBox);
                        agregarOpcion("Ocoña", distritosComboBox);
                        agregarOpcion("Quilca", distritosComboBox);
                        agregarOpcion("Samuel Pastor", distritosComboBox);
                    } else if (provinciaSeleccionada === "Caravelí") {
                        agregarOpcion("Caravelí", distritosComboBox);
                        agregarOpcion("Acarí", distritosComboBox);
                        agregarOpcion("Atico", distritosComboBox);
                        agregarOpcion("Atiquipa", distritosComboBox);
                        agregarOpcion("Bella Unión", distritosComboBox);
                        agregarOpcion("Cahuacho", distritosComboBox);
                        agregarOpcion("Chala", distritosComboBox);
                        agregarOpcion("Chapis", distritosComboBox);
                        agregarOpcion("Jaqui", distritosComboBox);
                        agregarOpcion("Lomas", distritosComboBox);
                        agregarOpcion("Quicacha", distritosComboBox);
                        agregarOpcion("Yauca", distritosComboBox);
                    } else if (provinciaSeleccionada === "Castilla") {
                        agregarOpcion("Aplao", distritosComboBox);
                        agregarOpcion("Andagua", distritosComboBox);
                        agregarOpcion("Ayo", distritosComboBox);
                        agregarOpcion("Chachas", distritosComboBox);
                        agregarOpcion("Chilcaymarca", distritosComboBox);
                        agregarOpcion("Iray", distritosComboBox);
                        agregarOpcion("Machaguay", distritosComboBox);
                        agregarOpcion("Orcopampa", distritosComboBox);
                        agregarOpcion("Pampacolca", distritosComboBox);
                        agregarOpcion("Tipán", distritosComboBox);
                        agregarOpcion("Uraca", distritosComboBox);
                        agregarOpcion("Uñón", distritosComboBox);
                        agregarOpcion("Viraco", distritosComboBox);
                    } else if (provinciaSeleccionada === "Caylloma") {
                        agregarOpcion("Chivay", distritosComboBox);
                        agregarOpcion("Achoma", distritosComboBox);
                        agregarOpcion("Cabanaconde", distritosComboBox);
                        agregarOpcion("Callalli", distritosComboBox);
                        agregarOpcion("Caylloma", distritosComboBox);
                        agregarOpcion("Coporaque", distritosComboBox);
                        agregarOpcion("Huambo", distritosComboBox);
                        agregarOpcion("Huanca", distritosComboBox);
                        agregarOpcion("Ichupampa", distritosComboBox);
                        agregarOpcion("Lari", distritosComboBox);
                        agregarOpcion("Lluta", distritosComboBox);
                        agregarOpcion("Maca", distritosComboBox);
                        agregarOpcion("Madrigal", distritosComboBox);
                        agregarOpcion("Sibayo", distritosComboBox);
                        agregarOpcion("Tapay", distritosComboBox);
                        agregarOpcion("Tuti", distritosComboBox);
                        agregarOpcion("Yanque", distritosComboBox);
                    } else if (provinciaSeleccionada === "Condesuyos") {
                        agregarOpcion("Chuquibamba", distritosComboBox);
                        agregarOpcion("Andaray", distritosComboBox);
                        agregarOpcion("Cayarani", distritosComboBox);
                        agregarOpcion("Chichas", distritosComboBox);
                        agregarOpcion("Iray", distritosComboBox);
                        agregarOpcion("Río Grande", distritosComboBox);
                        agregarOpcion("Salamanca", distritosComboBox);
                        agregarOpcion("Yanaquihua", distritosComboBox);
                    } else if (provinciaSeleccionada === "Islay") {
                        agregarOpcion("Mollendo", distritosComboBox);
                        agregarOpcion("Cocachacra", distritosComboBox);
                        agregarOpcion("Deán Valdivia", distritosComboBox);
                        agregarOpcion("Islay", distritosComboBox);
                        agregarOpcion("Mejia", distritosComboBox);
                        agregarOpcion("Punta de Bombón", distritosComboBox);
                        agregarOpcion("Samuel Pastor", distritosComboBox);
                    } else if (provinciaSeleccionada === "La Unión") {
                        agregarOpcion("Cotahuasi", distritosComboBox);
                        agregarOpcion("Alca", distritosComboBox);
                        agregarOpcion("Charcana", distritosComboBox);
                        agregarOpcion("Huaynacotas", distritosComboBox);
                        agregarOpcion("Pampamarca", distritosComboBox);
                        agregarOpcion("Puyca", distritosComboBox);
                        agregarOpcion("Quechualla", distritosComboBox);
                        agregarOpcion("Sayla", distritosComboBox);
                        agregarOpcion("Tauria", distritosComboBox);
                        agregarOpcion("Tomepampa", distritosComboBox);
                        agregarOpcion("Toro", distritosComboBox);
                    } else if (provinciaSeleccionada === "Huamanga") {
                        agregarOpcion("Ayacucho", distritosComboBox);
                        agregarOpcion("Acos Vinchos", distritosComboBox);
                        agregarOpcion("Carmen Alto", distritosComboBox);
                        agregarOpcion("Chiara", distritosComboBox);
                        agregarOpcion("Ocros", distritosComboBox);
                        agregarOpcion("Pacaycasa", distritosComboBox);
                        agregarOpcion("Quinua", distritosComboBox);
                        agregarOpcion("San José de Ticllas", distritosComboBox);
                        agregarOpcion("San Juan Bautista", distritosComboBox);
                        agregarOpcion("Santiago de Pischa", distritosComboBox);
                        agregarOpcion("Socos", distritosComboBox);
                        agregarOpcion("Tambillo", distritosComboBox);
                        agregarOpcion("Vinchos", distritosComboBox);
                        agregarOpcion("Andrés Avelino Cáceres Dorregaray", distritosComboBox);
                    } else if (provinciaSeleccionada === "Cangallo") {
                        agregarOpcion("Cangallo", distritosComboBox);
                        agregarOpcion("Chuschi", distritosComboBox);
                        agregarOpcion("Los Morochucos", distritosComboBox);
                        agregarOpcion("María Parado de Bellido", distritosComboBox);
                        agregarOpcion("Paras", distritosComboBox);
                        agregarOpcion("Totos", distritosComboBox);
                    } else if (provinciaSeleccionada === "Huanca Sancos") {
                        agregarOpcion("Sancos", distritosComboBox);
                        agregarOpcion("Carapo", distritosComboBox);
                        agregarOpcion("Sacsamarca", distritosComboBox);
                        agregarOpcion("Santa Lucía", distritosComboBox);
                    } else if (provinciaSeleccionada === "Huanta") {
                        agregarOpcion("Huanta", distritosComboBox);
                        agregarOpcion("Ayahuanco", distritosComboBox);
                        agregarOpcion("Huamanguilla", distritosComboBox);
                        agregarOpcion("Iguaín", distritosComboBox);
                        agregarOpcion("Luricocha", distritosComboBox);
                        agregarOpcion("Santillana", distritosComboBox);
                        agregarOpcion("Sivia", distritosComboBox);
                    } else if (provinciaSeleccionada === "La Mar") {
                        agregarOpcion("San Francisco", distritosComboBox);
                        agregarOpcion("Ayna", distritosComboBox);
                        agregarOpcion("Chilcas", distritosComboBox);
                        agregarOpcion("Chungui", distritosComboBox);
                        agregarOpcion("Luis Carranza", distritosComboBox);
                        agregarOpcion("San José de Secce", distritosComboBox);
                        agregarOpcion("Santa Rosa", distritosComboBox);
                        agregarOpcion("Tambo", distritosComboBox);
                    } else if (provinciaSeleccionada === "Lucanas") {
                        agregarOpcion("Puquio", distritosComboBox);
                        agregarOpcion("Aucará", distritosComboBox);
                        agregarOpcion("Cabana", distritosComboBox);
                        agregarOpcion("Carmen Salcedo", distritosComboBox);
                        agregarOpcion("Chaviña", distritosComboBox);
                        agregarOpcion("Chipao", distritosComboBox);
                        agregarOpcion("Huac-Huas", distritosComboBox);
                        agregarOpcion("Laramate", distritosComboBox);
                        agregarOpcion("Leoncio Prado", distritosComboBox);
                        agregarOpcion("Sancos", distritosComboBox);
                        agregarOpcion("San Cristóbal", distritosComboBox);
                        agregarOpcion("San Juan", distritosComboBox);
                        agregarOpcion("San Pedro", distritosComboBox);
                        agregarOpcion("San Pedro de Huacarpana", distritosComboBox);
                        agregarOpcion("Santa Ana de Huayca", distritosComboBox);
                        agregarOpcion("Santa Lucía", distritosComboBox);
                        agregarOpcion("Sucapuca", distritosComboBox);
                        agregarOpcion("Vista Alegre", distritosComboBox);
                    } else if (provinciaSeleccionada === "Paucar del Sara Sara") {
                        agregarOpcion("Pausa", distritosComboBox);
                        agregarOpcion("Collacha", distritosComboBox);
                        agregarOpcion("Corculla", distritosComboBox);
                        agregarOpcion("Lampa", distritosComboBox);
                        agregarOpcion("Marcabamba", distritosComboBox);
                        agregarOpcion("Oyolo", distritosComboBox);
                        agregarOpcion("Pararca", distritosComboBox);
                        agregarOpcion("San Francisco de Rivada", distritosComboBox);
                        agregarOpcion("San Francisco de Rivada", distritosComboBox);
                        agregarOpcion("San Pedro de Palcao", distritosComboBox);
                        agregarOpcion("Santa Rosa", distritosComboBox);
                        agregarOpcion("Sucapuca", distritosComboBox);
                        agregarOpcion("Vista Alegre", distritosComboBox);
                    } else if (provinciaSeleccionada === "Sucre") {
                        agregarOpcion("Querobamba", distritosComboBox);
                        agregarOpcion("Belén", distritosComboBox);
                        agregarOpcion("Chalcos", distritosComboBox);
                        agregarOpcion("Huacaña", distritosComboBox);
                        agregarOpcion("Morcolla", distritosComboBox);
                        agregarOpcion("Paico", distritosComboBox);
                        agregarOpcion("San Pedro de Larcay", distritosComboBox);
                        agregarOpcion("San Salvador de Ccochaccasa", distritosComboBox);
                        agregarOpcion("Santiago de Paucaray", distritosComboBox);
                    } else if (provinciaSeleccionada === "Victor Fajardo") {
                        agregarOpcion("Huancapi", distritosComboBox);
                        agregarOpcion("Alcamenca", distritosComboBox);
                        agregarOpcion("Apongo", distritosComboBox);
                        agregarOpcion("Asquipata", distritosComboBox);
                        agregarOpcion("Canaria", distritosComboBox);
                        agregarOpcion("Cayara", distritosComboBox);
                        agregarOpcion("Colca", distritosComboBox);
                        agregarOpcion("Huamanquiquia", distritosComboBox);
                        agregarOpcion("Huancaraylla", distritosComboBox);
                        agregarOpcion("Hualla", distritosComboBox);
                        agregarOpcion("Sarhua", distritosComboBox);
                        agregarOpcion("Vilcanchos", distritosComboBox);
                    } else if (provinciaSeleccionada === "Vilcashuamán") {
                        agregarOpcion("Vilcashuamán", distritosComboBox);
                        agregarOpcion("Accomarca", distritosComboBox);
                        agregarOpcion("Carhuanca", distritosComboBox);
                        agregarOpcion("Concepción", distritosComboBox);
                        agregarOpcion("Huambalpa", distritosComboBox);
                        agregarOpcion("Independencia", distritosComboBox);
                        agregarOpcion("Soras", distritosComboBox);
                        agregarOpcion("Vischongo", distritosComboBox);
                    } else if (provinciaSeleccionada === "Cajamarca") {
                        agregarOpcion("Cajamarca", distritosComboBox);
                        agregarOpcion("Asunción", distritosComboBox);
                        agregarOpcion("Chetilla", distritosComboBox);
                        agregarOpcion("Cospán", distritosComboBox);
                        agregarOpcion("Encañada", distritosComboBox);
                        agregarOpcion("Jesús", distritosComboBox);
                        agregarOpcion("Llacanora", distritosComboBox);
                        agregarOpcion("Los Baños del Inca", distritosComboBox);
                        agregarOpcion("Magdalena", distritosComboBox);
                        agregarOpcion("Matara", distritosComboBox);
                        agregarOpcion("Namora", distritosComboBox);
                        agregarOpcion("San Juan", distritosComboBox);
                    } else if (provinciaSeleccionada === "Cajabamba") {
                        agregarOpcion("Cajabamba", distritosComboBox);
                        agregarOpcion("Cachachi", distritosComboBox);
                        agregarOpcion("Condebamba", distritosComboBox);
                        agregarOpcion("Sitacocha", distritosComboBox);
                    } else if (provinciaSeleccionada === "Celendín") {
                        agregarOpcion("Celendín", distritosComboBox);
                        agregarOpcion("Chumuch", distritosComboBox);
                        agregarOpcion("Cortegana", distritosComboBox);
                        agregarOpcion("Huasmin", distritosComboBox);
                        agregarOpcion("Jorge Chávez", distritosComboBox);
                        agregarOpcion("José Gálvez", distritosComboBox);
                        agregarOpcion("La Libertad de Pallán", distritosComboBox);
                        agregarOpcion("Miguel Iglesias", distritosComboBox);
                        agregarOpcion("Oxamarca", distritosComboBox);
                        agregarOpcion("Sorochuco", distritosComboBox);
                        agregarOpcion("Sucre", distritosComboBox);
                    } else if (provinciaSeleccionada === "Chota") {
                        agregarOpcion("Chota", distritosComboBox);
                        agregarOpcion("Anguía", distritosComboBox);
                        agregarOpcion("Chadin", distritosComboBox);
                        agregarOpcion("Chalamarca", distritosComboBox);
                        agregarOpcion("Chiguirip", distritosComboBox);
                        agregarOpcion("Choropampa", distritosComboBox);
                        agregarOpcion("Cochabamba", distritosComboBox);
                        agregarOpcion("Conchán", distritosComboBox);
                        agregarOpcion("Huambos", distritosComboBox);
                        agregarOpcion("Lajas", distritosComboBox);
                        agregarOpcion("Llama", distritosComboBox);
                        agregarOpcion("Miracosta", distritosComboBox);
                        agregarOpcion("Paccha", distritosComboBox);
                        agregarOpcion("Pión", distritosComboBox);
                        agregarOpcion("Querocoto", distritosComboBox);
                        agregarOpcion("San Juan de Licupis", distritosComboBox);
                        agregarOpcion("Tacabamba", distritosComboBox);
                        agregarOpcion("Tocmoche", distritosComboBox);
                    } else if (provinciaSeleccionada === "Contumazá") {
                        agregarOpcion("Contumazá", distritosComboBox);
                        agregarOpcion("Chilete", distritosComboBox);
                        agregarOpcion("Cupisnique", distritosComboBox);
                        agregarOpcion("Guzmango", distritosComboBox);
                        agregarOpcion("San Benito", distritosComboBox);
                        agregarOpcion("Santa Cruz de Toled", distritosComboBox);
                    } else if (provinciaSeleccionada === "Cutervo") {
                        agregarOpcion("Cutervo", distritosComboBox);
                        agregarOpcion("Callayuc", distritosComboBox);
                        agregarOpcion("Choros", distritosComboBox);
                        agregarOpcion("Cujillo", distritosComboBox);
                        agregarOpcion("La Ramada", distritosComboBox);
                        agregarOpcion("Pimpingos", distritosComboBox);
                        agregarOpcion("Querecotillo", distritosComboBox);
                        agregarOpcion("San Andrés de Cutervo", distritosComboBox);
                        agregarOpcion("San Juan de Cutervo", distritosComboBox);
                        agregarOpcion("San Luis de Lucma", distritosComboBox);
                        agregarOpcion("Santa Cruz", distritosComboBox);
                        agregarOpcion("Santo Domingo de la Capilla", distritosComboBox);
                        agregarOpcion("Santo Tomás", distritosComboBox);
                        agregarOpcion("Socota", distritosComboBox);
                    } else if (provinciaSeleccionada === "Hualgayoc") {
                        agregarOpcion("Bambamarca", distritosComboBox);
                        agregarOpcion("Chugur", distritosComboBox);
                        agregarOpcion("Hualgayoc", distritosComboBox);
                    } else if (provinciaSeleccionada === "Jaén") {
                        agregarOpcion("Jaén", distritosComboBox);
                        agregarOpcion("Bellavista", distritosComboBox);
                        agregarOpcion("Colasay", distritosComboBox);
                        agregarOpcion("Chontali", distritosComboBox);
                        agregarOpcion("Huabal", distritosComboBox);
                        agregarOpcion("Las Pirias", distritosComboBox);
                        agregarOpcion("Pomahuaca", distritosComboBox);
                        agregarOpcion("Pucará", distritosComboBox);
                        agregarOpcion("Sallique", distritosComboBox);
                        agregarOpcion("San Felipe", distritosComboBox);
                        agregarOpcion("San José del Alto", distritosComboBox);
                        agregarOpcion("Santa Rosa", distritosComboBox);
                    } else if (provinciaSeleccionada === "San Ignacio") {
                        agregarOpcion("San Ignacio", distritosComboBox);
                        agregarOpcion("Chirinos", distritosComboBox);
                        agregarOpcion("Huarango", distritosComboBox);
                        agregarOpcion("La Coipa", distritosComboBox);
                        agregarOpcion("Namballe", distritosComboBox);
                        agregarOpcion("San José de Lourdes", distritosComboBox);
                        agregarOpcion("Tabaconas", distritosComboBox);
                    } else if (provinciaSeleccionada === "San Marcos") {
                        agregarOpcion("San Marcos", distritosComboBox);
                        agregarOpcion("Chancay", distritosComboBox);
                        agregarOpcion("Eduardo Villanueva", distritosComboBox);
                        agregarOpcion("Gregorio Pita", distritosComboBox);
                        agregarOpcion("Ichocán", distritosComboBox);
                        agregarOpcion("José Manuel Quiroz", distritosComboBox);
                        agregarOpcion("Pedro Gálvez", distritosComboBox);
                    } else if (provinciaSeleccionada === "San Miguel") {
                        agregarOpcion("San Miguel", distritosComboBox);
                        agregarOpcion("Bolívar", distritosComboBox);
                        agregarOpcion("Calquis", distritosComboBox);
                        agregarOpcion("Catilluc", distritosComboBox);
                        agregarOpcion("El Prado", distritosComboBox);
                        agregarOpcion("La Florida", distritosComboBox);
                        agregarOpcion("Llapa", distritosComboBox);
                        agregarOpcion("Nanchoc", distritosComboBox);
                        agregarOpcion("Nieves", distritosComboBox);
                        agregarOpcion("San Gregorio", distritosComboBox);
                        agregarOpcion("Tongod", distritosComboBox);
                        agregarOpcion("Unión Agua Blanca", distritosComboBox);
                    } else if (provinciaSeleccionada === "San Pablo") {
                        agregarOpcion("San Pablo", distritosComboBox);
                        agregarOpcion("San Bernardino", distritosComboBox);
                        agregarOpcion("San Luis", distritosComboBox);
                        agregarOpcion("Tumbaden", distritosComboBox);
                    } else if (provinciaSeleccionada === "Santa Cruz") {
                        agregarOpcion("Santa Cruz", distritosComboBox);
                        agregarOpcion("Andabamba", distritosComboBox);
                        agregarOpcion("Catache", distritosComboBox);
                        agregarOpcion("Chancaybaños", distritosComboBox);
                        agregarOpcion("La Esperanza", distritosComboBox);
                        agregarOpcion("Ninabamba", distritosComboBox);
                        agregarOpcion("Pulan", distritosComboBox);
                        agregarOpcion("Saucepampa", distritosComboBox);
                        agregarOpcion("Señor de la Caña", distritosComboBox);
                        agregarOpcion("Uticyacu", distritosComboBox);
                    } else if (provinciaSeleccionada === "Cusco") {
                        agregarOpcion("Cusco", distritosComboBox);
                        agregarOpcion("Ccorca", distritosComboBox);
                        agregarOpcion("Poroy", distritosComboBox);
                        agregarOpcion("San Jerónimo", distritosComboBox);
                        agregarOpcion("San Sebastián", distritosComboBox);
                        agregarOpcion("Santiago", distritosComboBox);
                        agregarOpcion("Saylla", distritosComboBox);
                        agregarOpcion("Wanchaq", distritosComboBox);
                    } else if (provinciaSeleccionada === "Acomayo") {
                        agregarOpcion("Acomayo", distritosComboBox);
                        agregarOpcion("Acopia", distritosComboBox);
                        agregarOpcion("Mosoqllaqta", distritosComboBox);
                        agregarOpcion("Pomacanchi", distritosComboBox);
                        agregarOpcion("Rondocan", distritosComboBox);
                        agregarOpcion("Sangarara", distritosComboBox);
                    } else if (provinciaSeleccionada === "Anta") {
                        agregarOpcion("Izcuchaca", distritosComboBox);
                        agregarOpcion("Huarocondo", distritosComboBox);
                        agregarOpcion("Limatambo", distritosComboBox);
                        agregarOpcion("Mollepata", distritosComboBox);
                        agregarOpcion("Pucyura", distritosComboBox);
                        agregarOpcion("Ancahuasi", distritosComboBox);
                        agregarOpcion("Anta", distritosComboBox);
                        agregarOpcion("Cachimayo", distritosComboBox);
                        agregarOpcion("Chinchaypujio", distritosComboBox);
                        agregarOpcion("Huayllabamba", distritosComboBox);
                        agregarOpcion("Urubamba", distritosComboBox);
                    } else if (provinciaSeleccionada === "Calca") {
                        agregarOpcion("Calca", distritosComboBox);
                        agregarOpcion("Coya", distritosComboBox);
                        agregarOpcion("Lamay", distritosComboBox);
                        agregarOpcion("Lares", distritosComboBox);
                        agregarOpcion("Pisac", distritosComboBox);
                        agregarOpcion("San Salvador", distritosComboBox);
                        agregarOpcion("Taray", distritosComboBox);
                        agregarOpcion("Yanatile", distritosComboBox);
                    } else if (provinciaSeleccionada === "Canas") {
                        agregarOpcion("Yanaoca", distritosComboBox);
                        agregarOpcion("Checca", distritosComboBox);
                        agregarOpcion("Kunturkanki", distritosComboBox);
                        agregarOpcion("Langui", distritosComboBox);
                        agregarOpcion("Layo", distritosComboBox);
                        agregarOpcion("Pampamarca", distritosComboBox);
                        agregarOpcion("Quehue", distritosComboBox);
                        agregarOpcion("Tupac Amaru", distritosComboBox);
                    } else if (provinciaSeleccionada === "Canchis") {
                        agregarOpcion("Sicuani", distritosComboBox);
                        agregarOpcion("Checacupe", distritosComboBox);
                        agregarOpcion("Combapata", distritosComboBox);
                        agregarOpcion("Marangani", distritosComboBox);
                        agregarOpcion("Pitumarca", distritosComboBox);
                        agregarOpcion("San Pablo", distritosComboBox);
                        agregarOpcion("San Pedro", distritosComboBox);
                        agregarOpcion("Tinta", distritosComboBox);
                    } else if (provinciaSeleccionada === "Chumbivilcas") {
                        agregarOpcion("Santo Tomás", distritosComboBox);
                        agregarOpcion("Capacmarca", distritosComboBox);
                        agregarOpcion("Chamaca", distritosComboBox);
                        agregarOpcion("Colquemarca", distritosComboBox);
                        agregarOpcion("Livitaca", distritosComboBox);
                        agregarOpcion("Llusco", distritosComboBox);
                        agregarOpcion("Quiñota", distritosComboBox);
                        agregarOpcion("Velille", distritosComboBox);
                    } else if (provinciaSeleccionada === "Espinar") {
                        agregarOpcion("Yauri", distritosComboBox);
                        agregarOpcion("Condoroma", distritosComboBox);
                        agregarOpcion("Coporaque", distritosComboBox);
                        agregarOpcion("Ocoruro", distritosComboBox);
                        agregarOpcion("Pallpata", distritosComboBox);
                        agregarOpcion("Pichigua", distritosComboBox);
                        agregarOpcion("Suyckutambo", distritosComboBox);
                        agregarOpcion("Alto Pichigua", distritosComboBox);
                    } else if (provinciaSeleccionada === "La Convención") {
                        agregarOpcion("Quillabamba", distritosComboBox);
                        agregarOpcion("Echarati", distritosComboBox);
                        agregarOpcion("Huayopata", distritosComboBox);
                        agregarOpcion("Inkawasi", distritosComboBox);
                        agregarOpcion("Kimbiri", distritosComboBox);
                        agregarOpcion("Maranura", distritosComboBox);
                        agregarOpcion("Ocobamba", distritosComboBox);
                        agregarOpcion("Santa Ana", distritosComboBox);
                        agregarOpcion("Vilcabamba", distritosComboBox);
                        agregarOpcion("Pichari", distritosComboBox);
                    } else if (provinciaSeleccionada === "Paruro") {
                        agregarOpcion("Paruro", distritosComboBox);
                        agregarOpcion("Accha", distritosComboBox);
                        agregarOpcion("Ccapi", distritosComboBox);
                        agregarOpcion("Colcha", distritosComboBox);
                        agregarOpcion("Huanoquite", distritosComboBox);
                        agregarOpcion("Omacha", distritosComboBox);
                        agregarOpcion("Paccaritambo", distritosComboBox);
                        agregarOpcion("Pillpinto", distritosComboBox);
                        agregarOpcion("Yaurisque", distritosComboBox);
                    } else if (provinciaSeleccionada === "Paucartambo") {
                        agregarOpcion("Paucartambo", distritosComboBox);
                        agregarOpcion("Challabamba", distritosComboBox);
                        agregarOpcion("Colquepata", distritosComboBox);
                        agregarOpcion("Huancarani", distritosComboBox);
                        agregarOpcion("Kosñipata", distritosComboBox);
                    } else if (provinciaSeleccionada === "Quispicanchi") {
                        agregarOpcion("Urcos", distritosComboBox);
                        agregarOpcion("Andahuaylillas", distritosComboBox);
                        agregarOpcion("Camanti", distritosComboBox);
                        agregarOpcion("Ccarhuayo", distritosComboBox);
                        agregarOpcion("Ccatca", distritosComboBox);
                        agregarOpcion("Cusipata", distritosComboBox);
                        agregarOpcion("Huaro", distritosComboBox);
                        agregarOpcion("Lucre", distritosComboBox);
                        agregarOpcion("Marcapata", distritosComboBox);
                        agregarOpcion("Ocongate", distritosComboBox);
                        agregarOpcion("Oropesa", distritosComboBox);
                        agregarOpcion("Andes", distritosComboBox);
                    } else if (provinciaSeleccionada === "Urubamba") {
                        agregarOpcion("Urubamba", distritosComboBox);
                        agregarOpcion("Chinchero", distritosComboBox);
                        agregarOpcion("Huayllabamba", distritosComboBox);
                        agregarOpcion("Machupicchu", distritosComboBox);
                        agregarOpcion("Maras", distritosComboBox);
                        agregarOpcion("Ollantaytambo", distritosComboBox);
                        agregarOpcion("Yucay", distritosComboBox);
                    } else if (provinciaSeleccionada === "Huancavelica") {
                        agregarOpcion("Huancavelica", distritosComboBox);
                        agregarOpcion("Acobambilla", distritosComboBox);
                        agregarOpcion("Acoria", distritosComboBox);
                        agregarOpcion("Conayca", distritosComboBox);
                        agregarOpcion("Cuenca", distritosComboBox);
                        agregarOpcion("Huachocolpa", distritosComboBox);
                        agregarOpcion("Huanacopampa", distritosComboBox);
                        agregarOpcion("Izcuchaca", distritosComboBox);
                        agregarOpcion("Laria", distritosComboBox);
                        agregarOpcion("Manta", distritosComboBox);
                        agregarOpcion("Mariscal Cáceres", distritosComboBox);
                        agregarOpcion("Nuevo Occoro", distritosComboBox);
                        agregarOpcion("Palca", distritosComboBox);
                        agregarOpcion("Pilchaca", distritosComboBox);
                        agregarOpcion("Vilca", distritosComboBox);
                        agregarOpcion("Yauli", distritosComboBox);
                        agregarOpcion("Ascensión", distritosComboBox);
                    } else if (provinciaSeleccionada === "Acobamba") {
                        agregarOpcion("Acobamba", distritosComboBox);
                        agregarOpcion("Andabamba", distritosComboBox);
                        agregarOpcion("Anta", distritosComboBox);
                        agregarOpcion("Caja", distritosComboBox);
                        agregarOpcion("Marcas", distritosComboBox);
                        agregarOpcion("Paucara", distritosComboBox);
                        agregarOpcion("Pomacocha", distritosComboBox);
                        agregarOpcion("Rosario", distritosComboBox);
                    } else if (provinciaSeleccionada === "Angaraes") {
                        agregarOpcion("Lircay", distritosComboBox);
                        agregarOpcion("Anchonga", distritosComboBox);
                        agregarOpcion("Callanmarca", distritosComboBox);
                        agregarOpcion("Ccochaccasa", distritosComboBox);
                        agregarOpcion("Chinchihuasi", distritosComboBox);
                        agregarOpcion("Congalla", distritosComboBox);
                        agregarOpcion("Huanca-Huanca", distritosComboBox);
                        agregarOpcion("Huayllay Grande", distritosComboBox);
                        agregarOpcion("Julcamarca", distritosComboBox);
                        agregarOpcion("San Antonio de Antaparco", distritosComboBox);
                        agregarOpcion("Santo Domingo de Capillas", distritosComboBox);
                    } else if (provinciaSeleccionada === "Castrovirreyna") {
                        agregarOpcion("Castrovirreyna", distritosComboBox);
                        agregarOpcion("Arma", distritosComboBox);
                        agregarOpcion("Aurahua", distritosComboBox);
                        agregarOpcion("Capillas", distritosComboBox);
                        agregarOpcion("Chupamarca", distritosComboBox);
                        agregarOpcion("Cocharcas", distritosComboBox);
                        agregarOpcion("Huachos", distritosComboBox);
                        agregarOpcion("Huamatambo", distritosComboBox);
                        agregarOpcion("Mollepampa", distritosComboBox);
                        agregarOpcion("San Juan", distritosComboBox);
                        agregarOpcion("Santa Ana", distritosComboBox);
                    } else if (provinciaSeleccionada === "Churcampa") {
                        agregarOpcion("Churcampa", distritosComboBox);
                        agregarOpcion("Anco", distritosComboBox);
                        agregarOpcion("Chinchihuasi", distritosComboBox);
                        agregarOpcion("El Carmen", distritosComboBox);
                        agregarOpcion("La Merced", distritosComboBox);
                        agregarOpcion("Locroja", distritosComboBox);
                        agregarOpcion("San Miguel de Mayocc", distritosComboBox);
                        agregarOpcion("San Pedro de Coris", distritosComboBox);
                    } else if (provinciaSeleccionada === "Huaytará") {
                        agregarOpcion("Huaytará", distritosComboBox);
                        agregarOpcion("Acostambo", distritosComboBox);
                        agregarOpcion("Ahuaycha", distritosComboBox);
                        agregarOpcion("Colcabamba", distritosComboBox);
                        agregarOpcion("Huayacundo Arma", distritosComboBox);
                        agregarOpcion("Laramate", distritosComboBox);
                        agregarOpcion("Ocoyo", distritosComboBox);
                        agregarOpcion("Pilpichaca", distritosComboBox);
                        agregarOpcion("Querco", distritosComboBox);
                        agregarOpcion("San Antonio de Cusicancha", distritosComboBox);
                        agregarOpcion("San Francisco de Sangayaico", distritosComboBox);
                        agregarOpcion("Santiago de Chocorvos", distritosComboBox);
                        agregarOpcion("Santiago de Quirahuara", distritosComboBox);
                        agregarOpcion("Tambo", distritosComboBox);
                    } else if (provinciaSeleccionada === "Tayacaja") {
                        agregarOpcion("Huancavelica", distritosComboBox);
                        agregarOpcion("Acostambo", distritosComboBox);
                        agregarOpcion("Ahuaycha", distritosComboBox);
                        agregarOpcion("Colcabamba", distritosComboBox);
                        agregarOpcion("Huayacundo Arma", distritosComboBox);
                        agregarOpcion("Laramate", distritosComboBox);
                        agregarOpcion("Ocoyo", distritosComboBox);
                        agregarOpcion("Pilpichaca", distritosComboBox);
                        agregarOpcion("Querco", distritosComboBox);
                        agregarOpcion("San Antonio de Cusicancha", distritosComboBox);
                        agregarOpcion("San Francisco de Sangayaico", distritosComboBox);
                        agregarOpcion("Santiago de Chocorvos", distritosComboBox);
                        agregarOpcion("Santiago de Quirahuara", distritosComboBox);
                        agregarOpcion("Tambo", distritosComboBox);
                    } else if (provinciaSeleccionada === "Tayacaja") {
                        agregarOpcion("Huancavelica", distritosComboBox);
                        agregarOpcion("Acostambo", distritosComboBox);
                        agregarOpcion("Ahuaycha", distritosComboBox);
                        agregarOpcion("Colcabamba", distritosComboBox);
                        agregarOpcion("Huayacundo Arma", distritosComboBox);
                        agregarOpcion("Laramate", distritosComboBox);
                        agregarOpcion("Ocoyo", distritosComboBox);
                        agregarOpcion("Pilpichaca", distritosComboBox);
                        agregarOpcion("Querco", distritosComboBox);
                        agregarOpcion("San Antonio de Cusicancha", distritosComboBox);
                        agregarOpcion("San Francisco de Sangayaico", distritosComboBox);
                        agregarOpcion("Santiago de Chocorvos", distritosComboBox);
                        agregarOpcion("Santiago de Quirahuara", distritosComboBox);
                        agregarOpcion("Tambo", distritosComboBox);
                    } else if (provinciaSeleccionada === "Huánuco") {
                        agregarOpcion("Huánuco", distritosComboBox);
                        agregarOpcion("Amarilis", distritosComboBox);
                        agregarOpcion("Chinchao", distritosComboBox);
                        agregarOpcion("Churubamba", distritosComboBox);
                        agregarOpcion("Margos", distritosComboBox);
                        agregarOpcion("Quisqui (Kichki)", distritosComboBox);
                        agregarOpcion("San Francisco de Cayrán", distritosComboBox);
                        agregarOpcion("Santa María del Valle", distritosComboBox);
                        agregarOpcion("Yarumayo", distritosComboBox);
                        agregarOpcion("Pillco Marca", distritosComboBox);
                    } else if (provinciaSeleccionada === "Ambo") {
                        agregarOpcion("Ambo", distritosComboBox);
                        agregarOpcion("Cayna", distritosComboBox);
                        agregarOpcion("Colpas", distritosComboBox);
                        agregarOpcion("Conchamarca", distritosComboBox);
                        agregarOpcion("Huacar", distritosComboBox);
                        agregarOpcion("San Rafael", distritosComboBox);
                        agregarOpcion("Tomay Kichwa", distritosComboBox);
                    } else if (provinciaSeleccionada === "Dos de Mayo") {
                        agregarOpcion("La Unión", distritosComboBox);
                        agregarOpcion("Chuquis", distritosComboBox);
                        agregarOpcion("Marías", distritosComboBox);
                        agregarOpcion("Pachas", distritosComboBox);
                        agregarOpcion("Quivilla", distritosComboBox);
                        agregarOpcion("Ripan", distritosComboBox);
                        agregarOpcion("Shunqui", distritosComboBox);
                        agregarOpcion("Sillapata", distritosComboBox);
                        agregarOpcion("Yanahuanca", distritosComboBox);
                    } else if (provinciaSeleccionada === "Huacaybamba") {
                        agregarOpcion("Huacaybamba", distritosComboBox);
                        agregarOpcion("Canchabamba", distritosComboBox);
                        agregarOpcion("Cochabamba", distritosComboBox);
                        agregarOpcion("Pinra", distritosComboBox);
                    } else if (provinciaSeleccionada === "Huamalíes") {
                        agregarOpcion("Llata", distritosComboBox);
                        agregarOpcion("Arancay", distritosComboBox);
                        agregarOpcion("Chavinillo", distritosComboBox);
                        agregarOpcion("Jacas Chico", distritosComboBox);
                        agregarOpcion("Jircan", distritosComboBox);
                        agregarOpcion("Miraflores", distritosComboBox);
                        agregarOpcion("Punchao", distritosComboBox);
                        agregarOpcion("Puños", distritosComboBox);
                        agregarOpcion("Singa", distritosComboBox);
                        agregarOpcion("Tantamayo", distritosComboBox);
                    } else if (provinciaSeleccionada === "Leoncio Prado") {
                        agregarOpcion("Rupa Rupa", distritosComboBox);
                        agregarOpcion("Daniel Alomía Robles", distritosComboBox);
                        agregarOpcion("Hermilio Valdizán", distritosComboBox);
                        agregarOpcion("José Crespo y Castillo", distritosComboBox);
                        agregarOpcion("Luyando", distritosComboBox);
                        agregarOpcion("Mariano Damaso Beraún", distritosComboBox);
                        agregarOpcion("Pucallpa", distritosComboBox);
                        agregarOpcion("Santa Rosa", distritosComboBox);
                    } else if (provinciaSeleccionada === "Marañón") {
                        agregarOpcion("Huacrachuco", distritosComboBox);
                        agregarOpcion("Cholón", distritosComboBox);
                        agregarOpcion("San Buenaventura", distritosComboBox);
                        agregarOpcion("Yanajanca", distritosComboBox);
                    } else if (provinciaSeleccionada === "Puerto Inca") {
                        agregarOpcion("Puerto Inca", distritosComboBox);
                        agregarOpcion("Codo del Pozuzo", distritosComboBox);
                        agregarOpcion("Honoria", distritosComboBox);
                        agregarOpcion("Tournavista", distritosComboBox);
                        agregarOpcion("Yuyapichis", distritosComboBox);
                    } else if (provinciaSeleccionada === "Pachitea") {
                        agregarOpcion("Panao", distritosComboBox);
                        agregarOpcion("Chaglla", distritosComboBox);
                        agregarOpcion("Molino", distritosComboBox);
                        agregarOpcion("Umari", distritosComboBox);
                    } else if (provinciaSeleccionada === "Yarowilca") {
                        agregarOpcion("Chavinillo", distritosComboBox);
                        agregarOpcion("Cahuac", distritosComboBox);
                        agregarOpcion("Choras", distritosComboBox);
                        agregarOpcion("Jacas Grande", distritosComboBox);
                        agregarOpcion("Jircan", distritosComboBox);
                        agregarOpcion("Miraflores", distritosComboBox);
                        agregarOpcion("Monzon", distritosComboBox);
                        agregarOpcion("Punchao", distritosComboBox);
                        agregarOpcion("Singa", distritosComboBox);
                        agregarOpcion("Tantamayo", distritosComboBox);
                    } else if (provinciaSeleccionada === "Ica") {
                        agregarOpcion("Ica", distritosComboBox);
                        agregarOpcion("La Tinguiña", distritosComboBox);
                        agregarOpcion("Los Aquijes", distritosComboBox);
                        agregarOpcion("Ocucaje", distritosComboBox);
                        agregarOpcion("Parcona", distritosComboBox);
                        agregarOpcion("Pachacutec", distritosComboBox);
                        agregarOpcion("Salas", distritosComboBox);
                        agregarOpcion("San José de Los Molinos", distritosComboBox);
                        agregarOpcion("San Juan Bautista", distritosComboBox);
                        agregarOpcion("Santiago", distritosComboBox);
                        agregarOpcion("Subtanjalla", distritosComboBox);
                        agregarOpcion("Tate", distritosComboBox);
                        agregarOpcion("Pachacutec", distritosComboBox);
                    } else if (provinciaSeleccionada === "Chincha") {
                        agregarOpcion("Chincha Alta", distritosComboBox);
                        agregarOpcion("Alto Larán", distritosComboBox);
                        agregarOpcion("Chavín", distritosComboBox);
                        agregarOpcion("Chincha Baja", distritosComboBox);
                        agregarOpcion("El Carmen", distritosComboBox);
                        agregarOpcion("Grocio Prado", distritosComboBox);
                        agregarOpcion("Pueblo Nuevo", distritosComboBox);
                        agregarOpcion("San Juan de Yanac", distritosComboBox);
                        agregarOpcion("San Pedro de Huacarpana", distritosComboBox);
                        agregarOpcion("Sunampe", distritosComboBox);
                        agregarOpcion("Tambo de Mora", distritosComboBox);
                    } else if (provinciaSeleccionada === "Nasca") {
                        agregarOpcion("Nasca", distritosComboBox);
                        agregarOpcion("Changuillo", distritosComboBox);
                        agregarOpcion("El Ingenio", distritosComboBox);
                        agregarOpcion("Marcona", distritosComboBox);
                        agregarOpcion("Vista Alegre", distritosComboBox);
                    } else if (provinciaSeleccionada === "Palpa") {
                        agregarOpcion("Palpa", distritosComboBox);
                        agregarOpcion("Llipata", distritosComboBox);
                        agregarOpcion("Río Grande", distritosComboBox);
                        agregarOpcion("Santa Cruz", distritosComboBox);
                        agregarOpcion("Tibillo", distritosComboBox);
                    } else if (provinciaSeleccionada === "Pisco") {
                        agregarOpcion("Pisco", distritosComboBox);
                        agregarOpcion("Huancano", distritosComboBox);
                        agregarOpcion("Humay", distritosComboBox);
                        agregarOpcion("Independencia", distritosComboBox);
                        agregarOpcion("Paracas", distritosComboBox);
                        agregarOpcion("San Andrés", distritosComboBox);
                        agregarOpcion("Túpac Amaru Inca", distritosComboBox);
                    } else if (provinciaSeleccionada === "Huancayo") {
                        agregarOpcion("Huancayo", distritosComboBox);
                        agregarOpcion("Chicche", distritosComboBox);
                        agregarOpcion("Chilca", distritosComboBox);
                        agregarOpcion("Chongos Alto", distritosComboBox);
                        agregarOpcion("Chupuro", distritosComboBox);
                        agregarOpcion("Colca", distritosComboBox);
                        agregarOpcion("Cullhuas", distritosComboBox);
                        agregarOpcion("El Tambo", distritosComboBox);
                        agregarOpcion("Hualhuas", distritosComboBox);
                        agregarOpcion("Huacrapuquio", distritosComboBox);
                        agregarOpcion("Huasicancha", distritosComboBox);
                        agregarOpcion("Izcuchaca", distritosComboBox);
                        agregarOpcion("Pariahuanca", distritosComboBox);
                        agregarOpcion("Pilcomayo", distritosComboBox);
                        agregarOpcion("Pucara", distritosComboBox);
                        agregarOpcion("Quichuay", distritosComboBox);
                        agregarOpcion("Quilcas", distritosComboBox);
                        agregarOpcion("San Agustín de Cajas", distritosComboBox);
                        agregarOpcion("Sapallanga", distritosComboBox);
                        agregarOpcion("Santo Domingo de Acobamba", distritosComboBox);
                        agregarOpcion("Saño", distritosComboBox);
                        agregarOpcion("Sicaya", distritosComboBox);
                        agregarOpcion("Viques", distritosComboBox);
                    } else if (provinciaSeleccionada === "Concepción") {
                        agregarOpcion("Concepción", distritosComboBox);
                        agregarOpcion("Aco", distritosComboBox);
                        agregarOpcion("Andamarca", distritosComboBox);
                        agregarOpcion("Chambara", distritosComboBox);
                        agregarOpcion("Cochas", distritosComboBox);
                        agregarOpcion("Comas", distritosComboBox);
                        agregarOpcion("Heroínas Toledo", distritosComboBox);
                        agregarOpcion("Manzanares", distritosComboBox);
                        agregarOpcion("Mariscal Castilla", distritosComboBox);
                        agregarOpcion("Matahuasi", distritosComboBox);
                        agregarOpcion("Mito", distritosComboBox);
                        agregarOpcion("Nueve de Julio", distritosComboBox);
                        agregarOpcion("Orcotuna", distritosComboBox);
                        agregarOpcion("San José de Quero", distritosComboBox);
                        agregarOpcion("Santa Rosa de Ocopa", distritosComboBox);
                    } else if (provinciaSeleccionada === "Chanchamayo") {
                        agregarOpcion("La Merced", distritosComboBox);
                        agregarOpcion("Perene", distritosComboBox);
                        agregarOpcion("Pichanaqui", distritosComboBox);
                        agregarOpcion("San Luis de Shuaro", distritosComboBox);
                        agregarOpcion("San Ramón", distritosComboBox);
                        agregarOpcion("Vítoc", distritosComboBox);
                    } else if (provinciaSeleccionada === "Jauja") {
                        agregarOpcion("Jauja", distritosComboBox);
                        agregarOpcion("Acolla", distritosComboBox);
                        agregarOpcion("Apata", distritosComboBox);
                        agregarOpcion("Ataura", distritosComboBox);
                        agregarOpcion("Canas", distritosComboBox);
                        agregarOpcion("Carhuamayo", distritosComboBox);
                        agregarOpcion("Chunan", distritosComboBox);
                        agregarOpcion("El Mantaro", distritosComboBox);
                        agregarOpcion("Huamali", distritosComboBox);
                        agregarOpcion("Huertas", distritosComboBox);
                        agregarOpcion("Huertas", distritosComboBox);
                        agregarOpcion("Janjaillo", distritosComboBox);
                        agregarOpcion("Llocllapampa", distritosComboBox);
                        agregarOpcion("Molinos", distritosComboBox);
                        agregarOpcion("Monobamba", distritosComboBox);
                        agregarOpcion("Muquiyauyo", distritosComboBox);
                        agregarOpcion("Paccha", distritosComboBox);
                        agregarOpcion("Pancán", distritosComboBox);
                        agregarOpcion("Pomacancha", distritosComboBox);
                        agregarOpcion("Rimac", distritosComboBox);
                        agregarOpcion("Sincos", distritosComboBox);
                        agregarOpcion("Tunan Marca", distritosComboBox);
                        agregarOpcion("Yauyos", distritosComboBox);
                        agregarOpcion("Ricran", distritosComboBox);
                        agregarOpcion("San Pedro de Saño", distritosComboBox);
                        agregarOpcion("San Pedro de Quero", distritosComboBox);
                        agregarOpcion("Santa Isabel de Sisa", distritosComboBox);
                        agregarOpcion("Santa Rosa", distritosComboBox);
                        agregarOpcion("Tarma", distritosComboBox);
                    } else if (provinciaSeleccionada === "Tarma") {
                        agregarOpcion("Tarma", distritosComboBox);
                        agregarOpcion("Acobamba", distritosComboBox);
                        agregarOpcion("Huaricolca", distritosComboBox);
                        agregarOpcion("Huasa Huasi", distritosComboBox);
                        agregarOpcion("La Unión", distritosComboBox);
                        agregarOpcion("Palca", distritosComboBox);
                        agregarOpcion("Palcamayo", distritosComboBox);
                        agregarOpcion("San Pedro de Cajas", distritosComboBox);
                        agregarOpcion("Tapo", distritosComboBox);
                    } else if (provinciaSeleccionada === "Satipo") {
                        agregarOpcion("Satipo", distritosComboBox);
                        agregarOpcion("Coviriali", distritosComboBox);
                        agregarOpcion("Llaylla", distritosComboBox);
                        agregarOpcion("Mazamari", distritosComboBox);
                        agregarOpcion("Pampa Hermosa", distritosComboBox);
                        agregarOpcion("Pangoa", distritosComboBox);
                        agregarOpcion("Río Tambo", distritosComboBox);
                    } else if (provinciaSeleccionada === "Yauli") {
                        agregarOpcion("La Oroya", distritosComboBox);
                        agregarOpcion("Chacapampa", distritosComboBox);
                        agregarOpcion("Huay-Huay", distritosComboBox);
                        agregarOpcion("Marcapomacocha", distritosComboBox);
                        agregarOpcion("Morococha", distritosComboBox);
                        agregarOpcion("Paccha", distritosComboBox);
                        agregarOpcion("Santa Rosa de Sacco", distritosComboBox);
                        agregarOpcion("Suitucancha", distritosComboBox);
                        agregarOpcion("Santa Bárbara de Carhuacayán", distritosComboBox);
                    } else if (provinciaSeleccionada === "Chanchamayo") {
                        agregarOpcion("La Merced", distritosComboBox);
                        agregarOpcion("Pichanaqui", distritosComboBox);
                        agregarOpcion("San Luis de Shuaro", distritosComboBox);
                        agregarOpcion("San Ramón", distritosComboBox);
                        agregarOpcion("Vítoc", distritosComboBox);
                        agregarOpcion("Perené", distritosComboBox);
                    } else if (provinciaSeleccionada === "Trujillo") {
                        agregarOpcion("Trujillo", distritosComboBox);
                        agregarOpcion("El Porvenir", distritosComboBox);
                        agregarOpcion("Florencia de Mora", distritosComboBox);
                        agregarOpcion("Huanchaco", distritosComboBox);
                        agregarOpcion("La Esperanza", distritosComboBox);
                        agregarOpcion("Laredo", distritosComboBox);
                        agregarOpcion("Moche", distritosComboBox);
                        agregarOpcion("Poroto", distritosComboBox);
                        agregarOpcion("Salaverry", distritosComboBox);
                        agregarOpcion("Simbal", distritosComboBox);
                        agregarOpcion("Victor Larco Herrera", distritosComboBox);
                    } else if (provinciaSeleccionada === "Ascope") {
                        agregarOpcion("Ascope", distritosComboBox);
                        agregarOpcion("Casa Grande", distritosComboBox);
                        agregarOpcion("Chicama", distritosComboBox);
                        agregarOpcion("Chocope", distritosComboBox);
                        agregarOpcion("Magdalena de Cao", distritosComboBox);
                        agregarOpcion("Paiján", distritosComboBox);
                        agregarOpcion("Rázuri", distritosComboBox);
                        agregarOpcion("Santiago de Cao", distritosComboBox);
                    } else if (provinciaSeleccionada === "Bolívar") {
                        agregarOpcion("Bolívar", distritosComboBox);
                        agregarOpcion("Buldibuyo", distritosComboBox);
                        agregarOpcion("Conchucos", distritosComboBox);
                        agregarOpcion("Huallaga", distritosComboBox);
                        agregarOpcion("Huaylillas", distritosComboBox);
                        agregarOpcion("Motil", distritosComboBox);
                        agregarOpcion("Pias", distritosComboBox);
                        agregarOpcion("Santiago de Chuco", distritosComboBox);
                        agregarOpcion("Tayabamba", distritosComboBox);
                        agregarOpcion("Urpay", distritosComboBox);
                    } else if (provinciaSeleccionada === "Chepén") {
                        agregarOpcion("Chepén", distritosComboBox);
                        agregarOpcion("Pacanga", distritosComboBox);
                        agregarOpcion("Pueblo Nuevo", distritosComboBox);
                    } else if (provinciaSeleccionada === "Julcán") {
                        agregarOpcion("Julcán", distritosComboBox);
                        agregarOpcion("Calamarca", distritosComboBox);
                        agregarOpcion("Carabamba", distritosComboBox);
                        agregarOpcion("Huaso", distritosComboBox);
                        agregarOpcion("Santa Cruz de Toledo", distritosComboBox);
                    } else if (provinciaSeleccionada === "Otuzco") {
                        agregarOpcion("Otuzco", distritosComboBox);
                        agregarOpcion("Agallpampa", distritosComboBox);
                        agregarOpcion("Charat", distritosComboBox);
                        agregarOpcion("Huaranchal", distritosComboBox);
                        agregarOpcion("La Cuesta", distritosComboBox);
                        agregarOpcion("Mache", distritosComboBox);
                        agregarOpcion("Paranday", distritosComboBox);
                        agregarOpcion("Salpo", distritosComboBox);
                        agregarOpcion("Sinsicap", distritosComboBox);
                        agregarOpcion("Usquil", distritosComboBox);
                    } else if (provinciaSeleccionada === "Pácasmayo") {
                        agregarOpcion("San Pedro de Lloc", distritosComboBox);
                        agregarOpcion("Guadalupito", distritosComboBox);
                        agregarOpcion("Jequetepeque", distritosComboBox);
                        agregarOpcion("Pacasmayo", distritosComboBox);
                        agregarOpcion("San José", distritosComboBox);
                    } else if (provinciaSeleccionada === "Sánchez Carrión") {
                        agregarOpcion("Huamachuco", distritosComboBox);
                        agregarOpcion("Chugay", distritosComboBox);
                        agregarOpcion("Cochabamba", distritosComboBox);
                        agregarOpcion("Curgos", distritosComboBox);
                        agregarOpcion("Huacaspata", distritosComboBox);
                        agregarOpcion("Mollepata", distritosComboBox);
                        agregarOpcion("Quiruvilca", distritosComboBox);
                        agregarOpcion("Sanagorán", distritosComboBox);
                        agregarOpcion("Sarín", distritosComboBox);
                        agregarOpcion("Sartimbamba", distritosComboBox);
                    } else if (provinciaSeleccionada === "Santiago de Chuco") {
                        agregarOpcion("Santiago de Chuco", distritosComboBox);
                        agregarOpcion("Angasmarca", distritosComboBox);
                        agregarOpcion("Cachicadán", distritosComboBox);
                        agregarOpcion("Mollebamba", distritosComboBox);
                        agregarOpcion("Mollepata", distritosComboBox);
                        agregarOpcion("Quiruvilca", distritosComboBox);
                        agregarOpcion("Santa Cruz de Toledo", distritosComboBox);
                        agregarOpcion("Santa Rosa", distritosComboBox);
                        agregarOpcion("Santiago de Chuco", distritosComboBox);
                        agregarOpcion("Sarín", distritosComboBox);
                        agregarOpcion("Sartimbamba", distritosComboBox);
                    } else if (provinciaSeleccionada === "Gran Chimú") {
                        agregarOpcion("Cascas", distritosComboBox);
                        agregarOpcion("Lucma", distritosComboBox);
                        agregarOpcion("Marmot", distritosComboBox);
                        agregarOpcion("Mollepata", distritosComboBox);
                    } else if (provinciaSeleccionada === "Virú") {
                        agregarOpcion("Virú", distritosComboBox);
                        agregarOpcion("Chao", distritosComboBox);
                        agregarOpcion("Guadalupito", distritosComboBox);
                    } else if (provinciaSeleccionada === "Chiclayo") {
                        agregarOpcion("Chiclayo", distritosComboBox);
                        agregarOpcion("Chongoyape", distritosComboBox);
                        agregarOpcion("Eten", distritosComboBox);
                        agregarOpcion("Eten Puerto", distritosComboBox);
                        agregarOpcion("José Leonardo Ortiz", distritosComboBox);
                        agregarOpcion("La Victoria", distritosComboBox);
                        agregarOpcion("Lagunas", distritosComboBox);
                        agregarOpcion("Monsefú", distritosComboBox);
                        agregarOpcion("Nueva Arica", distritosComboBox);
                        agregarOpcion("Oyotún", distritosComboBox);
                        agregarOpcion("Pimentel", distritosComboBox);
                        agregarOpcion("Pomalca", distritosComboBox);
                        agregarOpcion("Pucalá", distritosComboBox);
                        agregarOpcion("Reque", distritosComboBox);
                        agregarOpcion("Santa Rosa", distritosComboBox);
                        agregarOpcion("Saños", distritosComboBox);
                    } else if (provinciaSeleccionada === "Ferreñafe") {
                        agregarOpcion("Ferreñafe", distritosComboBox);
                        agregarOpcion("Cañaris", distritosComboBox);
                        agregarOpcion("Incahuasi", distritosComboBox);
                        agregarOpcion("Manuel Antonio Mesones Muro", distritosComboBox);
                        agregarOpcion("Pítipo", distritosComboBox);
                        agregarOpcion("Pueblo Nuevo", distritosComboBox);
                    } else if (provinciaSeleccionada === "Lambayeque") {
                        agregarOpcion("Lambayeque", distritosComboBox);
                        agregarOpcion("Chochope", distritosComboBox);
                        agregarOpcion("Illimo", distritosComboBox);
                        agregarOpcion("Jayanca", distritosComboBox);
                        agregarOpcion("Mochumí", distritosComboBox);
                        agregarOpcion("Mórrope", distritosComboBox);
                        agregarOpcion("Motupe", distritosComboBox);
                        agregarOpcion("Olmos", distritosComboBox);
                        agregarOpcion("Pacora", distritosComboBox);
                        agregarOpcion("Salas", distritosComboBox);
                        agregarOpcion("San José", distritosComboBox);
                        agregarOpcion("Túcume", distritosComboBox);
                    } else if (provinciaSeleccionada === "Lima") {
                        agregarOpcion("Ancón", distritosComboBox);
                        agregarOpcion("Ate", distritosComboBox);
                        agregarOpcion("Barranco", distritosComboBox);
                        agregarOpcion("Breña", distritosComboBox);
                        agregarOpcion("Carabayllo", distritosComboBox);
                        agregarOpcion("Chaclacayo", distritosComboBox);
                        agregarOpcion("Chorrillos", distritosComboBox);
                        agregarOpcion("Cieneguilla", distritosComboBox);
                        agregarOpcion("Comas", distritosComboBox);
                        agregarOpcion("El Agustino", distritosComboBox);
                        agregarOpcion("Independencia", distritosComboBox);
                        agregarOpcion("Jesús María", distritosComboBox);
                        agregarOpcion("La Molina", distritosComboBox);
                        agregarOpcion("La Victoria", distritosComboBox);
                        agregarOpcion("Lima", distritosComboBox);
                        agregarOpcion("Lince", distritosComboBox);
                        agregarOpcion("Los Olivos", distritosComboBox);
                        agregarOpcion("Lurigancho", distritosComboBox);
                        agregarOpcion("Lurín", distritosComboBox);
                        agregarOpcion("Magdalena del Mar", distritosComboBox);
                        agregarOpcion("Miraflores", distritosComboBox);
                        agregarOpcion("Pachacámac", distritosComboBox);
                        agregarOpcion("Pucusana", distritosComboBox);
                        agregarOpcion("Pueblo Libre", distritosComboBox);
                        agregarOpcion("Puente Piedra", distritosComboBox);
                        agregarOpcion("Punta Hermosa", distritosComboBox);
                        agregarOpcion("Punta Negra", distritosComboBox);
                        agregarOpcion("Rímac", distritosComboBox);
                        agregarOpcion("San Bartolo", distritosComboBox);
                        agregarOpcion("San Borja", distritosComboBox);
                        agregarOpcion("San Isidro", distritosComboBox);
                        agregarOpcion("San Juan de Lurigancho", distritosComboBox);
                        agregarOpcion("San Juan de Miraflores", distritosComboBox);
                        agregarOpcion("San Luis", distritosComboBox);
                        agregarOpcion("San Martín de Porres", distritosComboBox);
                        agregarOpcion("San Miguel", distritosComboBox);
                        agregarOpcion("Santa Anita", distritosComboBox);
                        agregarOpcion("Santa María del Mar", distritosComboBox);
                        agregarOpcion("Santiago de Surco", distritosComboBox);
                        agregarOpcion("Surquillo", distritosComboBox);
                        agregarOpcion("Villa El Salvador", distritosComboBox);
                        agregarOpcion("Villa María del Triunfo", distritosComboBox);
                    }
                    // Provincia de Huaral
                    else if (provinciaSeleccionada === "Huaral") {
                        agregarOpcion("Huaral", distritosComboBox);
                        agregarOpcion("Atavillos Alto", distritosComboBox);
                        agregarOpcion("Atavillos Bajo", distritosComboBox);
                        agregarOpcion("Aucallama", distritosComboBox);
                        agregarOpcion("Chancay", distritosComboBox);
                        agregarOpcion("Ihuari", distritosComboBox);
                        agregarOpcion("Lampían", distritosComboBox);
                        agregarOpcion("Pacaraos", distritosComboBox);
                        agregarOpcion("Sumbilca", distritosComboBox);
                        agregarOpcion("Veintisiete de Noviembre", distritosComboBox);
                    }
                    // Provincia de Huaura
                    else if (provinciaSeleccionada === "Huaura") {
                        agregarOpcion("Huacho", distritosComboBox);
                        agregarOpcion("Ambar", distritosComboBox);
                        agregarOpcion("Caleta de Carquín", distritosComboBox);
                        agregarOpcion("Checras", distritosComboBox);
                        agregarOpcion("Hualmay", distritosComboBox);
                        agregarOpcion("Huaura", distritosComboBox);
                        agregarOpcion("Leoncio Prado", distritosComboBox);
                        agregarOpcion("Paccho", distritosComboBox);
                        agregarOpcion("Santa Leonor", distritosComboBox);
                        agregarOpcion("Sayán", distritosComboBox);
                        agregarOpcion("Végueta", distritosComboBox);
                    }
                    // Provincia de Barranca
                    else if (provinciaSeleccionada === "Barranca") {
                        agregarOpcion("Barranca", distritosComboBox);
                        agregarOpcion("Paramonga", distritosComboBox);
                        agregarOpcion("Pativilca", distritosComboBox);
                        agregarOpcion("Supe", distritosComboBox);
                        agregarOpcion("Supe Puerto", distritosComboBox);
                    }
                    // Provincia de Canta
                    else if (provinciaSeleccionada === "Canta") {
                        agregarOpcion("Canta", distritosComboBox);
                        agregarOpcion("Arahuay", distritosComboBox);
                        agregarOpcion("Huamantanga", distritosComboBox);
                        agregarOpcion("Huaros", distritosComboBox);
                        agregarOpcion("San Buenaventura", distritosComboBox);
                        agregarOpcion("Santa Rosa de Quives", distritosComboBox);
                    }
                    // Provincia de Cañete
                    else if (provinciaSeleccionada === "Cañete") {
                        agregarOpcion("San Vicente de Cañete", distritosComboBox);
                        agregarOpcion("Asia", distritosComboBox);
                        agregarOpcion("Calango", distritosComboBox);
                        agregarOpcion("Cerro Azul", distritosComboBox);
                        agregarOpcion("Chilca", distritosComboBox);
                        agregarOpcion("Coayllo", distritosComboBox);
                        agregarOpcion("Imperial", distritosComboBox);
                        agregarOpcion("Lunahuaná", distritosComboBox);
                        agregarOpcion("Mala", distritosComboBox);
                        agregarOpcion("Nuevo Imperial", distritosComboBox);
                        agregarOpcion("Pacarán", distritosComboBox);
                        agregarOpcion("Quilmaná", distritosComboBox);
                        agregarOpcion("San Antonio", distritosComboBox);
                        agregarOpcion("San Luis", distritosComboBox);
                        agregarOpcion("Santa Cruz de Flores", distritosComboBox);
                        agregarOpcion("Zúñiga", distritosComboBox);
                    } else if (provinciaSeleccionada === "Maynas") {
                        agregarOpcion("Iquitos", distritosComboBox);
                        agregarOpcion("Alto Nanay", distritosComboBox);
                        agregarOpcion("Fernando Lores", distritosComboBox);
                        agregarOpcion("Indiana", distritosComboBox);
                        agregarOpcion("Las Amazonas", distritosComboBox);
                        agregarOpcion("Mazán", distritosComboBox);
                        agregarOpcion("Napo", distritosComboBox);
                        agregarOpcion("Punchana", distritosComboBox);
                        agregarOpcion("Putumayo", distritosComboBox);
                        agregarOpcion("San Juan Bautista", distritosComboBox);
                        agregarOpcion("Torres Causana", distritosComboBox);
                        agregarOpcion("Belén", distritosComboBox);
                    } else if (provinciaSeleccionada === "Alto Amazonas") {
                        agregarOpcion("Yurimaguas", distritosComboBox);
                        agregarOpcion("Balsapuerto", distritosComboBox);
                        agregarOpcion("Barranca", distritosComboBox);
                        agregarOpcion("Jeberos", distritosComboBox);
                        agregarOpcion("Lagunas", distritosComboBox);
                        agregarOpcion("Morona", distritosComboBox);
                        agregarOpcion("Pastaza", distritosComboBox);
                        agregarOpcion("Santa Cruz", distritosComboBox);
                        agregarOpcion("Teniente César López Rojas", distritosComboBox);
                    } else if (provinciaSeleccionada === "Requena") {
                        agregarOpcion("Requena", distritosComboBox);
                        agregarOpcion("Alto Tapiche", distritosComboBox);
                        agregarOpcion("Capelo", distritosComboBox);
                        agregarOpcion("Emilio San Martín", distritosComboBox);
                        agregarOpcion("Maquía", distritosComboBox);
                        agregarOpcion("Puín de Chambira", distritosComboBox);
                        agregarOpcion("Saquena", distritosComboBox);
                        agregarOpcion("Soplin", distritosComboBox);
                        agregarOpcion("Tapiche", distritosComboBox);
                        agregarOpcion("Jenaro Herrera", distritosComboBox);
                        agregarOpcion("Yaquerana", distritosComboBox);
                    } else if (provinciaSeleccionada === "Loreto") {
                        agregarOpcion("Nauta", distritosComboBox);
                        agregarOpcion("Parinari", distritosComboBox);
                        agregarOpcion("Tigre", distritosComboBox);
                        agregarOpcion("Trompeteros", distritosComboBox);
                        agregarOpcion("Urarina", distritosComboBox);
                    } else if (provinciaSeleccionada === "Mariscal Ramón Castilla") {
                        agregarOpcion("Ramón Castilla", distritosComboBox);
                        agregarOpcion("Pebas", distritosComboBox);
                        agregarOpcion("Yavarí", distritosComboBox);
                        agregarOpcion("San Pablo", distritosComboBox);
                    } else if (provinciaSeleccionada === "Datem del Marañón") {
                        agregarOpcion("San Lorenzo", distritosComboBox);
                        agregarOpcion("Barranca", distritosComboBox);
                        agregarOpcion("Pastaza", distritosComboBox);
                        agregarOpcion("Andoas", distritosComboBox);
                        agregarOpcion("Morona", distritosComboBox);
                    } else if (provinciaSeleccionada === "Ucayali") {
                        agregarOpcion("Contamana", distritosComboBox);
                        agregarOpcion("Padre Márquez", distritosComboBox);
                        agregarOpcion("Pampa Hermosa", distritosComboBox);
                        agregarOpcion("Sarayacu", distritosComboBox);
                        agregarOpcion("Vargas Guerra", distritosComboBox);
                    } else if (provinciaSeleccionada === "Putumayo") {
                        agregarOpcion("Putumayo", distritosComboBox);
                        agregarOpcion("Rosa Panduro", distritosComboBox);
                        agregarOpcion("Teniente Manuel Clavero", distritosComboBox);
                    } else if (provinciaSeleccionada === "Tambopata") {
                        agregarOpcion("Puerto Maldonado", distritosComboBox);
                        agregarOpcion("Inambari", distritosComboBox);
                        agregarOpcion("Las Piedras", distritosComboBox);
                        agregarOpcion("Laberi", distritosComboBox);
                        agregarOpcion("Tambopata", distritosComboBox);
                    } else if (provinciaSeleccionada === "Manu") {
                        agregarOpcion("Manu", distritosComboBox);
                        agregarOpcion("Fitzcarrald", distritosComboBox);
                        agregarOpcion("Madre de Dios", distritosComboBox);
                        agregarOpcion("Huepetuhe", distritosComboBox);
                    } else if (provinciaSeleccionada === "Tahuamanu") {
                        agregarOpcion("Iberia", distritosComboBox);
                        agregarOpcion("Iñapari", distritosComboBox);
                        agregarOpcion("Tahuamanu", distritosComboBox);
                    } else if (provinciaSeleccionada === "Mariscal Nieto") {
                        agregarOpcion("Moquegua", distritosComboBox);
                        agregarOpcion("Carumas", distritosComboBox);
                        agregarOpcion("Cuchumbaya", distritosComboBox);
                        agregarOpcion("Samegua", distritosComboBox);
                        agregarOpcion("San Cristóbal Calacoa", distritosComboBox);
                        agregarOpcion("Torata", distritosComboBox);
                    } else if (provinciaSeleccionada === "General Sánchez Cerro") {
                        agregarOpcion("Omate", distritosComboBox);
                        agregarOpcion("Chojata", distritosComboBox);
                        agregarOpcion("Coalaque", distritosComboBox);
                        agregarOpcion("Ichuña", distritosComboBox);
                        agregarOpcion("La Capilla", distritosComboBox);
                        agregarOpcion("Lloque", distritosComboBox);
                        agregarOpcion("Matalaque", distritosComboBox);
                        agregarOpcion("Puquina", distritosComboBox);
                        agregarOpcion("Quinistaquillas", distritosComboBox);
                        agregarOpcion("Ubinas", distritosComboBox);
                        agregarOpcion("Yunga", distritosComboBox);
                    } else if (provinciaSeleccionada === "Ilo") {
                        agregarOpcion("Ilo", distritosComboBox);
                        agregarOpcion("El Algarrobal", distritosComboBox);
                        agregarOpcion("Pacocha", distritosComboBox);
                    } else if (provinciaSeleccionada === "Pasco") {
                        agregarOpcion("Chaupimarca", distritosComboBox);
                        agregarOpcion("Huachón", distritosComboBox);
                        agregarOpcion("Huariaca", distritosComboBox);
                        agregarOpcion("Huayllay", distritosComboBox);
                        agregarOpcion("Ninacaca", distritosComboBox);
                        agregarOpcion("Pallanchacra", distritosComboBox);
                        agregarOpcion("Paucartambo", distritosComboBox);
                        agregarOpcion("San Francisco de Yarusyacán", distritosComboBox);
                        agregarOpcion("Simón Bolívar", distritosComboBox);
                        agregarOpcion("Ticlacayan", distritosComboBox);
                        agregarOpcion("Tinyahuarco", distritosComboBox);
                        agregarOpcion("Vicco", distritosComboBox);
                        agregarOpcion("Yanacancha", distritosComboBox);
                    } else if (provinciaSeleccionada === "Daniel Alcides Carrión") {
                        agregarOpcion("Yanahuanca", distritosComboBox);
                        agregarOpcion("Chacayán", distritosComboBox);
                        agregarOpcion("Goyllarisquizga", distritosComboBox);
                        agregarOpcion("Paucar", distritosComboBox);
                        agregarOpcion("San Pedro de Pillao", distritosComboBox);
                        agregarOpcion("Santa Ana de Tusi", distritosComboBox);
                        agregarOpcion("Tapuc", distritosComboBox);
                        agregarOpcion("Vilcabamba", distritosComboBox);
                    } else if (provinciaSeleccionada === "Oxapampa") {
                        agregarOpcion("Oxapampa", distritosComboBox);
                        agregarOpcion("Chontabamba", distritosComboBox);
                        agregarOpcion("Huancabamba", distritosComboBox);
                        agregarOpcion("Palcazú", distritosComboBox);
                        agregarOpcion("Pozuzo", distritosComboBox);
                        agregarOpcion("Puerto Bermúdez", distritosComboBox);
                        agregarOpcion("Villa Rica", distritosComboBox);
                    } else if (provinciaSeleccionada === "Piura") {
                        agregarOpcion("Piura", distritosComboBox);
                        agregarOpcion("Castilla", distritosComboBox);
                        agregarOpcion("Catacaos", distritosComboBox);
                        agregarOpcion("Cura Mori", distritosComboBox);
                        agregarOpcion("El Tallán", distritosComboBox);
                        agregarOpcion("La Arena", distritosComboBox);
                        agregarOpcion("La Unión", distritosComboBox);
                        agregarOpcion("Las Lomas", distritosComboBox);
                        agregarOpcion("Tambogrande", distritosComboBox);
                        agregarOpcion("Tambo Grande", distritosComboBox);
                        agregarOpcion("26 de Octubre", distritosComboBox);
                    } else if (provinciaSeleccionada === "Sullana") {
                        agregarOpcion("Sullana", distritosComboBox);
                        agregarOpcion("Bellavista", distritosComboBox);
                        agregarOpcion("Ignacio Escudero", distritosComboBox);
                        agregarOpcion("Lancones", distritosComboBox);
                        agregarOpcion("Marcavelica", distritosComboBox);
                        agregarOpcion("Miguel Checa", distritosComboBox);
                        agregarOpcion("Querecotillo", distritosComboBox);
                        agregarOpcion("Salitral", distritosComboBox);
                    } else if (provinciaSeleccionada === "Paita") {
                        agregarOpcion("Paita", distritosComboBox);
                        agregarOpcion("Amotape", distritosComboBox);
                        agregarOpcion("Colán", distritosComboBox);
                        agregarOpcion("La Huaca", distritosComboBox);
                        agregarOpcion("Tamarindo", distritosComboBox);
                        agregarOpcion("Vichayal", distritosComboBox);
                    } else if (provinciaSeleccionada === "Talara") {
                        agregarOpcion("Talara", distritosComboBox);
                        agregarOpcion("El Alto", distritosComboBox);
                        agregarOpcion("La Brea", distritosComboBox);
                        agregarOpcion("Lobitos", distritosComboBox);
                        agregarOpcion("Máncora", distritosComboBox);
                        agregarOpcion("Pariñas", distritosComboBox);
                    } else if (provinciaSeleccionada === "Morropon") {
                        agregarOpcion("Chulucanas", distritosComboBox);
                        agregarOpcion("Buenos Aires", distritosComboBox);
                        agregarOpcion("Chalaco", distritosComboBox);
                        agregarOpcion("La Matanza", distritosComboBox);
                        agregarOpcion("Morropón", distritosComboBox);
                        agregarOpcion("Salitral", distritosComboBox);
                        agregarOpcion("San Juan de Bigote", distritosComboBox);
                        agregarOpcion("Santa Catalina de Mossa", distritosComboBox);
                        agregarOpcion("Santo Domingo", distritosComboBox);
                        agregarOpcion("Yamango", distritosComboBox);
                    } else if (provinciaSeleccionada === "Sechura") {
                        agregarOpcion("Sechura", distritosComboBox);
                        agregarOpcion("Bellavista de la Unión", distritosComboBox);
                        agregarOpcion("Bernal", distritosComboBox);
                        agregarOpcion("Cristo Nos Valga", distritosComboBox);
                        agregarOpcion("Vice", distritosComboBox);
                        agregarOpcion("Rinconada", distritosComboBox);
                    } else if (provinciaSeleccionada === "Ayabaca") {
                        agregarOpcion("Ayabaca", distritosComboBox);
                        agregarOpcion("Frias", distritosComboBox);
                        agregarOpcion("Jilili", distritosComboBox);
                        agregarOpcion("Lagunas", distritosComboBox);
                        agregarOpcion("Montero", distritosComboBox);
                        agregarOpcion("Pacaipampa", distritosComboBox);
                        agregarOpcion("Paimas", distritosComboBox);
                        agregarOpcion("Sicchez", distritosComboBox);
                        agregarOpcion("Suyo", distritosComboBox);
                    } else if (provinciaSeleccionada === "Huancabamba") {
                        agregarOpcion("Huancabamba", distritosComboBox);
                        agregarOpcion("Canchaque", distritosComboBox);
                        agregarOpcion("El Carmen de la Frontera", distritosComboBox);
                        agregarOpcion("Huarmaca", distritosComboBox);
                        agregarOpcion("Lalaquiz", distritosComboBox);
                        agregarOpcion("San Miguel del Faique", distritosComboBox);
                        agregarOpcion("Sonora", distritosComboBox);
                    } else if (provinciaSeleccionada === "Puno") {
                        agregarOpcion("Puno", distritosComboBox);
                        agregarOpcion("Acora", distritosComboBox);
                        agregarOpcion("Amantaní", distritosComboBox);
                        agregarOpcion("Atuncolla", distritosComboBox);
                        agregarOpcion("Capachica", distritosComboBox);
                        agregarOpcion("Chucuito", distritosComboBox);
                        agregarOpcion("Coata", distritosComboBox);
                        agregarOpcion("Huata", distritosComboBox);
                        agregarOpcion("Mañazo", distritosComboBox);
                        agregarOpcion("Paucarcolla", distritosComboBox);
                        agregarOpcion("Pichacani", distritosComboBox);
                        agregarOpcion("Platería", distritosComboBox);
                        agregarOpcion("San Antonio", distritosComboBox);
                        agregarOpcion("Tiquillaca", distritosComboBox);
                        agregarOpcion("Vilque", distritosComboBox);
                    } else if (provinciaSeleccionada === "Azángaro") {
                        agregarOpcion("Azángaro", distritosComboBox);
                        agregarOpcion("Asillo", distritosComboBox);
                        agregarOpcion("Caminaca", distritosComboBox);
                        agregarOpcion("Chupa", distritosComboBox);
                        agregarOpcion("José Domingo Choquehuanca", distritosComboBox);
                        agregarOpcion("Muñani", distritosComboBox);
                        agregarOpcion("Potoni", distritosComboBox);
                        agregarOpcion("Saman", distritosComboBox);
                        agregarOpcion("San Anton", distritosComboBox);
                        agregarOpcion("San José", distritosComboBox);
                        agregarOpcion("San Juan de Salinas", distritosComboBox);
                        agregarOpcion("Santiago de Pupuja", distritosComboBox);
                        agregarOpcion("Tirapata", distritosComboBox);
                    } else if (provinciaSeleccionada === "Carabaya") {
                        agregarOpcion("Macusani", distritosComboBox);
                        agregarOpcion("Ajoyani", distritosComboBox);
                        agregarOpcion("Ayapata", distritosComboBox);
                        agregarOpcion("Corani", distritosComboBox);
                        agregarOpcion("Crucero", distritosComboBox);
                        agregarOpcion("Ituata", distritosComboBox);
                        agregarOpcion("Ollachea", distritosComboBox);
                        agregarOpcion("San Gabán", distritosComboBox);
                        agregarOpcion("Usicayos", distritosComboBox);
                    } else if (provinciaSeleccionada === "Chucuito") {
                        agregarOpcion("Juli", distritosComboBox);
                        agregarOpcion("Desaguadero", distritosComboBox);
                        agregarOpcion("Huacullani", distritosComboBox);
                        agregarOpcion("Kelluyo", distritosComboBox);
                        agregarOpcion("Pisacoma", distritosComboBox);
                        agregarOpcion("Pomata", distritosComboBox);
                        agregarOpcion("Zepita", distritosComboBox);
                    } else if (provinciaSeleccionada === "El Collao") {
                        agregarOpcion("Ilave", distritosComboBox);
                        agregarOpcion("Capaso", distritosComboBox);
                        agregarOpcion("Pilcuyo", distritosComboBox);
                        agregarOpcion("Santa Rosa", distritosComboBox);
                        agregarOpcion("Conduriri", distritosComboBox);
                    } else if (provinciaSeleccionada === "Huancané") {
                        agregarOpcion("Huancané", distritosComboBox);
                        agregarOpcion("Cojata", distritosComboBox);
                        agregarOpcion("Huatasani", distritosComboBox);
                        agregarOpcion("Inchupalla", distritosComboBox);
                        agregarOpcion("Pusi", distritosComboBox);
                        agregarOpcion("Rosaspata", distritosComboBox);
                        agregarOpcion("Taraco", distritosComboBox);
                        agregarOpcion("Vilque Chico", distritosComboBox);
                    } else if (provinciaSeleccionada === "Lampa") {
                        agregarOpcion("Lampa", distritosComboBox);
                        agregarOpcion("Cabanilla", distritosComboBox);
                        agregarOpcion("Calapuja", distritosComboBox);
                        agregarOpcion("Nicasio", distritosComboBox);
                        agregarOpcion("Palca", distritosComboBox);
                        agregarOpcion("Paratía", distritosComboBox);
                        agregarOpcion("Pucará", distritosComboBox);
                        agregarOpcion("Santa Lucía", distritosComboBox);
                        agregarOpcion("Vilavila", distritosComboBox);
                    } else if (provinciaSeleccionada === "Melgar") {
                        agregarOpcion("Ayaviri", distritosComboBox);
                        agregarOpcion("Antauta", distritosComboBox);
                        agregarOpcion("Cupi", distritosComboBox);
                        agregarOpcion("Llalli", distritosComboBox);
                        agregarOpcion("Macari", distritosComboBox);
                        agregarOpcion("Ñuñoa", distritosComboBox);
                        agregarOpcion("Orurillo", distritosComboBox);
                        agregarOpcion("Santa Rosa", distritosComboBox);
                        agregarOpcion("Umachiri", distritosComboBox);
                    } else if (provinciaSeleccionada === "Moho") {
                        agregarOpcion("Moho", distritosComboBox);
                        agregarOpcion("Conima", distritosComboBox);
                        agregarOpcion("Huayrapata", distritosComboBox);
                        agregarOpcion("Tilali", distritosComboBox);
                    } else if (provinciaSeleccionada === "San Antonio de Putina") {
                        agregarOpcion("Sandia", distritosComboBox);
                        agregarOpcion("Cojata", distritosComboBox);
                        agregarOpcion("Yanahuaya", distritosComboBox);
                        agregarOpcion("San Juan del Oro", distritosComboBox);
                        agregarOpcion("Quiaca", distritosComboBox);
                        agregarOpcion("Phara", distritosComboBox);
                        agregarOpcion("Ollachea", distritosComboBox);
                        agregarOpcion("Putina Punco", distritosComboBox);
                    } else if (provinciaSeleccionada === "Sandia") {
                        agregarOpcion("Sandia", distritosComboBox);
                        agregarOpcion("Cojata", distritosComboBox);
                        agregarOpcion("Yanahuaya", distritosComboBox);
                        agregarOpcion("San Juan del Oro", distritosComboBox);
                        agregarOpcion("Quiaca", distritosComboBox);
                        agregarOpcion("Phara", distritosComboBox);
                        agregarOpcion("Ollachea", distritosComboBox);
                        agregarOpcion("Putina Punco", distritosComboBox);
                    } else if (provinciaSeleccionada === "Yunguyo") {
                        agregarOpcion("Yunguyo", distritosComboBox);
                        agregarOpcion("Anapia", distritosComboBox);
                        agregarOpcion("Copani", distritosComboBox);
                        agregarOpcion("Cuturapi", distritosComboBox);
                        agregarOpcion("Ollaraya", distritosComboBox);
                        agregarOpcion("Tinicachi", distritosComboBox);
                        agregarOpcion("Unicachi", distritosComboBox);
                    } else if (provinciaSeleccionada === "Moyobamba") {
                        agregarOpcion("Moyobamba", distritosComboBox);
                        agregarOpcion("Calzada", distritosComboBox);
                        agregarOpcion("Habana", distritosComboBox);
                        agregarOpcion("Jepelacio", distritosComboBox);
                        agregarOpcion("Soritor", distritosComboBox);
                        agregarOpcion("Yantalo", distritosComboBox);
                    } else if (provinciaSeleccionada === "Bellavista") {
                        agregarOpcion("Bellavista", distritosComboBox);
                        agregarOpcion("Alto Biavo", distritosComboBox);
                        agregarOpcion("Bajo Biavo", distritosComboBox);
                        agregarOpcion("Huallaga", distritosComboBox);
                        agregarOpcion("San Pablo", distritosComboBox);
                        agregarOpcion("San Rafael", distritosComboBox);
                    } else if (provinciaSeleccionada === "El Dorado") {
                        agregarOpcion("San José de Sisa", distritosComboBox);
                        agregarOpcion("Agua Blanca", distritosComboBox);
                        agregarOpcion("San Martín", distritosComboBox);
                        agregarOpcion("Santa Rosa", distritosComboBox);
                        agregarOpcion("Shatoja", distritosComboBox);
                    } else if (provinciaSeleccionada === "Huallaga") {
                        agregarOpcion("Saposoa", distritosComboBox);
                        agregarOpcion("El Eslabón", distritosComboBox);
                        agregarOpcion("Piscoyacu", distritosComboBox);
                        agregarOpcion("Sacanche", distritosComboBox);
                        agregarOpcion("Tingo de Saposoa", distritosComboBox);
                    } else if (provinciaSeleccionada === "Lamas") {
                        agregarOpcion("Lamas", distritosComboBox);
                        agregarOpcion("Alonso de Alvarado", distritosComboBox);
                        agregarOpcion("Barranquita", distritosComboBox);
                        agregarOpcion("Caynarachi", distritosComboBox);
                        agregarOpcion("Cuñumbuque", distritosComboBox);
                        agregarOpcion("Pinto Recodo", distritosComboBox);
                        agregarOpcion("Rumisapa", distritosComboBox);
                        agregarOpcion("San Roque de Cumbaza", distritosComboBox);
                        agregarOpcion("Shanao", distritosComboBox);
                        agregarOpcion("Tabalosos", distritosComboBox);
                        agregarOpcion("Zapatero", distritosComboBox);
                    } else if (provinciaSeleccionada === "Mariscal Cáceres") {
                        agregarOpcion("Juanjuí", distritosComboBox);
                        agregarOpcion("Campanilla", distritosComboBox);
                        agregarOpcion("Huicungo", distritosComboBox);
                        agregarOpcion("Pajarillo", distritosComboBox);
                    } else if (provinciaSeleccionada === "Picota") {
                        agregarOpcion("Picota", distritosComboBox);
                        agregarOpcion("Buenos Aires", distritosComboBox);
                        agregarOpcion("Caspisapa", distritosComboBox);
                        agregarOpcion("Pilluana", distritosComboBox);
                        agregarOpcion("Pucacaca", distritosComboBox);
                        agregarOpcion("San Cristóbal", distritosComboBox);
                        agregarOpcion("Shamboyacu", distritosComboBox);
                        agregarOpcion("Tingo de Ponasa", distritosComboBox);
                        agregarOpcion("Tres Unidos", distritosComboBox);
                    } else if (provinciaSeleccionada === "Rioja") {
                        agregarOpcion("Rioja", distritosComboBox);
                        agregarOpcion("Awajún", distritosComboBox);
                        agregarOpcion("Elias Soplín Vargas", distritosComboBox);
                        agregarOpcion("Nueva Cajamarca", distritosComboBox);
                        agregarOpcion("Paraiso", distritosComboBox);
                        agregarOpcion("Posic", distritosComboBox);
                        agregarOpcion("San Fernando", distritosComboBox);
                        agregarOpcion("Yorongos", distritosComboBox);
                        agregarOpcion("Yuracyacu", distritosComboBox);
                    } else if (provinciaSeleccionada === "Tocache") {
                        agregarOpcion("Tocache", distritosComboBox);
                        agregarOpcion("Nuevo Progreso", distritosComboBox);
                        agregarOpcion("Pólvora", distritosComboBox);
                        agregarOpcion("Shunte", distritosComboBox);
                        agregarOpcion("Uchiza", distritosComboBox);
                    } else if (provinciaSeleccionada === "Tacna") {
                        agregarOpcion("Tacna", distritosComboBox);
                        agregarOpcion("Alto de la Alianza", distritosComboBox);
                        agregarOpcion("Calana", distritosComboBox);
                        agregarOpcion("Ciudad Nueva", distritosComboBox);
                        agregarOpcion("Coronel Gregorio Albarracín Lanchipa", distritosComboBox);
                        agregarOpcion("Inclán", distritosComboBox);
                        agregarOpcion("Pachía", distritosComboBox);
                        agregarOpcion("Palca", distritosComboBox);
                        agregarOpcion("Pocollay", distritosComboBox);
                        agregarOpcion("Sama", distritosComboBox);
                        agregarOpcion("Coronel Gregorio Albarracín Lanchipa", distritosComboBox);
                    } else if (provinciaSeleccionada === "Candarave") {
                        agregarOpcion("Candarave", distritosComboBox);
                        agregarOpcion("Cairani", distritosComboBox);
                        agregarOpcion("Curibaya", distritosComboBox);
                        agregarOpcion("Huanuara", distritosComboBox);
                        agregarOpcion("Quilahuani", distritosComboBox);
                    } else if (provinciaSeleccionada === "Jorge Basadre") {
                        agregarOpcion("Locumba", distritosComboBox);
                        agregarOpcion("Ite", distritosComboBox);
                        agregarOpcion("Ilabaya", distritosComboBox);
                    } else if (provinciaSeleccionada === "Tumbes") {
                        agregarOpcion("Tumbes", distritosComboBox);
                        agregarOpcion("Corrales", distritosComboBox);
                        agregarOpcion("La Cruz", distritosComboBox);
                        agregarOpcion("Pampas de Hospital", distritosComboBox);
                        agregarOpcion("San Jacinto", distritosComboBox);
                        agregarOpcion("San Juan de la Virgen", distritosComboBox);
                    } else if (provinciaSeleccionada === "Contralmirante Villar") {
                        agregarOpcion("Zorritos", distritosComboBox);
                        agregarOpcion("Casitas", distritosComboBox);
                        agregarOpcion("Canoas de Punta Sal", distritosComboBox);
                    } else if (provinciaSeleccionada === "Zarumilla") {
                        agregarOpcion("Zarumilla", distritosComboBox);
                        agregarOpcion("Aguas Verdes", distritosComboBox);
                        agregarOpcion("Matapalo", distritosComboBox);
                        agregarOpcion("Papayal", distritosComboBox);
                    } else if (provinciaSeleccionada === "Coronel Portillo") {
                        agregarOpcion("Callería", distritosComboBox);
                        agregarOpcion("Campo Verde", distritosComboBox);
                        agregarOpcion("Ipur", distritosComboBox);
                        agregarOpcion("Manantay", distritosComboBox);
                        agregarOpcion("Masisea", distritosComboBox);
                        agregarOpcion("Nueva Requena", distritosComboBox);
                        agregarOpcion("Yarinacocha", distritosComboBox);
                    } else if (provinciaSeleccionada === "Padre Abad") {
                        agregarOpcion("Padre Abad", distritosComboBox);
                        agregarOpcion("Irázola", distritosComboBox);
                        agregarOpcion("Purús", distritosComboBox);
                    } else if (provinciaSeleccionada === "Atalaya") {
                        agregarOpcion("Atalaya", distritosComboBox);
                        agregarOpcion("Raymondi", distritosComboBox);
                        agregarOpcion("Sepahua", distritosComboBox);
                        agregarOpcion("Tahuanía", distritosComboBox);
                    } else if (provinciaSeleccionada === "Purus") {
                        agregarOpcion("Purus", distritosComboBox);
                    }
                }



                function agregarOpcion(texto, selectElement) {
                    var opcion = document.createElement("option");
                    opcion.text = texto;
                    selectElement.add(opcion);
                }
            </script>
            <!--------AGREGAR ESTUDIANTE------------------------------>
            <!--MODAL Agregar estudiante / Sección datos apoderado---->
            <div class="modal modal-xl fade" data-bs-backdrop="static" data-bs-keyboard="false" id="modal-datos-apo">
                <div class="modal-dialog ">
                    <div class="modal-content" id="modal-contenido">
                        <div class="modal-header">
                            <h4 class="modal-title">Agregar apoderado</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col my-4">
                                    <!--Secciones-->
                                    <div class="Secciones">
                                        <button type="button" id="btn-datos" class="btn btn-success">
                                            <i class="fa-solid fa-check fa-xl" style="color: #ffffff;"></i>
                                        </button>
                                        <h5 style="color: #f2d12e; margin: 0px 23px; margin-top: 10px; font-weight: bold;font-size: 17px;">Datos apoderado</h5>
                                        <i class="fa-solid fa-chevron-right fa-lg" style="color: #00ae86;margin-top: 21px;"></i>
                                        <button type="button" id="btn-buscar-est" class="btn btn-success mx-4" data-bs-toggle="modal" data-bs-target="#modal-buscar-est">02</button>
                                        <h5 style="color: white;margin-top: 10px; font-weight: bold;font-size: 17px;">Buscar estudiante</h5>
                                    </div>

                                </div>
                            </div>
                            <form action="EstudianteController" method="post">
                                <input type="hidden" name="accion" value="agregar">
                                <input type="hidden" name="page" value="1">
                                <div class=" row">
                                    <div class="col">
                                        <label id="etiqueta" for="DNI">N° de DNI:</label>
                                        <input type="text" class="form-control my-1" style="background-color: #222222; border: 2px solid white; border-radius: 3px; color: white;" id="a_dniInput"name="a_DNI">


                                    </div>
                                    <div class="col">
                                        <label id="etiqueta" for="ape-paterno">Apellido Paterno:</label>
                                        <input type="text" class="form-control my-1"style="background-color: #222222; border: 2px solid white;border-radius: 3px;color: white; "id="a_apPaternoInput"name="a_ape-paterno">

                                    </div>  
                                    <div class="col">
                                        <label id="etiqueta" for="ape-materno">Apellido Materno:</label>
                                        <input type="text" class="form-control my-1"style="background-color: #222222; border: 2px solid white;border-radius: 3px;color: white; "id="a_apMaternoInput"name="a_ape-materno">

                                    </div>      
                                    <div class="col">
                                        <label id="etiqueta" for="nombres">Nombres:</label>
                                        <input type="text" class="form-control my-1"style="background-color: #222222; border: 2px solid white;border-radius: 3px;color: white; "id="a_nombresInput"name="a_nombres">

                                    </div>                       
                                </div>
                                <div class="row ">
                                    <div class="col-6">
                                        <label id="etiqueta" for="direccion">Dirección:</label>
                                        <input type="text"  class="form-control my-1"style="background-color: #222222; border: 2px solid white;border-radius: 3px;color: white; "id="a_direccionInput"name="a_direccion">
                                    </div>
                                    <div class="col-3">
                                        <label id="etiqueta" for="departamento">Departamento:</label>
                                        <select type="search" class="form-select my-1" style="border: 2px solid black;border-radius: 3px;" id="a_departamentoInput" name="a_departamento" onchange="actualizarProvincias()">
                                            <option value="" disabled selected hidden>Seleccionar</option>
                                            <option value="Amazonas">Amazonas</option>
                                            <option value="Áncash">Áncash</option>
                                            <option value="Apurímac">Apurímac</option>
                                            <option value="Arequipa">Arequipa</option>
                                            <option value="Ayacucho">Ayacucho</option>
                                            <option value="Cajamarca">Cajamarca</option>
                                            <option value="Cusco">Cusco</option>
                                            <option value="Huancavelica">Huancavelica</option>
                                            <option value="Huánuco">Huánuco</option>
                                            <option value="Ica">Ica</option>
                                            <option value="Junín">Junín</option>
                                            <option value="La Libertad">La Libertad</option>
                                            <option value="Lambayeque">Lambayeque</option>
                                            <option value="Lima">Lima</option>
                                            <option value="Loreto">Loreto</option>
                                            <option value="Madre de Dios">Madre de Dios</option>
                                            <option value="Moquegua">Moquegua</option>
                                            <option value="Pasco">Pasco</option>
                                            <option value="Piura">Piura</option>
                                            <option value="Puno">Puno</option>
                                            <option value="San Martín">San Martín</option>
                                            <option value="Tacna">Tacna</option>
                                            <option value="Tumbes">Tumbes</option>
                                            <option value="Ucayali">Ucayali</option>
                                        </select>
                                    </div>
                                    <div class="col-3">
                                        <label id="etiqueta" for="provincia">Provincia:</label>
                                        <select type="search" id="a_provinciaInput" name="a_provincia" class="form-select my-1" style="border: 2px solid black;border-radius: 3px;" onchange="actualizarDistritos()" aria-label="search">
                                            <option value="" disabled selected hidden>Seleccionar</option>

                                        </select>                                    
                                    </div>
                                </div>
                                <div class="row ">
                                    <div class="col">
                                        <label id="etiqueta" for="fec-nac">Fecha de nacimiento:</label>
                                        <input type="date" class="form-control my-1" style="border: 2px solid black;border-radius: 3px;" id="a_fecNacInput" name="a_birthdate">
                                        
                                        <label id="etiqueta" for="sexo">Sexo:</label>
                                        <select class="form-select my-1" style="border: 2px solid black;border-radius: 3px;" aria-label="Default select example" id="a_generoInput"name="a_genero">
                                            <option selected >Select</option>
                                            <option value="1">Masculino</option>
                                            <option value="2">Femenino</option>
                                        </select>
                                        
                                       
                                    </div>
                                    <div class="col">
                                        <label id="etiqueta" for="grado">Grado de instrucción:</label>
                                        <select class="form-select my-1" id="grado" style="border: 2px solid black;border-radius: 3px;"aria-label="Default select example" id="a_gradoInstruccionInput"name="a_grado-instruccion">
                                            <option selected>Select</option>
                                            <option value="Primaria">Primaria</option>
                                            <option value="Secundaria">Secundaria</option>
                                            <option value="Educación Técnica">Educación Técnica</option>
                                            <option value="Educación Superior">Educación Superior</option>
                                            <option value="Postgrado">Postgrado</option>
                                        </select>
                                        
                                        <label id="etiqueta" for="opcionesRadio">Vive:</label><br>
                                        <div class="form-check my-2 form-check-inline">
                                            <input class="form-check-input" type="radio" name="a_estado-vida" id="flexRadioDefault1">
                                            <label id="etiqueta" class="form-check-label" for="flexRadioDefault1">
                                                Si
                                            </label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="a_estado-vida" id="flexRadioDefault2" checked>
                                            <label id="etiqueta" class="form-check-label" for="flexRadioDefault2">
                                                No
                                            </label>
                                        </div>
                                        
                                        
                                    </div>
                                    <div class="col">
                                        <label id="etiqueta" for="genero">Ocupación:</label>
                                        <input type="text" class="form-control my-1"style="background-color: #222222; border: 2px solid white;border-radius: 3px;color: white; "id="a_ocupacionInput"name="a_ocupacion">
                                        
                                        <label id="etiqueta" for="genero">Teléfono:</label>
                                        <input type="text" class="form-control my-1"style="background-color: #222222; border: 2px solid white;border-radius: 3px;color: white; "id="a_telefonoInput"name="a_telefono">
                                    </div>
                                    <div class="col">
                                        <label id="etiqueta" for="distrito">Distrito:</label>
                                        <select id="a_distritoInput" name="a_distrito" class="form-select my-1" style="border: 2px solid black;border-radius: 3px;" type="search" aria-label="search">
                                            <option value="" disabled selected hidden>Seleccionar</option>
                                        </select>  
                                    </div>
                                    
                                </div>   
                            </form>                       
                        </div>

                    </div>
                </div>
            </div>

            <!--MODAL Agregar estudiante / Sección buscar estudiante-->
            <div class="modal modal-xl fade" data-bs-backdrop="static" data-bs-keyboard="false" id="modal-buscar-est">
                <div class="modal-dialog ">
                    <div class="modal-content" id="modal-contenido">
                        <div class="modal-header">
                            <h4 class="modal-title">Agregar apoderado</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col my-4">
                                    <!--Secciones-->
                                    <div class="Secciones">
                                        <button type="button" id="btn-datos2" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modal-datos-apo">
                                            01
                                        </button>
                                        <h5 style="color: white; margin: 0px 23px; margin-top: 10px; font-weight: bold;font-size: 17px;">Datos apoderado</h5>
                                        <i class="fa-solid fa-chevron-right fa-lg" style="color: #00ae86;margin-top: 21px;"></i>
                                        <button type="button" id="btn-buscar-est2" class="btn btn-success mx-4">
                                            <i class="fa-solid fa-check fa-xl" style="color: #ffffff;"></i>
                                        </button>
                                        <h5 style="color: #f2d12e;margin-top: 10px; font-weight: bold;font-size: 17px;">Buscar estudiante</h5>
                                    </div>

                                </div>
                            </div>
                            <form>
                                <div class=" row">
                                    <div class="col">
                                        <h6 class="label-dni" style="color: white;">N° de DNI del apoderado</h6>
                                        <form class="d-flex" role="search">
                                            <input id="campo-buscar2" class="form-control " type="search" aria-label="Search">
                                        </form>
                                    </div>
                                    <div class="col">
                                        <h6 class="label-vinculo" style="color: white;">Vínculo</h6>
                                        <select id="select-vinculo" class="form-select my-1" style="border: 2px solid black;border-radius: 3px;" aria-label="Default select example">
                                            <option selected >Select</option>
                                            <option value="1">Padre</option>
                                            <option value="2">Tío</option>
                                            <option value="3">Hermano</option>
                                            <option value="4">Primo</option>
                                            <option value="5">Abuelo</option>
                                        </select>
                                    </div>   
                                    <div class="col">
                                        <button type="button" id="btn-agregar2" class="btn btn-success">
                                            Agregar
                                        </button>
                                    </div>                       
                                </div>    
                                <!--Tabla de estudiantes vinculados con el apoderado-->                          
                                <div class="row my-3">
                                    <div class="col">
                                        <div class="table-container table-responsive">
                                            <table id="tabla2" class="table table-borderless table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>N° de Estudiante</th>
                                                        <th>N° de DNI</th>
                                                        <th>Apellido Paterno</th>
                                                        <th>Apellido Materno</th>
                                                        <th>Nombres</th>
                                                        <th>Vínculo</th>
                                                        <th>Acción</th>                                                          
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>N0001</td>
                                                        <td>76859403</td>
                                                        <td>Romero</td>
                                                        <td>Sánchez</td>
                                                        <td>Alex</td>
                                                        <td>Padre</td>
                                                        <td>
                                                            <a class="icono-accion mx-1" href="#" >
                                                                <i class="fa-solid fa-trash-can fa-lg" style="color: #ffffff;"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>N0001</td>
                                                        <td>76859403</td>
                                                        <td>Romero</td>
                                                        <td>Sánchez</td>
                                                        <td>Alex</td>
                                                        <td>Tio</td>
                                                        <td>
                                                            <a class="icono-accion mx-1" href="#" >
                                                                <i class="fa-solid fa-trash-can fa-lg" style="color: #ffffff;"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>N0001</td>
                                                        <td>76859403</td>
                                                        <td>Romero</td>
                                                        <td>Sánchez</td>
                                                        <td>Alex</td>
                                                        <td>Primo</td>
                                                        <td>
                                                            <a class="icono-accion mx-1" href="#" >
                                                                <i class="fa-solid fa-trash-can fa-lg" style="color: #ffffff;"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </form>                       
                        </div>
                        <div class="modal-footer" style="border-top: none;">
                            <button type="button" id="btn-guardar" class="btn btn-primary">Guardar</button>
                        </div>
                    </div>
                </div>
            </div>
            <!------------------------------------>
            <!--------MODALES SUB FLUJO----------->
            <!--MODAL Ver detalles del apoderado-->
            <div class="modal modal-xl fade" data-bs-backdrop="static" data-bs-keyboard="false" id="modal-ver-datos">
                <div class="modal-dialog">
                    <div class="modal-content" id="modal-contenido">
                        <div class="modal-header">
                            <h4 class="modal-title">Romero Maldonado,Coco N°P0001</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col">
                                    <h5 class="etiqueta-ver-detalles">N° de DNI:</h5>
                                    <h5 class="etiqueta-ver-detalles">Género:</h5>
                                    <h5 class="etiqueta-ver-detalles">Fecha de nacimiento:</h5>
                                    <h5 class="etiqueta-ver-detalles">Grado de instrucción:</h5>
                                    <h5 class="etiqueta-ver-detalles">Ocupación:</h5>
                                </div>
                                <div class="col">
                                    <h5 class="etiqueta-ver-detalles">Dirección:</h5>
                                    <h5 class="etiqueta-ver-detalles">Distrito:</h5>
                                    <h5 class="etiqueta-ver-detalles">Departamento:</h5>
                                    <h5 class="etiqueta-ver-detalles">Vive:</h5>
                                    <h5 class="etiqueta-ver-detalles">Teléfono:</h5>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <h4 style="color: white;">Estudiantes relacionados</h4>
                                    <div class="table-container table-responsive">
                                        <table id="tabla2" class="table table-borderless table-hover">
                                            <thead>
                                                <tr>
                                                    <th>N° de Estudiante</th>
                                                    <th>N° de DNI</th>
                                                    <th>Apellido Paterno</th>
                                                    <th>Apellido Materno</th>
                                                    <th>Nombres</th>
                                                    <th>Vínculo</th>                                                                                                         
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>N0001</td>
                                                    <td>76859403</td>
                                                    <td>Romero</td>
                                                    <td>Sánchez</td>
                                                    <td>Alex</td>
                                                    <td>Padre</td>                                              
                                                </tr>
                                                <tr>
                                                    <td>N0001</td>
                                                    <td>76859403</td>
                                                    <td>Romero</td>
                                                    <td>Sánchez</td>
                                                    <td>Alex</td>
                                                    <td>Tio</td>                                               
                                                </tr>
                                                <tr>
                                                    <td>N0001</td>
                                                    <td>76859403</td>
                                                    <td>Romero</td>
                                                    <td>Sánchez</td>
                                                    <td>Alex</td>
                                                    <td>Primo</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--MODAL Editar estudiante / Sección datos apoderado---->
            <div class="modal modal-xl fade" data-bs-backdrop="static" data-bs-keyboard="false" id="modal-datos-apo">
                <div class="modal-dialog ">
                    <div class="modal-content" id="modal-contenido">
                        <div class="modal-header">
                            <h4 class="modal-title">Agregar apoderado</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col my-4">
                                    <!--Secciones-->
                                    <div class="Secciones">
                                        <button type="button" id="btn-datos" class="btn btn-success">
                                            <i class="fa-solid fa-check fa-xl" style="color: #ffffff;"></i>
                                        </button>
                                        <h5 style="color: #f2d12e; margin: 0px 23px; margin-top: 10px; font-weight: bold;font-size: 17px;">Datos apoderado</h5>
                                        <i class="fa-solid fa-chevron-right fa-lg" style="color: #00ae86;margin-top: 21px;"></i>
                                        <button type="button" id="btn-buscar-est" class="btn btn-success mx-4" data-bs-toggle="modal" data-bs-target="#modal-buscar-est">02</button>
                                        <h5 style="color: white;margin-top: 10px; font-weight: bold;font-size: 17px;">Buscar estudiante</h5>
                                    </div>

                                </div>
                            </div>
                            <form>
                                <div class=" row">
                                    <div class="col">
                                        <label id="etiqueta" for="DNI">N° de DNI:</label>
                                        <input type="text" class="form-control my-1" style="background-color: #222222; border: 2px solid white; border-radius: 3px; color: white;" id="DNI"name="DNI">


                                    </div>
                                    <div class="col">
                                        <label id="etiqueta" for="ape-paterno">Apellido Paterno:</label>
                                        <input type="text" class="form-control my-1"style="background-color: #222222; border: 2px solid white;border-radius: 3px;color: white; "id="ape-paterno"name="ape-paterno">

                                    </div>  
                                    <div class="col">
                                        <label id="etiqueta" for="ape-materno">Apellido Materno:</label>
                                        <input type="text" class="form-control my-1"style="background-color: #222222; border: 2px solid white;border-radius: 3px;color: white; "id="ape-materno"name="ape-materno">

                                    </div>      
                                    <div class="col">
                                        <label id="etiqueta" for="nombres">Nombres:</label>
                                        <input type="text" class="form-control my-1"style="background-color: #222222; border: 2px solid white;border-radius: 3px;color: white; "id="nombres"name="nombres">

                                    </div>                       
                                </div>
                                <div class="row ">
                                    <div class="col-6">
                                        <label id="etiqueta" for="direccion">Dirección:</label>
                                        <input type="text"  class="form-control my-1"style="background-color: #222222; border: 2px solid white;border-radius: 3px;color: white; "id="direccion"name="direccion">
                                    </div>
                                    <div class="col-3">
                                        <label id="etiqueta" for="distrito">Distrito:</label>
                                        <input type="text" class="form-control my-1"style="background-color: #222222; border: 2px solid white;border-radius: 3px;color: white; "id="distrito"name="distrito">
                                    </div>
                                    <div class="col-3">
                                        <label id="etiqueta" for="departamento">Departamento:</label>
                                        <input type="text" class="form-control my-1"style="background-color: #222222; border: 2px solid white;border-radius: 3px;color: white; "id="departamento"name="departamento">
                                    </div>
                                </div>
                                <div class="row ">
                                    <div class="col">
                                        <label id="etiqueta" for="genero">Género:</label>
                                        <select class="form-select my-1" style="border: 2px solid black;border-radius: 3px;" aria-label="Default select example">
                                            <option selected >Select</option>
                                            <option value="1">Masculino</option>
                                            <option value="2">Femenino</option>
                                        </select>
                                        <label id="etiqueta" for="opcionesRadio">Vive:</label><br>
                                        <div class="form-check my-2 form-check-inline">
                                            <input class="form-check-input" type="radio" name="viveMetodo" id="flexRadioDefault1">
                                            <label id="etiqueta" class="form-check-label" for="flexRadioDefault1">
                                                Si
                                            </label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="viveMetodo" id="flexRadioDefault2" checked>
                                            <label id="etiqueta" class="form-check-label" for="flexRadioDefault2">
                                                No
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <label id="etiqueta" for="fec-nac">Fecha de nacimiento:</label>
                                        <input type="date" class="form-control my-1" style="border: 2px solid black;border-radius: 3px;" id="fec-nac" name="birthdate">

                                        <label id="etiqueta" for="genero">Teléfono:</label>
                                        <input type="text" class="form-control my-1"style="background-color: #222222; border: 2px solid white;border-radius: 3px;color: white; "id="telefono"name="telefono">
                                    </div>
                                    <div class="col">
                                        <label id="etiqueta" for="grado">Grado de instrucción:</label>
                                        <select class="form-select my-1" id="grado" style="border: 2px solid black;border-radius: 3px;"aria-label="Default select example">
                                            <option selected>Select</option>
                                            <option value="1">1°</option>
                                            <option value="2">2°</option>
                                            <option value="3">3°</option>
                                            <option value="4">4°</option>
                                            <option value="5">5°</option>
                                        </select>
                                    </div>
                                    <div class="col">
                                        <label id="etiqueta" for="genero">Grado de ocupación:</label>
                                        <input type="text" class="form-control my-1"style="background-color: #222222; border: 2px solid white;border-radius: 3px;color: white; "id="grado-ocupacion"name="grado-ocupacion">
                                    </div>
                                </div>   
                            </form>                       
                        </div>

                    </div>
                </div>
            </div>

            <!--MODAL Editar estudiante / Sección buscar estudiante-->
            <div class="modal modal-xl fade" data-bs-backdrop="static" data-bs-keyboard="false" id="modal-buscar-est">
                <div class="modal-dialog ">
                    <div class="modal-content" id="modal-contenido">
                        <div class="modal-header">
                            <h4 class="modal-title">Agregar apoderado</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col my-4">
                                    <!--Secciones-->
                                    <div class="Secciones">
                                        <button type="button" id="btn-datos2" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modal-datos-apo">
                                            01
                                        </button>
                                        <h5 style="color: white; margin: 0px 23px; margin-top: 10px; font-weight: bold;font-size: 17px;">Datos apoderado</h5>
                                        <i class="fa-solid fa-chevron-right fa-lg" style="color: #00ae86;margin-top: 21px;"></i>
                                        <button type="button" id="btn-buscar-est2" class="btn btn-success mx-4">
                                            <i class="fa-solid fa-check fa-xl" style="color: #ffffff;"></i>
                                        </button>
                                        <h5 style="color: #f2d12e;margin-top: 10px; font-weight: bold;font-size: 17px;">Buscar estudiante</h5>
                                    </div>

                                </div>
                            </div>
                            <form>
                                <div class=" row">
                                    <div class="col">
                                        <h6 class="label-dni" style="color: white;">N° de DNI del apoderado</h6>
                                        <form class="d-flex" role="search">
                                            <input id="campo-buscar2" class="form-control " type="search" aria-label="Search">
                                        </form>
                                    </div>
                                    <div class="col">
                                        <h6 class="label-vinculo" style="color: white;">Vínculo</h6>
                                        <select id="select-vinculo" class="form-select my-1" style="border: 2px solid black;border-radius: 3px;" aria-label="Default select example">
                                            <option selected >Select</option>
                                            <option value="1">Padre</option>
                                            <option value="2">Tío</option>
                                            <option value="3">Hermano</option>
                                            <option value="4">Primo</option>
                                            <option value="5">Abuelo</option>
                                        </select>
                                    </div>   
                                    <div class="col">
                                        <button type="button" id="btn-agregar2" class="btn btn-success">
                                            Agregar
                                        </button>
                                    </div>                       
                                </div>    
                                <!--Tabla de estudiantes vinculados con el apoderado-->                          
                                <div class="row my-3">
                                    <div class="col">
                                        <div class="table-container table-responsive">
                                            <table id="tabla2" class="table table-borderless table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>N° de Estudiante</th>
                                                        <th>N° de DNI</th>
                                                        <th>Apellido Paterno</th>
                                                        <th>Apellido Materno</th>
                                                        <th>Nombres</th>
                                                        <th>Vínculo</th>
                                                        <th>Acción</th>                                                          
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>N0001</td>
                                                        <td>76859403</td>
                                                        <td>Romero</td>
                                                        <td>Sánchez</td>
                                                        <td>Alex</td>
                                                        <td>Padre</td>
                                                        <td>
                                                            <a class="icono-accion mx-1" href="#" >
                                                                <i class="fa-solid fa-trash-can fa-lg" style="color: #ffffff;"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>N0001</td>
                                                        <td>76859403</td>
                                                        <td>Romero</td>
                                                        <td>Sánchez</td>
                                                        <td>Alex</td>
                                                        <td>Tio</td>
                                                        <td>
                                                            <a class="icono-accion mx-1" href="#" >
                                                                <i class="fa-solid fa-trash-can fa-lg" style="color: #ffffff;"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>N0001</td>
                                                        <td>76859403</td>
                                                        <td>Romero</td>
                                                        <td>Sánchez</td>
                                                        <td>Alex</td>
                                                        <td>Primo</td>
                                                        <td>
                                                            <a class="icono-accion mx-1" href="#" >
                                                                <i class="fa-solid fa-trash-can fa-lg" style="color: #ffffff;"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </form>                       
                        </div>
                        <div class="modal-footer" style="border-top: none;">
                            <button type="button" id="btn-guardar" class="btn btn-primary">Guardar</button>
                        </div>
                    </div>
                </div>
            </div>

            <!---MODALES DEL FLUJO ALTERNATIVO---->
            <!--MODAL Eliminar apoderado---------->
            <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" id="modal-eliminar">
                <div class="modal-dialog">
                    <div class="modal-content" id="modal-contenido">
                        <div class="modal-header">
                            <h4 class="modal-title">Eliminar apoderado</h4>
                        </div>
                        <div class="modal-body">
                            <h6 style="color: white;">¿Está seguro de eliminar a este apoderado?</h4>
                        </div>
                        <div class="modal-footer" id="contenedor-botones">
                            <button type="button" id="btn-cancelar" class="btn btn-secondary mx-2" data-bs-dismiss="modal">Cancelar</button>
                            <button type="button" id="btn-eliminar" class="btn btn-primary">Eliminar</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--MODAL apoderado no encontrado----->
            <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" id="modal-apo-no-encontrado">
                <div class="modal-dialog">
                    <div class="modal-content" id="modal-contenido-error-apo">
                        <div class="modal-header" style="border-bottom: none;">
                            <h4 class="modal-title" style="color: black;">Apoderado no encontrado</h4>
                        </div>
                        <div class="modal-body">
                            <h6 style="color: black; font-size: 14px;">Vuelva a ingresar el N° de DNI del apoderado</h6>
                        </div>
                        <div class="modal-footer" style="border-top: none;" id="contenedor-botones-error-apo">
                            <button type="button" id="btn-aceptar" class="btn btn-primary px-3" data-bs-dismiss="modal">Aceptar</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--MODAL estudiante no encontrado---->
            <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" id="modal-est-no-encontrado">
                <div class="modal-dialog">
                    <div class="modal-content" id="modal-contenido-error-apo">
                        <div class="modal-header" style="border-bottom: none;">
                            <h4 class="modal-title" style="color: black;">Estudiante no encontrado</h4>
                        </div>
                        <div class="modal-body">
                            <h6 style="color: black; font-size: 14px;">Vuelva a ingresar el N° de DNI del estudiante</h6>
                        </div>
                        <div class="modal-footer" style="border-top: none;" id="contenedor-botones-error-apo">
                            <button type="button" id="btn-aceptar" class="btn btn-primary px-3" data-bs-dismiss="modal">Aceptar</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--MODAL Datos incompletos----------->
            <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" id="modal-datos-incomp">
                <div class="modal-dialog">
                    <div class="modal-content" id="modal-contenido-error-apo">
                        <div class="modal-header" style="border-bottom: none;">
                            <h4 class="modal-title" style="color: black;">Datos incompletos</h4>
                        </div>
                        <div class="modal-body">
                            <h6 style="color: black; font-size: 14px;">Debe ingresar sus datos en todos los campos
                                para agregar al apoderado.
                            </h6>
                        </div>
                        <div class="modal-footer" style="border-top: none;" id="contenedor-botones-error-apo">
                            <button type="button" id="btn-aceptar" class="btn btn-primary px-3" data-bs-dismiss="modal">Aceptar</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--MODAL Apoderado ya registrado----->
            <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" id="modal-apo-regist">
                <div class="modal-dialog">
                    <div class="modal-content" id="modal-contenido-error-apo">
                        <div class="modal-header" style="border-bottom: none;">
                            <h4 class="modal-title" style="color: black;">Apoderado ya registrado</h4>
                        </div>
                        <div class="modal-body">
                            <h6 style="color: black; font-size: 14px;">El apoderado ya se encuentra registrado en
                                el sistema.
                            </h6>
                        </div>
                        <div class="modal-footer" style="border-top: none;" id="contenedor-botones-error-apo">
                            <button type="button" id="btn-aceptar" class="btn btn-primary px-3" data-bs-dismiss="modal">Aceptar</button>
                        </div>
                    </div>
                </div>
            </div>
            <!------------------------------------>
        </div>
    </body>
</html>
