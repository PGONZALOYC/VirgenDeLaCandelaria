<%-- 
    Document   : reportes
    Created on : 27 nov. 2023, 15:38:29
    Author     : Patrick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reporte</title>
    <!--FontAwesome-->
    <script src="https://kit.fontawesome.com/3cafd6d965.js" crossorigin="anonymous"></script>
    <!--CSS-->
    <link rel="stylesheet" href="css/reportes.css">
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
                        <button type="button"id="btn-estudiante" class="btn btn-light">Estudiante</button>
                    </a>
                    <a href="reporte-apoderados.jsp">
                        <button type="button"id="btn-apoderados" class="btn btn-light">Apoderados</button>
                    </a>         
                    <a href="reporte-vacantes.jsp">
                        <button type="button"id="btn-vacantes" class="btn btn-light">Vacantes</button>
                    </a> 
                    <a href="reporte-matriculas.jsp">
                        <button type="button"id="btn-matriculas" class="btn btn-light">Matriculas</button>
                    </a> 
                    <a href="reporte-utiles.jsp">
                        <button type="button"id="btn-utiles" class="btn btn-light">Utiles</button>
                    </a> 
                    <a href="reporte-pagos.jsp">
                        <button type="button"id="btn-pagos" class="btn btn-light">Pagos</button>
                    </a>  
                </div>
            </div>
         <!--Buscar por filtro -->
            <div class="row my-3">
                <div class="col">
                    <h6 class="label-filtros">Filtros:</h6>
                </div>
                <div class="col">
                  <label id="etiqueta" for="porNivel">Por nivel</label>
                    <select class="form-select my-1" style="border: 2px solid black;border-radius: 3px;" aria-label="Default select example">
                                        <option selected >Select</option>
                                        <option value="1">Inicial</option>
                                        <option value="2">Primaria</option>
                                        <option value="3">Secundaria</option>                                               
                    </select>
                </div> 
               <div class="col">
                <label id="etiqueta" for="grado">Por grado:</label>
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
                  <label id="etiqueta" for="genero">Por genero</label>
                    <select class="form-select my-1" style="border: 2px solid black;border-radius: 3px;" aria-label="Default select example">
                                        <option selected >Select</option>
                                        <option value="1">Masculino</option>
                                        <option value="2">Femenino</option>                                               
                    </select>
                </div> 
                <!-- Generar reporte -->
                <div class="col contenedor-btnGenerar d-flex justify-content-end align-items-center">
                    <button type="button" id="btn-generar" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#modal-generar">
                        <i id="icon-agregar" class="fa-solid fa-plus" style="color: #ffffff;"></i>
                        Generar reporte
                    </button>

                </div>
            </div>
          </div>
    </body>
</html>



