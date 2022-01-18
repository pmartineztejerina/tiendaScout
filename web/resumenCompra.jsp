<%-- 
    Document   : resumenCompra
    Created on : 2 ene. 2022, 15:11:12
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
        <title>TIENDA SCOUT CARRITO</title>
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
        String usuario_tipo=(String) sesion.getAttribute("usuario_tipo"); 
        if (sesion.getAttribute("nombreUsuario") == null) {
            //lo envio al index
            response.sendRedirect("index.html");
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
                        <form class="d-flex" action="salir" method="POST">
                        <button class="btn btn-outline-dark" type="submit">                          
                            Salir                            
                        </button>
                    </form>
                    </ul>
                </div>
            </div>
        </nav>
        <header class="bg-dark py-3">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">RESUMEN COMPRA</h1>
                </div>
            </div>
        </header>
        <section class="bg-black">

            <div class="mb-3"></div>
            <table class="table table-borderless table-primary table-responsive">
                <thead>
                    <tr>
                        <th scope="col">PRODUCTO</th>
                        <th scope="col" style="text-align: center">CANTIDAD</th>
                        <th scope="col" style="text-align: center">PRECIO</th>
                        <th scope="col" style="text-align: center">DESCUENTO</th>
                        <th scope="col" style="text-align: center">PRECIO VENTA</th>
                        <th scope="col" style="text-align: center">SUBTOTAL</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>                               
                    <%
                        ArrayList<Producto> listaCompra;
                        listaCompra = (ArrayList<Producto>) sesion.getAttribute("listaCompra");

                        double total = 0;

                        if (listaCompra != null) {
                            for (Producto lista : listaCompra) {
                    %>
                    <tr>
                        <td>
                            <%=lista.getProducto_nombre()%>                                                  
                        </td>                                               
                        <td style="text-align: center"> 
                            <form action="ServletModificarCantidad" method="POST">
                                <input type="number" name="cantidad" value="<%=lista.getCantidad()%>" min="1"> 
                                <input type="hidden" name="producto_id" value="<%=lista.getProducto_id()%>">
                                <input type="submit" value="MODIFICAR">
                            </form>
                        </td> 
                        <td style="text-align: center" size="2">
                            <%=lista.getProducto_precio()%> €                                                  
                        </td>
                        <td style="text-align: center">
                            <%=Math.round(lista.getProducto_descuento() * 100)%> %                                                 
                        </td>
                        <td style="text-align: center">
                            <%=lista.getPrecio_venta()%> €                                                  
                        </td>
                        <td style="text-align: center">
                            <%=Math.round((lista.getPrecio_venta() * lista.getCantidad()) * 100.0) / 100.0%> €                                                  
                        </td>  
                        <td style="text-align: center"> 
                            <form action="ServletEliminarProducto" method="POST">                                                       
                                <input type="hidden" name="producto_id" value="<%=lista.getProducto_id()%>">
                                <input type="submit" value="ELIMINAR">
                            </form>
                        </td> 

                        <%
                                total += lista.getPrecio_venta() * lista.getCantidad();
                            }
                        %>
                    </tr>
                    <%
                        }

                        sesion.setAttribute("total", total);
                    %>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <th>TOTAL</th>
                        <th style="text-align: center"><%=Math.round(total * 100.0) / 100.0%></th>                                                       
                    </tr>
                </tbody>
            </table> 
            <form action="ServletConfirmacionCompra" method="POST">
                <div class="mb-3"><input type="submit" class="btn btn-primary d-block w-100" value="Confirmar compra"></div>
                <div class="mb-3"><input type="button" class="btn btn-primary d-block w-100" onclick="location.href = 'indexRopa.jsp'" value="Seguir comprando"></div>
            </form>
        </section>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="assets/js/scripts.js"></script>
    </body>
    <!-- Footer-->
    <footer class="py-5 bg-dark">
        <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Tienda Scout Pilar Martinez 2022</p></div>
    </footer>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="assets/js/scripts.js"></script>
</body>
</html>

