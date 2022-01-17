<%-- 
    Document   : detalleProducto
    Created on : 15 ene. 2022, 19:29:27
    Author     : watanga
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>TIENDA SCOUT DETALLE PRODUCTO</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="assets/css/styles.css" rel="stylesheet" />
    </head>
    <%
        HttpSession sesion = request.getSession();
        String nombreUsuario = (String) sesion.getAttribute("nombreUsuario");
        if (sesion.getAttribute("nombreUsuario") == null) {
            //lo envio al index
            response.sendRedirect("index.html");
        }
        ServletContext contexto = getServletContext();
        RequestDispatcher rd;

        int producto_id = Integer.parseInt(request.getParameter("producto_id"));
        double precio_venta = Double.parseDouble(request.getParameter("precio_venta"));

        Producto producto;

        producto = Dao.Db.encuentraProducto(producto_id);

        String producto_nombre = producto.getProducto_nombre();
        int categoria_id = producto.getCategoria_id();
        double producto_precio = producto.getProducto_precio();
        double producto_descuento = producto.getProducto_descuento();
        String producto_foto = producto.getProducto_foto();

        ArrayList<Producto> listaCompra;
        listaCompra = (ArrayList<Producto>) sesion.getAttribute("listaCompra");

        String src_imagen = "img/" + producto_foto + ".jpg";

        //comprobar si la lista tiene articulos
        int productosCarro = 0;
        if (listaCompra != null) {
            productosCarro += listaCompra.size();
        }
    %>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand">Tienda Scout <%=nombreUsuario%></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="indexRopa.jsp">Inicio</a>                           
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Categorias
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a <input class="dropdown-item" type="button" value="Ropa" onclick="location.href = 'indexRopa.jsp'">Ropa</a></li>
                                <li><a <input class="dropdown-item" type="button" value="Insignias" onclick="location.href = 'indexInsignias.jsp'">Insignias</a></li> 
                                <li><a <input class="dropdown-item" type="button" value="Complementos" onclick="location.href = 'indexComplementos.jsp'">Complementos</a></li>
                                <li><a <input class="dropdown-item" type="button" value="Acampada" onclick="location.href = 'indexAcampada.jsp'">Acampada</a></li>
                                <li><a <input class="dropdown-item" type="button" value="Libros" onclick="location.href = 'indexLibros.jsp'">Libros</a></li>
                            </ul>
                        </li>                                  
                    </ul>
                    <form class="d-flex" action="resumenCompra.jsp" method="POST">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Carrito
                            <span class="badge bg-dark text-white ms-1 rounded-pill"><%=productosCarro%></span>
                        </button>
                    </form>
                </div>
            </div>
        </nav>

        <header class="bg-dark py-3">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">DETALLE PRODUCTO</h1>
                </div>
            </div>
        </header>
        <section class>
            <div class="container ">
                <div class="row  justify-content-center">
                    <!-- PRIMER PRODUCTO -->
                    <div class="mb-3"></div>
                    <div class="col justify-content-center">
                        <div class="card" style="width: 18rem;">
                            <!-- Sale badge-->
                            <%
                                if (producto_descuento > 0) {
                            %>
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">
                                Descuento</div>
                                <%
                                    }
                                %>                            
                            <!-- Product image-->
                            <img class="card-img-top" src="<%=src_imagen%>" width="50%" alt="<%=producto_nombre%>" />
                            <!-- Product details-->
                            <div class="card-body">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><%=producto_nombre%></h5>
                                    <!-- Product price-->
                                    <%
                                        if (producto_descuento > 0) {
                                    %>
                                    <span class="text-muted text-decoration-line-through"><%=producto_precio%> €</span>
                                    <%
                                        }
                                    %>
                                    <%=precio_venta%> €
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer bg-transparent">
                                <!-- Añadir al carro-->
                                <form action="ServletAgregarACarro" method="POST">
                                    <input type="hidden" name="producto_id" value="<%=producto_id%>">
                                    <input type="hidden" name="precio_venta" value="<%=precio_venta%>">
                                    <div class="text-center">
                                        <label>Cantidad</label>
                                        <select name="cantidad">
                                            <option value="1" selected>1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                        </select>
                                    </div>
                                    <div class="mb-3"></div>
                                    <div class="text-center"><input type="submit" class="btn btn-outline-dark mt-auto"
                                                                    value="Añadir a carrito"></div>
                                </form>
                            </div>
                            <div class="mb-5"></div>

                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="assets/js/scripts.js"></script>
    </body>
    <footer>
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Tienda Scout Pilar Martinez 2022</p></div>
        </footer>
    </footer>

</html>
