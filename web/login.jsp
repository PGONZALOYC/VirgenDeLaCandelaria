<body class="vh-100">
    <section class="h-100">
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-xl-8">
                    <div class="fondo-opaco rounded-3 text-black">
                        <div class="row d-flex justify-content-center g-0">
                            <div class="col-lg-6">
                                <div class="card-body p-3 mx-2 p-sm-5 mx-sm-4">
                                    <div class="d-flex justify-content-center" >
                                        <img class="img-fluid" src="img/insignia.png"  style="width: 185px;" alt="logo">
                                    </div>
                                    <form action="Autentica" method="post">
                                        <div data-mdb-input-init class="form-outline mb-4">
                                            <label class="form-label" for="usuario">Usuario</label>
                                            <input type="email" id="usuario" name="email" class="form-control" placeholder="Correo electrónico" />
                                        </div>
                                        <div data-mdb-input-init class="form-outline mb-4">
                                            <label class="form-label" for="contrasenha">Contraseña</label>
                                            <input type="password" id="contrasenha" name="password" class="form-control" />
                                        </div>
                                        <div class="form-outline mb-4">
                                            <input type="checkbox" class="form-check-input" id="exampleCheck1" />
                                            <label class="form-check-label" for="exampleCheck1">Recordarme</label>
                                        </div>
                                        <div class="form-outline mb-4 text-center">
                                            <a href="recuperacion-contraseña.jsp" class="form-check-label" for="exampleCheck1">¿Olvidaste tu contraseña?</a>
                                        </div>
                                        <div class="mb-4">
                                            <div class="g-recaptcha" data-sitekey="6Lelo-gpAAAAAHzFiPbw6R9wJH6YpYNpOhBGAFcY"></div>
                                        </div>
                                        <div class="mb-4 text-center">
                                            <%
                                            if(credenciales_incorrectas){
                                            %>
                                            <div class="col-12">
                                                <strong style="color:red; padding-left: 40px;" class=" p-0">Correo y/o contrase?a incorrectos</strong>
                                            </div>
                                            <%
                                            }
                                            if(captcha_incorrecto){
                                            %>
                                            <div class="col-12">
                                                <strong style="color:red; padding-left: 85px;" class="col-12 p-0">Captcha incorrecto</strong>
                                            </div>
                                            <%
                                            }
                                            %>
                                        </div>
                                        <div class="d-flex justify-content-center boton">
                                            <button  type="submit" class="btn btn-primary" name="accion" value="Ingresar">Iniciar Sesión</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script>
        $(document).ready(function () {
            function scaleCaptcha() {
                let width = $('.g-recaptcha').parent().width();
                if (width < 302) {
                    var scale = width / 302;
                    $('.g-recaptcha').css('transform', 'scale(' + scale + ')');
                    $('.g-recaptcha').css('-webkit-transform', 'scale(' + scale + ')');
                    $('.g-recaptcha').css('transform-origin', '0 0');
                    $('.g-recaptcha').css('-webkit-transform-origin', '0 0');
                } else {
                    $('.g-recaptcha').css('transform', 'scale(1)');
                    $('.g-recaptcha').css('-webkit-transform', 'scale(1)');
                    $('.g-recaptcha').css('transform-origin', '0 0');
                    $('.g-recaptcha').css('-webkit-transform-origin', '0 0');
                }
            }
            // Inicializar el redimensionamiento del captcha
            scaleCaptcha();
            // Redimensionar el captcha cuando la ventana cambia de tama?o
            $(window).resize(function () {
                scaleCaptcha();
            });
        });
    </script>
</body>


