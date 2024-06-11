<%-- 
    Document   : registro-utiles
    Created on : 26 nov 2023, 22:50:14
    Author     : André
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de útiles</title>
    <!--FontAwesome-->
    <script src="https://kit.fontawesome.com/3cafd6d965.js" crossorigin="anonymous"></script>
    <!--CSS-->
    <link rel="stylesheet" href="css/registro-utiles.css">
    <!--Bootstrap css-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <!--Bootstrap js-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <%@include file="referencias.jsp" %>
</head>
<body>
    <input type="checkbox" id="checkbox">

        <div class="body">
            <%@include file="barra-lateral.jsp" %>
        </div>
    <div class="container" style="position: absolute;top: 40px; left: 150px;">
        <!--Secciones y botones de imprimir y correo-->
        <div class="row my-3 ">
            <div class="col-9">
                <a href="lista-utiles.jsp">
                    <button type="button"id="btn-listaUt" class="btn btn-light">Lista de útiles</button>
                </a>
                <a href="#">
                    <button type="button"id="btn-registroUt" class="btn btn-light">Registro de útiles</button>
                </a>
                        
            </div>
        </div>
        <!--Buscar util y Nuevo util-->
        <div class="row my-4">
            <div class="col-3">
                <h6 class="label-dni">Código:</h6>
                <input id="campo-buscar" class="form-control " type="search" aria-label="Search">
            </div>
            <div class="col-3">
                <h6 class="label-dni">Nombre:</h6>
                <input id="campo-buscar" class="form-control " type="search" aria-label="Search">    
            </div>
            <div class="col contenedor-btnBuscar d-flex align-items-center">
                <button id="btn-buscar" class="btn btn-outline-success mx-5 px-4" type="submit">
                    <i id="icon-buscar" class="fa-solid fa-magnifying-glass" style="color: #ffffff;"></i>
                    Buscar    
                </button>
                
            </div>
            <div class="col contenedor-btnAgregar d-flex justify-content-end align-items-center">
                <button type="button" id="btn-agregarEst" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#modal-nuevo-util">
                    <i id="icon-agregar" class="fa-solid fa-plus" style="color: #ffffff;"></i>
                    Nuevo útil
                </button>
                
            </div>
        </div>
        <!--Lista de utiles-->
        <div class="row my-4">
            <div class="col">
                <div class="table-container table-responsive">
                    <table id="tabla" class="table table-borderless table-hover">
                        <thead>
                            <tr>
                                <th>Código</th>
                                <th>Nombre y descripción</th>
                                <th>Cantidad</th>
                                <th>Acciones</th>                                                          
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>UE0001</td>
                                <td>Cuaderno cuadriculado A4</td>
                                <td>6</td>
                                <td>
                                    <a class="icono-accion mx-1" href="#" data-bs-toggle="modal" data-bs-target="#modal-editar-cant">
                                        <i class="fa-solid fa-pen-to-square fa-lg" style="color: #ffffff;"></i>      
                                    </a>
                                    <a class="icono-accion mx-1" href="#" data-bs-toggle="modal" data-bs-target="#modal-eliminar-util">
                                        <i class="fa-solid fa-trash-can fa-lg" style="color: #ffffff;"></i>
                                    </a>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td>UE0002</td>
                                <td>Libro de Comunicación Coquito</td>
                                <td>6</td>
                                <td>
                                    <a class="icono-accion mx-1" href="#" data-bs-toggle="modal" data-bs-target="#modal-editar-cant">
                                        <i class="fa-solid fa-pen-to-square fa-lg" style="color: #ffffff;"></i>      
                                    </a>
                                    <a class="icono-accion mx-1" href="#" data-bs-toggle="modal" data-bs-target="#modal-eliminar-util">
                                        <i class="fa-solid fa-trash-can fa-lg" style="color: #ffffff;"></i>
                                    </a>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td>UE0003</td>
                                <td>Cuaderno rayado A4</td>
                                <td>6</td>
                                <td>
                                    <a class="icono-accion mx-1" href="#" data-bs-toggle="modal" data-bs-target="#modal-editar-cant">
                                        <i class="fa-solid fa-pen-to-square fa-lg" style="color: #ffffff;"></i>      
                                    </a>
                                    <a class="icono-accion mx-1" href="#" data-bs-toggle="modal" data-bs-target="#modal-eliminar-util">
                                        <i class="fa-solid fa-trash-can fa-lg" style="color: #ffffff;"></i>
                                    </a>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td>UE0004</td>
                                <td>Folder forrado A4</td>
                                <td>2</td>
                                <td>
                                    <a class="icono-accion mx-1" href="#" data-bs-toggle="modal" data-bs-target="#modal-editar-cant">
                                        <i class="fa-solid fa-pen-to-square fa-lg" style="color: #ffffff;"></i>      
                                    </a>
                                    <a class="icono-accion mx-1" href="#" data-bs-toggle="modal" data-bs-target="#modal-eliminar-cant">
                                        <i class="fa-solid fa-trash-can fa-lg" style="color: #ffffff;"></i>
                                    </a>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td>UE0005</td>
                                <td>Cuaderno triple renglón A4</td>
                                <td>4</td>
                                <td>
                                    <a class="icono-accion mx-1" href="#" data-bs-toggle="modal" data-bs-target="#modal-editar-cant">
                                        <i class="fa-solid fa-pen-to-square fa-lg" style="color: #ffffff;"></i>      
                                    </a>
                                    <a class="icono-accion mx-1" href="#" data-bs-toggle="modal" data-bs-target="#modal-eliminar-util">
                                        <i class="fa-solid fa-trash-can fa-lg" style="color: #ffffff;"></i>
                                    </a>
                                    
                                </td>
                            </tr>
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
                        <li id="contenedor-pag" class="page-item disabled">
                            <a  class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li id="contenedor-pag" class="page-item  px-1"><a id="pag1" class="page-link" href="#"><span>1</span></a></li>
                        <li id="contenedor-pag" class="page-item px-1"><a class="page-link" href="#"><span>2</span></a></li>
                        <li id="contenedor-pag" class="page-item px-1"><a class="page-link" href="#"><span>3</span></a></li>
                        <li id="contenedor-pag" class="page-item px-1"><a class="page-link" href="#"><span>4</span></a></li>
                        <li id="contenedor-pag" class="page-item px-1"><a class="page-link" href="#"><span>5</span></a></li>
                        <li id="contenedor-pag" class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        


        <!------MODAL Nuevo util------>
        <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" id="modal-nuevo-util">
            <div class="modal-dialog">
                <div class="modal-content" id="modal-contenido" style="padding: 5px 10px;">
                    <div class="modal-header">
                        <h4 class="modal-title">Nuevo útil escolar</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <label id="etiqueta" for="DNI">Nombre y descripción:</label>
                        <input type="text" class="form-control my-1" style="width: 350px;background-color: #222222; border: 2px solid white; border-radius: 3px; color: white;" id="agregar-util"name="agregar-util">
                        <center>
                            <button type="button" id="btn-agregar-nuevo-util" class="btn btn-success my-4 ">
                                Agregar nuevo útil
                            </button>
                        </center>
                    </div>
                </div>
            </div>
        </div>
        <!------------MODAL SUBFLUJO-------------->
        
        <!--Modal Eliminar útil-->
        <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" id="modal-eliminar-util">
            <div class="modal-dialog">
                <div class="modal-content" id="modal-contenido">
                    <div class="modal-header">
                        <h4 class="modal-title">Eliminar útil escolar</h4>
                    </div>
                    <div class="modal-body">
                        <h6 style="color: white;">¿Está seguro de eliminar este útil escolar del registro?</h4>
                    </div>
                    <div class="modal-footer" id="contenedor-botones">
                        <button type="button" id="btn-cancelar" class="btn btn-secondary mx-2" data-bs-dismiss="modal">Cancelar</button>
                        <button type="button" id="btn-eliminar" class="btn btn-primary">Eliminar</button>
                    </div>
                </div>
            </div>
        </div>
        
    </div>

    
</body>
</html>