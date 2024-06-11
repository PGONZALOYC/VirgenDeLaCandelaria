<%-- 
    Document   : index
    Created on : 15 nov. 2023, 23:13:25
    Author     : salaz
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean credenciales_incorrectas = false;
    boolean captcha_incorrecto = false;
    if (request.getAttribute("credenciales_incorrectas") != null){
        credenciales_incorrectas = (boolean) request.getAttribute("credenciales_incorrectas");
    }
    if (request.getAttribute("captcha_incorrecto") != null){
            captcha_incorrecto = (boolean) request.getAttribute("captcha_incorrecto");
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Virgen de la Candelaria</title>
        <link rel="stylesheet" href="css/login.css?v=1.1" type="text/css" />
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <%@include file="referencias.jsp" %>
    </head>
    <%@include file="login.jsp" %>
</html>
