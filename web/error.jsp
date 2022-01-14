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
    <section class="login-dark">
        <nav class="navbar navbar-light navbar-expand-md navigation-clean-button">
            <div class="container"><a class="navbar-brand">TIENDA SCOUT</a>
            <li class="nav-item"><a class="nav-link" href="index.html">Inicio</a></li>
                <div class="collapse navbar-collapse" id="navcol-1">
                    <ul class="navbar-nav me-auto"></ul> 
                    <span class="navbar-text actions"> 
                      <a class="login" href="index.html">Log In</a>
                      <a class="btn btn-light action-button" role="button" href="signUp.html">Sign Up</a>
                    </span>
                </div>
            </div>
        </nav>
        <div clas="container">
            
            <form action="index.html" method="POST">
                <%
                String error = (String) getServletContext().getAttribute("error");
            %>
            <h3> <%= error%> </h3>
                <input type="submit" value="Volver a intentarlo" class="btn btn-light action-button">
            </form>
        </div>
    </section>

    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
