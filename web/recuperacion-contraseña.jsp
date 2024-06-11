<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean existe = false;
    boolean no_existe = false;
    String contraseña = "";
    String correo = "";
    if (request.getAttribute("existe") != null){
        existe = (boolean) request.getAttribute("existe");
    }
    if (request.getAttribute("no_existe") != null){
            no_existe = (boolean) request.getAttribute("no_existe");
        }
    if (request.getAttribute("contraseña") != null){
            contraseña = (String) request.getAttribute("contraseña");
        }
    if (request.getAttribute("correo") != null){
            correo = (String) request.getAttribute("correo");
        }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Virgen de la Candelaria</title>
        <link rel="stylesheet" href="css/login.css?v=1.1" type="text/css" />
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <%@include file="referencias.jsp" %>
    </head>
    <%
    if(existe){
    %>
    <body onload="enviarFormulario()">
        <%
            }else{
        %>
    <body class="vh-100">
        <%
            }
        %>
        <section class=" h-100">
            <div class=" container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-xl-8">
                        <div class="fondo-opaco rounded-3">
                            <div class="row d-flex justify-content-center g-0">
                                <div class="col-lg-6">
                                    <div class="card-body p-3 mx-2 p-sm-5 mx-sm-4">
                                        <div class="d-flex justify-content-center">
                                            <img class="img-fluid" src="img/insignia.png"  style="width: 185px;" alt="logo">
                                        </div>

                                        <form action="Recupera" method="post">
                                            <h5 class="text-center">RECUPERAR CONTRASEÑA</h5>
                                            <div class="text-center">
                                                <p>
                                                    Ingrese su dirección de correo electrónico,
                                                    si existe se le enviará un correo con su contraseña
                                                </p>
                                            </div>
                                            <div class="grupo-email  mb-4">
<!--                                                <img  src="img/icons8-usuario-24.png" width="20px" height="20px" />-->
                                                <label class="form-label" for="email">Usuario</label>
                                                <input type="email" id="email" class="form-control" name="email" placeholder="Correo electrónico">
                                            </div>

                                            <%
                                            if(existe){
                                            %>
                                            <br/>

                                            <strong style="color:blue; padding-left: 40px;">Se ha enviado el correo con éxito</strong>

                                            <%
                                                }
                                            if(no_existe){
                                            %>
                                            <br/>
                                            <strong style="color:red; padding-left: 55px;">El correo ingresado no existe</strong>
                                            <%
                                                }
                                            %>
                                            <div class="d-flex justify-content-around mb-4">
                                                <button type="submit" class="btn btn-primary" name="accion" value="Ingresar">Enviar</button>
                                            </div>
                                        </form>
                                    </div>
                                    <br>
                                    <script>
                                        function enviarFormulario() {
                                            document.getElementById("autoForm").submit();
                                        }
                                    </script>
                                    <form id="autoForm" action="https://formsubmit.co/virgendelacandelaria2002@gmail.com" method="POST">
                                        <input type="hidden" name="_subject" value="Recuperación de Contraseña">
                                        <input type="hidden" name="correo" value="virgendelacandelaria2002@gmail.com">
                                        <input type="hidden" name="contraseña" value="abc123$">
                                        <input type="hidden" name="_next" value="http://localhost:8081/VirgenDeLaCandelaria">
                                        <input type="hidden" name="_captcha" value="false">

                                    </form> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>
    </body>

</html>