<%-- 
    Document   : categorias
    Created on : 10 ene. 2022, 19:54:33
    Author     : watanga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>TIENDA SCOUT</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/Header-Blue.css">
    <link rel="stylesheet" href="assets/css/Login-Form-Dark.css">
    <link rel="stylesheet" href="assets/css/Navigation-with-Button.css">
    <link rel="stylesheet" href="assets/css/styles.css">     
</head>
 <%
            HttpSession sesion=request.getSession();
            String nombreUsuario=(String) sesion.getAttribute("nombreUsuario");
            if (sesion.getAttribute("nombreUsuario")==null) {
                   //lo envio al index
                   response.sendRedirect("index.html");
                } 
            %>
<body>
    <section class="login-dark">
        <nav class="navbar navbar-light navbar-expand-md navigation-clean-button">
            <div class="container"><a class="navbar-brand">TIENDA SCOUT</a>          
                <div class="collapse navbar-collapse" id="navcol-1">
                    <ul class="navbar-nav me-auto"><%=nombreUsuario %></ul>                     
                </div>
            </div>
        </nav>     
         <form action="ServletCategoria" method="POST">                   
                    <h2 class="visually">CATEGORIAS</h2>
                    <div class="mb-3">
                        <select name="categorias">
                            <option value="ropa" selected>Ropa</option>
                            <option value="insignias">Insignias</option>
                            <option value="complementos">Complementos</option>
                            <option value="acampada">Acampada</option>
                            <option value="libros">Libros</option>
                          </select>
                    </div>
                    <div class="mb-3"><button class="btn btn-primary d-block w-100" type="submit">Seleccionar</button></div>
                </form>
    </section>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

