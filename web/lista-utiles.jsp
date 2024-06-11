<%-- 
    Document   : lista-utiles
    Created on : 26 nov 2023, 22:49:05
    Author     : André
--%>

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
    <link rel="stylesheet" href="css/lista-utiles.css">
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
                <a href="#">
                    <button type="button"id="btn-listaUt" class="btn btn-light">Lista de útiles</button>
                </a>
                <a href="registro-utiles.jsp">
                    <button type="button"id="btn-registroUt" class="btn btn-light">Registro de útiles</button>
                </a>
                        
            </div>
            <div class="col-2">
                <button type="button" id="btn-impr" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#modal-no-encontrado">
                    <i class="fa-solid fa-print fa-lg" style="color: #000000;"></i>
                </button>
            </div>
            <div class="col-1">
                <button type="button" id="btn-correo" class="btn btn-light" >
                    <i class="fa-solid fa-envelope fa-lg" style="color: #000000;"></i>
                </button>
            </div>
        </div>
        <!--Buscar util por nivel y grado-->
        <div class="row my-4">
            <div class="col">
                <h6 class="label-dni">Seleccione el nivel:</h6>
                <select id="select-vinculo" class="form-select my-1" style="border: 2px solid black;border-radius: 3px;" aria-label="Default select example">
                    <option selected >Select</option>
                    <option value="1">Inicial</option>
                    <option value="2">Primaria</option>
                    <option value="3">Secundaria</option>
                </select>
                
                
                
            </div>
            <div class="col">
                <h6 class="label-dni">Seleccione el grado:</h6>
                <select id="select-vinculo" class="form-select my-1" style="border: 2px solid black;border-radius: 3px;" aria-label="Default select example">
                    <option selected >Select</option>
                    <option value="1">1°</option>
                    <option value="2">2°</option>
                    <option value="3">3°</option>
                    <option value="4">4°</option>
                    <option value="5">5°</option>
                </select>     
            </div>
            <div class="col contenedor-btnBuscar d-flex align-items-center">
                <button id="btn-buscar" class="btn btn-outline-success mx-5 px-4" type="submit">
                    <i id="icon-buscar" class="fa-solid fa-magnifying-glass" style="color: #ffffff;"></i>
                    Buscar    
                </button>
                
            </div>
            <div class="col contenedor-btnAgregar d-flex justify-content-end align-items-center">
                <button type="button" id="btn-agregarEst" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#modal-sel-util">
                    <i id="icon-agregar" class="fa-solid fa-plus" style="color: #ffffff;"></i>
                    Agregar útil a la lista
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
        <!--MODAL agregar util a lista / Seccion Seleccionar util-->
        <div class="modal modal-xl" data-bs-backdrop="static" data-bs-keyboard="false" id="modal-sel-util">
            <div class="modal-dialog">
                <div class="modal-content px-4" id="modal-contenido">
                    <div class="modal-header">
                        <h4 class="modal-title">Agregar útil a la lista</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col my-4">
                                <!--Secciones-->
                                <div class="Secciones">
                                    <button type="button" id="btn-sel-util" class="btn btn-success">
                                        <i class="fa-solid fa-check fa-xl" style="color: #ffffff;"></i>
                                    </button>
                                    <h5 style="color: #f2d12e; margin: 0px 23px; margin-top: 10px; font-weight: bold;font-size: 17px;">Seleccionar útil</h5>
                                    <i class="fa-solid fa-chevron-right fa-lg" style="color: #00ae86;margin-top: 21px;"></i>
                                    <button type="button" id="btn-sel-lista" class="btn btn-success mx-4" data-bs-toggle="modal" data-bs-target="#modal-sel-lista">02</button>
                                    <h5 style="color: white;margin-top: 10px; font-weight: bold;font-size: 17px;">Seleccionar lista</h5>
                                </div> 
                            </div>
                        </div>
                        <div class="row my-2">
                            <div class="col">
                                <h6 class="label-dni" style="color: white;">Código:</h6>
                                <input id="campo-buscar" style="background-color: #222222; border: 2px solid white; border-radius: 3px; color: white;" class="form-control " type="search" aria-label="Search">
                            </div>
                            <div class="col">
                                <h6 class="label-dni" style="color: white;">Nombre:</h6>
                                <input id="campo-buscar" style="background-color: #222222; border: 2px solid white; border-radius: 3px; color: white;" class="form-control " type="search" aria-label="Search">    
                            </div>
                        </div>
                        <div class="row my-4">
                            <div class="col">
                                <h6 style="color: white;font-weight: bold;font-size: 18px;">Útiles encontrados</h6>
                                <div class="contenedor-tablas d-flex">
                                    <div class="table-container2 table-responsive">
                                        <table id="tabla2" class="table table-borderless table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Código</th>
                                                    <th>Nombre</th> 
                                                    <th>Acción</th>                                                       
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>UE0001</td>
                                                    <td>Cuaderno cuadriculado A4</td>
                                                    <td>
                                                        <a class="icono-accion mx-1" href="#" >
                                                            <i class="fa-solid fa-plus fa-lg" style="color: #ffffff;"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>UE0005</td>
                                                    <td>Cuaderno triple renglón A4</td>
                                                    <td>
                                                        <a class="icono-accion mx-1" href="#" >
                                                            <i class="fa-solid fa-plus fa-lg" style="color: #ffffff;"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    <i class="fa-solid fa-chevron-right fa-lg" style="color: #00ae86;margin-top: 70px;"></i>

                                    <div class="table-container2 table-responsive">
                                        <table id="tabla2" class="table table-borderless table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Código</th>
                                                    <th>Nombre</th> 
                                                    <th>Acción</th>                                                       
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>UE0003</td>
                                                    <td>Cuaderno rayado A4</td>
                                                    <td>
                                                        <a class="icono-accion mx-1" href="#" >
                                                            <i class="fa-solid fa-minus fa-lg" style="color: #ffffff;"></i>
                                                        </a>
                                                    </td>
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
        </div>

        <!--MODAL agregar util a lista / Sección Seleccionar lista-->
        <div class="modal modal-xl" data-bs-backdrop="static" data-bs-keyboard="false" id="modal-sel-lista"">
            <div class="modal-dialog">
                <div class="modal-content px-4" id="modal-contenido">
                    <div class="modal-header">
                        <h4 class="modal-title">Agregar útil a la lista</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col my-4">
                                <!--Secciones-->
                                <div class="Secciones">
                                    <button type="button" id="btn-sel-util2" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modal-sel-util">
                                        01
                                    </button>
                                    <h5 style="color: white; margin: 0px 23px; margin-top: 10px; font-weight: bold;font-size: 17px;">Seleccionar útil</h5>
                                    <i class="fa-solid fa-chevron-right fa-lg" style="color: #00ae86;margin-top: 21px;"></i>
                                    <button type="button" id="btn-sel-lista2" class="btn btn-success mx-4" data-bs-toggle="modal" data-bs-target="#modal-sel-lista">
                                        <i class="fa-solid fa-check fa-xl" style="color: #ffffff;"></i>
                                    </button>
                                    <h5 style="color: #f2d12e;margin-top: 10px; font-weight: bold;font-size: 17px;">Seleccionar lista</h5>
                                </div> 
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div id="contenido-lista-actual" class="contenido activo">
                                    <h5 style="color: white; font-weight: bold;font-size: 17px;">Lista a agregar:</h5>
                                    <div class="table-container2 table-responsive">
                                        <table id="tabla2" class="table table-borderless table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Nivel</th>
                                                    <th>Grado</th>                                                       
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Primaria</td>
                                                    <td>1ro</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <div id="contenido-lista-multiple" class="contenido">
                                    <div class="row">
                                        <div class="col">
                                            <label id="etiqueta" for="Nivel">Seleccionar nivel:</label>
                                            <select class="form-select my-1" style="border: 2px solid black;border-radius: 3px; width: 170px;" aria-label="Default select example">
                                                <option selected >Select</option>
                                                <option value="1">Inicial</option>
                                                <option value="2">Primaria</option>
                                                <option value="3">Secundaria</option>
                                            </select>
                                            <label id="etiqueta" for="Grado">Seleccionar grado:</label>
                                            <select class="form-select my-1" style="border: 2px solid black;border-radius: 3px; width: 170px;" aria-label="Default select example">
                                                <option selected >Select</option>
                                                <option value="1">1°</option>
                                                <option value="2">2°</option>
                                                <option value="3">3°</option>
                                                <option value="4">4°</option>
                                                <option value="5">5°</option>
                                            </select>
                                            <button type="button" class="btn btn-primary my-4" id="btn-añadir-grado">Añadir grado</button>
                                        </div>
                                        <div class="col">
                                            <h5 style="color: white; font-weight: bold;font-size: 17px;">Lista a agregar:</h5>
                                            <div class="table-container2 table-responsive">
                                                <table id="tabla2" class="table table-borderless table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th>Nivel</th>
                                                            <th>Grado</th>
                                                            <th>Acción</th>                                                       
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Primaria</td>
                                                            <td>2do</td>
                                                            <td>
                                                                <a class="icono-accion mx-1" href="#" >
                                                                    <i class="fa-solid fa-minus fa-lg" style="color: #ffffff;"></i>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Primaria</td>
                                                            <td>3ro</td>
                                                            <td>
                                                                <a class="icono-accion mx-1" href="#" >
                                                                    <i class="fa-solid fa-minus fa-lg" style="color: #ffffff;"></i>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    
                                    
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-check my-3">
                                    <input class="form-check-input" type="radio" name="opcion" id="radio-lista-act1" value="option1" onclick="mostrarContenido('actual')" checked>
                                    <label class="form-check-label" for="radio-lista-act1" style="color: white;">
                                    Lista actual
                                    </label>
                                </div>
                                <div class="form-check ">
                                    <input class="form-check-input" type="radio" name="opcion" id="radio-lista-mult1" value="option2" onclick="mostrarContenido('multiple')">
                                    <label class="form-check-label" for="radio-lista-mult1" style="color: white;">
                                    Múltiples listas
                                    </label>
                                </div>
                                <br><br><br>
                                <button type="button" class="btn btn-primary my-4" id="btn-agregar2">Agregar útiles</button>
                            </div>
                        </div>
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
                        <h6 style="color: white;">¿Está seguro de eliminar este útil escolar de la lista?</h4>
                    </div>
                    <div class="modal-footer" id="contenedor-botones">
                        <button type="button" id="btn-cancelar" class="btn btn-secondary mx-2" data-bs-dismiss="modal">Cancelar</button>
                        <button type="button" id="btn-eliminar" class="btn btn-primary">Eliminar</button>
                    </div>
                </div>
            </div>
        </div>



        <!------MODAL FLUJO ALTERNATIVOS---------->
        <!--Modal No se encontro una lista-->
        <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" id="modal-no-encontrado">
            <div class="modal-dialog">
                <div class="modal-content" id="modal-contenido-error-est">
                    <div class="modal-header" style="border-bottom: none;">
                        <h4 class="modal-title" style="color: black;">No se encontró una lista</h4>
                    </div>
                    <div class="modal-body">
                        <h6 style="color: black; font-size: 14px;">Para imprimir o enviar por email, primero elija el nivel
                        y el grado, y seleccione Buscar.
                        </h6>
                    </div>
                    <div class="modal-footer" style="border-top: none;" id="contenedor-botones-error-est">
                        <button type="button" id="btn-aceptar" class="btn btn-primary px-3" data-bs-dismiss="modal">¡Entendido!</button>
                    </div>
                </div>
            </div>
        </div>
        
    </div>

    <script>
        function mostrarContenido(opcion) {
            // Ocultar todos los contenidos
            document.getElementById('contenido-lista-actual').classList.remove('activo');
            document.getElementById('contenido-lista-multiple').classList.remove('activo');

            // Mostrar el contenido correspondiente a la opción seleccionada
            if (opcion === 'actual') {
                document.getElementById('contenido-lista-actual').classList.add('activo');
                }
            else if (opcion === 'multiple') {
                document.getElementById('contenido-lista-multiple').classList.add('activo');
            } 
        }
    </script>
    
</body>
</html>
