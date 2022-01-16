<%-- 
    Document   : verPedido
    Created on : 16 ene. 2022, 23:39:29
    Author     : watanga
--%>

<%@page import="Modelo.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>TIENDA SCOUT LISTADO CLIENTES</title>
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
        String usuario_tipo = (String) sesion.getAttribute("usuario_tipo");
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
                            <a class="nav-link active" aria-current="page">Inicio</a>                           
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
                        <!-- Menu para administrador -->
                        <% if (usuario_tipo.equals("admin")) {
                        %>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Informacion pedidos
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a <input class="dropdown-item" type="button" value="pedidosFecha" onclick="location.href = 'elegirFechas.jsp'">Filtrado por fechas</a></li>
                                <li><a <input class="dropdown-item" type="button" value="pedidosProductos" onclick="location.href = 'elegirProducto.jsp'">Filtrado por productos</a></li> 
                                <li><a <input class="dropdown-item" type="button" value="pedidosClientes" onclick="location.href = 'elegirCliente.jsp'">Filtrado por cliente</a></li>                           
                            </ul>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                </div>
            </div>
        </nav>

        <header class="bg-dark py-3">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">LISTADO POR PRODUCTO</h1>
                </div>
            </div>
        </header>
        <section class="bg-black">

            <div class="mb-3"></div>
            <table class="table table-borderless table-primary table-responsive">
                <thead>
                    <tr>
                        <th scope="col" style="text-align: center">PEDIDO</th>
                        <th scope="col" style="text-align: center">PEDIDO FECHA</th>
                        <th scope="col" style="text-align: center">USUARIO</th>
                        <th scope="col" style="text-align: center">TOTAL PEDIDO</th>
                    </tr>
                </thead>
                <tbody> 
                <form action="listadoProductos.jsp" method="POST">
                    <%
                        ServletContext contexto = getServletContext();
                        RequestDispatcher rd;
  
                        int pedido_id = Integer.parseInt(request.getParameter("pedido_id"));

                        ArrayList<Pedido> listaPedido = Dao.Db.listaPedido(pedido_id);
                        
                        int producto_id=Integer.parseInt(request.getParameter("producto"));
                        
                        for (Pedido lista : listaPedido) {
                        double pedido_total=lista.getPedido_total();
                    %>
                    <tr>
                        <td style="text-align: center">
                            <%=lista.getPedido_id() %>                                                  
                        </td>                                                                      
                        <td style="text-align: center">                          
                            <%=lista.getPedido_fecha() %>                                                   
                        </td>
                        <td style="text-align: center">
                            <%=lista.getUsuario_id() %>                                                  
                        </td>
                        <td style="text-align: center">
                            <%=Math.round(pedido_total * 100.0) / 100.0%> €                                                  
                        </td>                       
                    </tr>
                    <% }
                    %>

                    </tbody>
            </table> 
                    <input type="hidden" name="producto" value="<%=producto_id %>">
                <input type="submit" class="btn btn-primary" value="Volver">
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