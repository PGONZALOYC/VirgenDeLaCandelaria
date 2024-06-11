<%-- 
    Document   : lista_pagos
    Created on : 26 nov. 2023, 20:43:44
    Author     : Patrick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de pagos</title>
    <!--FontAwesome-->
    <script src="https://kit.fontawesome.com/3cafd6d965.js" crossorigin="anonymous"></script>
    <!--CSS-->
    <link rel="stylesheet" href="css/lista-pagos.css">
    <!--Bootstrap css-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <!--Bootstrap js-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
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
                <a href="#">
                    <button type="button"id="btn-lista-pagos" class="btn btn-light">Lista de pagos</button>
                </a>  
            </div>    
        </div>
        <!--Buscar apoderado-->
        <div class="row my-3">
            <div class="col">
                <h6 class="label-dni">N° de DNI del apoderado</h6>
                <form class="d-flex" role="search">
                    <input id="campo-buscar" class="form-control " type="search" aria-label="Search">                   
                    <button id="btn-buscar" class="btn btn-outline-success mx-5 px-4" type="submit">
                        <i id="icon-buscar" class="fa-solid fa-magnifying-glass" style="color: #ffffff;"></i>
                        Buscar    
                    </button>
                </form>
            </div>
        </div>
        <!--Lista de pagos-->
        <div class="row my-1">
            <div class="col">
                <div class="table-container table-responsive">
                    <table id="tabla" class="table table-borderless table-hover">
                        <thead>
                            <tr>
                                <th>N° de DNI</th>
                                <th>Apellido Paterno</th>
                                <th>Apellido Materno</th>
                                <th>Nombres</th>
                                <th>Tipo de apoderado</th>
                                <th>Estado</th>
                                <th>Acciones</th>                                                          
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="align-middle">
                                <td>76859403</td>
                                <td>Ramírez</td>
                                <td>Estrada</td>
                                <td>Carlos</td>
                                <td>Padre</td>
                                <td>
                                    <div class="estado-container" style="background-color: #f6f938;">
                                        Pendiente
                                    </div>
                                </td>
                                <td>
                                    <a class="icono-accion mx-1" href="#" data-bs-toggle="modal" data-bs-target="#modal-editar">
                                        <i class="fa-solid fa-arrow-right fa-lg" style="color: #ffffff;"></i>      
                                    </a>
                                    <a class="icono-accion mx-1" href="#">
                                        <i class="fa-solid fa-file-lines fa-lg" style="color: #ffffff;"></i>
                                    </a>
                                    
                                </td>
                            </tr>
                            <tr class="align-middle">
                                <td>76859403</td>
                                <td>Ramírez</td>
                                <td>Estrada</td>
                                <td>Carlos</td>
                                <td>Padre</td>
                                <td>
                                    <div class="estado-container" style="background-color: #f6f938;">
                                        Pendiente
                                    </div>
                                </td>
                                <td>
                                    <a class="icono-accion mx-1" href="#" data-bs-toggle="modal" data-bs-target="#modal-editar">
                                        <i class="fa-solid fa-arrow-right fa-lg" style="color: #ffffff;"></i>      
                                    </a>
                                    <a class="icono-accion mx-1" href="#">
                                        <i class="fa-solid fa-file-lines fa-lg" style="color: #ffffff;"></i>
                                    </a>
                                    
                                </td>
                            </tr>
                            <tr class="align-middle">
                                <td>76859403</td>
                                <td>Ramírez</td>
                                <td>Estrada</td>
                                <td>Carlos</td>
                                <td>Padre</td>
                                <td>
                                    <div class="estado-container" style="background-color: #f6f938;">
                                        Pendiente
                                    </div>
                                </td>
                                <td>
                                    <a class="icono-accion mx-1" href="#" data-bs-toggle="modal" data-bs-target="#modal-editar">
                                        <i class="fa-solid fa-arrow-right fa-lg" style="color: #ffffff;"></i>      
                                    </a>
                                    <a class="icono-accion mx-1" href="#">
                                        <i class="fa-solid fa-file-lines fa-lg" style="color: #ffffff;"></i>
                                    </a>
                                    
                                </td>
                            </tr>
                            <tr class="align-middle">
                                <td>76859403</td>
                                <td>Ramírez</td>
                                <td>Estrada</td>
                                <td>Carlos</td>
                                <td>Padre</td>
                                <td>
                                    <div class="estado-container" style="background-color: #8de550;">
                                        Pagado
                                    </div>
                                </td>
                                <td>
                                    <a class="icono-accion mx-1" href="#" data-bs-toggle="modal" data-bs-target="#modal-editar">
                                        <i class="fa-solid fa-arrow-right fa-lg" style="color: #ffffff;"></i>      
                                    </a>
                                    <a class="icono-accion mx-1" href="#">
                                        <i class="fa-solid fa-file-lines fa-lg" style="color: #ffffff;"></i>
                                    </a>
                                    
                                </td>
                            </tr>
                            <tr class="align-middle">
                                <td>76859403</td>
                                <td>Ramírez</td>
                                <td>Estrada</td>
                                <td>Carlos</td>
                                <td>Padre</td>
                                <td>
                                    <div class="estado-container" style="background-color: #8de550;">
                                        Pagado
                                    </div>
                                </td>
                                <td>
                                    <a class="icono-accion mx-1" href="#" data-bs-toggle="modal" data-bs-target="#modal-editar">
                                        <i class="fa-solid fa-arrow-right fa-lg" style="color: #ffffff;"></i>      
                                    </a>
                                    <a class="icono-accion mx-1" href="#">
                                        <i class="fa-solid fa-file-lines fa-lg" style="color: #ffffff;"></i>
                                    </a>
                                    
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!--Número de paginado-->
        <footer>
            <div class="container">
                <div class="row my-3">
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
            </div>   
        </footer>
        


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
    
    </div>
    
</body>

</html>
