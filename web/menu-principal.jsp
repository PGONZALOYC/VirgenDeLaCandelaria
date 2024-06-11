<%-- 
    Document   : menu-principal
    Created on : 20 nov. 2023, 14:13:10
    Author     : salaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Iniciar Sesión</title>
        <link rel="stylesheet" href="css/menu-principal.css?v=1.2" type="text/css" />
        <%@include file="referencias.jsp" %>
    </head>
    <body>
        <div>
            <input type="checkbox" id="checkbox">
            <div class="body">
                <%@include file="barra-lateral.jsp" %> 
            </div>
            <div class="main-container container-fluid vh-100 m-0 p-0" >
                <div class="contenedor vh-100 p-0 m-0 ">
                    <div class="col-12 p-0 mx-auto">
                        <div class=" justify-content-center">
                            <div class="col-12 d-flex justify-content-center p-0 p-sm-5">
                                <div class="d-flex align-items-center">
                                    <img src="img/icono1.png" class="img-fluid" width="250px" height="200px" alt="Icono"/>
                                </div>
                                <div class="d-flex flex-column justify-content-center align-items-start ml-3">
                                    <p class="mb-0">BIENVENIDO</p>
                                    <p class="mb-0">LOS RAMIREZ ESTRADA</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex justify-content-end col-12 p-0 m-0">
                        <div class="d-flex justify-content-end justify-content-sm-center align-items-center col-10 row mx-sm-auto m-0 p-0">
                            <div class="main-options col-10 col-sm-6 col-lg-3 p-0 p-0 mx-0 me-2 my-2 m-sm-3 m-md-5">
                                <a href="NavController?modulo=vacantes" class="vacantes-contenedor text-decoration-none h-100 row m-0">
                                    <div class="fondo-vacantes col-6 p-0 ">
                                        <img class="img-fluid" src="img/icono2.png" width="250px" height="200px"/>
                                    </div>
                                    <div class="titulo-vacante  d-flex justify-content-center align-items-center col-6 p-0">
                                        <p id="vacantes" class="m-0">VACANTES</p>
                                    </div>
                                </a>
                            </div>
                            <div class="main-options col-10 col-sm-6 col-lg-3 p-0 p-0 mx-0 me-2 my-2 m-sm-3 m-md-5">
                                <a href="NavController?modulo=estudiantes" class="estudiantes-contenedor  text-decoration-none h-100 row m-0">   
                                    <div class="fondo-estudiantes col-6 p-0 ">
                                        <img class="img-fluid" src="img/icono3.png" width="250px" height="200px"/>
                                    </div>
                                    <div class="titulo-estudiantes  d-flex justify-content-center align-items-center col-6 p-0">
                                        <p id="estudiantes" class="m-0">ESTUDIANTES</p>
                                    </div>
                                </a>
                            </div>
                            <div class="main-options col-10 col-sm-6 col-lg-3 p-0 p-0 mx-0 me-2 my-2 m-sm-3 m-md-5">
                                <a href="NavController?modulo=matriculas" class="matricula-contenedor  text-decoration-none h-100 row m-0">   
                                    <div class="fondo-matricula col-6 p-0 ">
                                        <img class="img-fluid" src="img/icono7.png" width="250px" height="180px"/>
                                    </div>
                                    <div class="titulo-matricula  d-flex justify-content-center align-items-center col-6 p-0">
                                        <p id="matricula" class="m-0">MATRÍCULA</p>
                                    </div>
                                </a>
                            </div>
                            <div class="main-options col-10 col-sm-6 col-lg-3 p-0 p-0 mx-0 me-2 my-2 m-sm-3 m-md-5">
                                <a href="NavController?modulo=pagos" class="reservas-contenedor  text-decoration-none h-100 row m-0">   
                                    <div class="fondo-reservas col-6 p-0 ">
                                        <img class="img-fluid" src="img/icono5.png" width="250px" height="200px"/>
                                    </div>
                                    <div class="titulo-reservas d-flex justify-content-center align-items-center col-6 p-0">
                                        <p id="reservas" class="m-0">PAGOS</p>
                                    </div>
                                </a>
                            </div>
                            <div class="main-options col-10 col-sm-6 col-lg-3 p-0 p-0 mx-0 me-2 my-2 m-sm-3 m-md-5">
                                <a href="lista-utiles.jsp" class="utiles-contenedor text-decoration-none h-100 row m-0">   
                                    <div class="fondo-utiles col-6 p-0 ">
                                        <img class="img-fluid" src="img/icono4.png" width="250px" height="200px"/>
                                    </div>
                                    <div class="titulo-utiles d-flex justify-content-center align-items-center col-6 p-0">
                                        <p id="utiles" class="m-0">ÚTILES</p>
                                    </div>
                                </a>
                            </div>
                            <div class="main-options col-10 col-sm-6 col-lg-3 p-0 p-0 mx-0 me-2 my-2 m-sm-3 m-md-5">
                                <a href="reportes.jsp" class="reportes-contenedor text-decoration-none h-100 row m-0">   
                                    <div class="fondo-reportes col-6 p-0">
                                        <img class="img-fluid" src="img/icono6.png" width="250px" height="180px"/>
                                    </div>
                                    <div class="titulo-utiles d-flex justify-content-center align-items-center col-6 p-0">
                                        <p id="reportes" class="m-0">REPORTES</p>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
