<%-- 
    Document   : error
    Created on : 20 dic. 2021, 18:11:15
    Author     : watanga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>LOG IN</title>
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
        <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
        <link rel="stylesheet" href="assets/css/Header-Blue.css">
        <link rel="stylesheet" href="assets/css/Login-Form-Dark.css">
        <link rel="stylesheet" href="assets/css/Navigation-with-Button.css">
        <link rel="stylesheet" href="assets/css/styles.css">

    </head>

    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand">Tienda Scout</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="index.html">Inicio</a>                           
                        </li>
                    </ul>
                </div>
            </div>
        </nav>    
        <section class="login-dark">
            <div clas="container">
                <div class="mb-0" style="text-align: center">
                    <form action="index.html" method="POST">
                        <%
                            String error = (String) getServletContext().getAttribute("error");
                        %>
                        <h3> <%= error%> </h3>
                        <input type="submit" value="Volver a intentarlo" class="btn btn-light action-button">
                    </form>
                </div>
            </div>
        </section>

        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
