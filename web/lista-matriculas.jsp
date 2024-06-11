<%-- 
    Document   : lista_matricula
    Created on : 23 nov. 2023, 12:51:03
    Author     : Patrick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Lista de estudiantes</title>
        <!--FontAwesome-->
        <script src="https://kit.fontawesome.com/3cafd6d965.js" crossorigin="anonymous"></script>
        <!--CSS-->
        <link rel="stylesheet" href="css/lista-matricula.css">
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
            <div class="row my-3 ">
                <div class="col">
                    <h1>Lista de Matrículas</h1>
                </div>                
            </div>
            <!-- BUSCAR -->
            <div class="row my-3">
                <div class="col">
                    <h6 class="label-dni">N° de DNI del estudiante</h6>
                    <form class="d-flex" role="search">
                        <input id="campo-buscar" class="form-control " type="search" aria-label="Search">                   
                        <button id="btn-buscar" class="btn btn-outline-success mx-5 px-4" type="submit">
                            <i id="icon-buscar" class="fa-solid fa-magnifying-glass" style="color: #ffffff;"></i>
                            Buscar    
                        </button>
                    </form>

                </div>
                <a class="col contenedor-btnAgregar d-flex justify-content-end align-items-center" href="NavController?modulo=vacantes">
                    <button type="button" id="btn-agregarEst" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#modal-agregar">
                        <i id="icon-agregar" class="fa-solid fa-plus" style="color: #ffffff;"></i>
                        Nueva Matrícula
                    </button>
                </a>
            </div>
            <!-- tabla -->
            <div class="row my-4">
            <div class="col">
                <div class="table-container table-responsive">
                    <table id="tabla" class="table table-borderless table-hover">
                        <thead>
                            <tr>
                                <th>Código</th>
                                <th>N° de DNI</th>
                                <th>Nombres</th>
                                <th>Apellido Paterno</th>
                                <th>Apellido Materno</th>
                                <th>Nivel</th>
                                <th>Grado</th>
                                <th>Estado</th>
                                <th> </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>N0005</td>
                                <td>76859403</td>
                                <td>Alex</td>
                                <td>Mendoza</td>
                                <td>Sánchez</td>
                                <td>Inicial</td>
                                <td>3 años</td>
                                <td>
                                    <p class="status activa">Activa</p>
                                </td>
                                <td>
                                    <a class="icono-accion mx-1" href="#" data-bs-toggle="modal" data-bs-target="#modal-editar">
                                        <i class="fa-solid fa-pen-to-square fa-lg" style="color: #ffffff;"></i>      
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
            
        </div>
    </body>
</html>
