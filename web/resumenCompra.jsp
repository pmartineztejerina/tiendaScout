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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>TIENDA SCOUT</title>
   <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/Header-Blue.css">
    <link rel="stylesheet" href="assets/css/Login-Form-Dark - usuario.css">
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
    <section class="bg-black">
    
        <nav class="navbar navbar-light navbar-expand-md navigation-clean-button">
            <div class="container"><a class="navbar-brand">TIENDA SCOUT</a>          
                <div class="collapse navbar-collapse" id="navcol-1">
                    <ul class="navbar-nav me-auto"><%=nombreUsuario %></ul>                     
                </div>
            </div>
        </nav>     
<!--         <form action="ServletModificarCantidad" method="POST">                   -->
                    <h2 class="visually">RESUMEN COMPRA</h2>
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
                                ArrayList<Producto> listaRopa;
                                listaRopa = (ArrayList<Producto>) sesion.getAttribute("listaRopa");
                                ArrayList<Producto> listaInsignias;
                                listaInsignias = (ArrayList<Producto>) sesion.getAttribute("listaInsignias");
                                ArrayList<Producto> listaComplementos;
                                listaComplementos = (ArrayList<Producto>) sesion.getAttribute("listaComplementos");
                                ArrayList<Producto> listaAcampada;
                                listaAcampada = (ArrayList<Producto>) sesion.getAttribute("listaAcampada");
                                ArrayList<Producto> listaLibros;
                                listaLibros = (ArrayList<Producto>) sesion.getAttribute("listaLibros");
                                
                                double total=0;
                                
                                if (listaRopa!=null) {
                                       for (Producto lista : listaRopa) {
                                       %>
                                               <tr>
                                               <td>
                                                   <%=lista.getProducto_detalle() %>                                                  
                                               </td>                                               
                                               <td style="text-align: center"> 
                                                   <form action="ServletModificarCantidad" method="POST">
                                                        <input type="number" name="cantidad" value="<%=lista.getCantidad() %>" min="1"> 
                                                        <input type="hidden" name="producto_id" value="<%=lista.getProducto_id() %>">
                                                        <input type="submit" value="MODIFICAR">
                                                   </form>
                                               </td> 
                                               <td style="text-align: center" size="2">
                                                   <%=lista.getProducto_precio()%> €                                                  
                                               </td>
                                               <td style="text-align: center">
                                                   <%=Math.round(lista.getProducto_descuento()*100) %> %                                                 
                                               </td>
                                               <td style="text-align: center">
                                                   <%=lista.getPrecio_venta() %> €                                                  
                                               </td>
                                               <td style="text-align: center">
                                                   <%=Math.round((lista.getPrecio_venta()*lista.getCantidad())*100.0)/100.0%> €                                                  
                                               </td>  
                                               <td style="text-align: center"> 
                                                   <form action="ServletEliminarProducto" method="POST">                                                       
                                                        <input type="hidden" name="producto_id" value="<%=lista.getProducto_id() %>">
                                                        <input type="submit" value="ELIMINAR">
                                                   </form>
                                               </td> 
                                               
                                           <%
                                               total+=lista.getPrecio_venta()*lista.getCantidad();
                                               }
                                               %>
                                               </tr>
                                               <%
                                    }
                                    if (listaInsignias!=null) {
                                       for (Producto lista : listaInsignias) {
                                       %>
                                               <tr>
                                               <td>
                                                   <%=lista.getProducto_detalle() %>                                                  
                                               </td>                                               
                                               <td style="text-align: center">                                                    
                                                        <input class="w-25" type="number" name="cantidad" value="<%=lista.getCantidad() %>" min="1"> 
                                                        <input type="hidden" name="producto_id" value="<%=lista.getProducto_id() %>">
                                                        <input type="submit" value="MODIFICAR">                                                                                                    
                                               </td> 
                                               <td style="text-align: center">
                                                   <%=lista.getProducto_precio()%> €                                                  
                                               </td>
                                               <td style="text-align: center">
                                                   <%=Math.round(lista.getProducto_descuento()*100) %> %                                                 
                                               </td>
                                               <td style="text-align: center">
                                                   <%=lista.getPrecio_venta() %> €                                                  
                                               </td>
                                               <td style="text-align: center">
                                                   <%= Math.round((lista.getPrecio_venta()*lista.getCantidad())*100.0)/100.0%> €                                                  
                                               </td> 
                                               
                                           <%
                                               total+=lista.getPrecio_venta()*lista.getCantidad();
                                               }
                                               %>
                                               </tr>
                                               <%
                                    }
                                    if (listaComplementos!=null) {
                                       for (Producto lista : listaComplementos) {
                                       %>
                                               <tr>
                                               <td>
                                                   <%=lista.getProducto_detalle() %>                                                  
                                               </td>                                               
                                               <td style="text-align: center">
                                                        <input class="w-25" type="number" name="cantidad" value="<%=lista.getCantidad() %>" min="1"> 
                                                        <input type="hidden" name="producto_id" value="<%=lista.getProducto_id() %>">
                                                        <input type="submit" value="MODIFICAR">                                                
                                               </td> 
                                               <td style="text-align: center">
                                                   <%=lista.getProducto_precio()%> €                                                  
                                               </td>
                                               <td style="text-align: center">
                                                   <%=Math.round(lista.getProducto_descuento()*100) %> %                                                 
                                               </td>
                                               <td style="text-align: center">
                                                   <%=lista.getPrecio_venta() %> €                                                  
                                               </td>
                                               <td style="text-align: center">
                                                   <%= Math.round((lista.getPrecio_venta()*lista.getCantidad())*100.0)/100.0%> €                                                  
                                               </td> 
                                              
                                           <%                                              
                                               total+=lista.getPrecio_venta()*lista.getCantidad();
                                               }
                                               %>
                                               </tr>
                                               <%
                                    }
                                    if (listaAcampada!=null) {
                                       for (Producto lista : listaAcampada) {
                                       %>
                                               <tr>
                                               <td>
                                                   <%=lista.getProducto_detalle() %>                                                  
                                               </td>                                               
                                               <td style="text-align: center">
                                                        <input class="w-25" type="number" name="cantidad" value="<%=lista.getCantidad() %>" min="1"> 
                                                        <input type="hidden" name="producto_id" value="<%=lista.getProducto_id() %>">
                                                        <input type="submit" value="MODIFICAR">                                                 
                                               </td> 
                                               <td style="text-align: center">
                                                   <%=lista.getProducto_precio()%> €                                                  
                                               </td>
                                               <td style="text-align: center">
                                                   <%=Math.round(lista.getProducto_descuento()*100) %> %                                                 
                                               </td>
                                               <td style="text-align: center">
                                                   <%=lista.getPrecio_venta() %> €                                                  
                                               </td>
                                               <td style="text-align: center">
                                                   <%= Math.round((lista.getPrecio_venta()*lista.getCantidad())*100.0)/100.0%> €                                                  
                                               </td>  
                                               </tr>
                                           <%
                                               total+=lista.getPrecio_venta()*lista.getCantidad();
                                               }
                                               %>
                                               </tr>
                                               <%
                                    }
                                    if (listaLibros!=null) {
                                       for (Producto lista : listaLibros) {
                                       %>
                                               <tr>
                                               <td>
                                                   <%=lista.getProducto_detalle() %>                                                  
                                               </td>                                               
                                               <td style="text-align: center">
                                                        <input class="w-25" type="number" name="cantidad" value="<%=lista.getCantidad() %>" min="1"> 
                                                        <input type="hidden" name="producto_id" value="<%=lista.getProducto_id() %>">
                                                        <input type="submit" value="MODIFICAR">                                                 
                                               </td> 
                                               <td style="text-align: center">
                                                   <%=lista.getProducto_precio()%> €                                                  
                                               </td>
                                               <td style="text-align: center">
                                                   <%=Math.round(lista.getProducto_descuento()*100) %> %                                                 
                                               </td>
                                               <td style="text-align: center">
                                                   <%=lista.getPrecio_venta() %> €                                                  
                                               </td>
                                               <td style="text-align: center">
                                                   <%= Math.round((lista.getPrecio_venta()*lista.getCantidad())*100.0)/100.0%> €                                                  
                                               </td>  
                                               </tr>
                                           <%
                                               total+=lista.getPrecio_venta()*lista.getCantidad();
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
                                                   <th style="text-align: center"><%=Math.round(total*100.0)/100.0%></th>                                                       
                                               </tr>
                            </tbody>
                        </table> 
                  
                    <div class="mb-3"><input type="button" class="btn btn-primary d-block w-100" onclick="location.href='ServletConfirmacionCompra'" value="Confirmar compra"></div>
                    <div class="mb-3"><input type="button" class="btn btn-primary d-block w-100" onclick="location.href='categorias.jsp'" value="Seguir comprando"></div>
<!--                </form>-->
    </section>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

