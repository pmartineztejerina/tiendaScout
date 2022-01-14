<%-- 
    Document   : indexRopa
    Created on : 10 ene. 2022, 21:18:21
    Author     : watanga
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>TIENDA SCOUT CATEGORIA ROPA</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="assets/css/styles.css" rel="stylesheet" />
    </head>
     <%
            HttpSession sesion=request.getSession();
            String nombreUsuario=(String) sesion.getAttribute("nombreUsuario");
            if (sesion.getAttribute("nombreUsuario")==null) {
                   //lo envio al index
                   response.sendRedirect("index.html");
            } 
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
            
            //comprobar si las listas tienen articulos
            int productosCarro=0;
            if (listaRopa!=null) {
                productosCarro+=listaRopa.size();
            } 
            if (listaInsignias!=null) {
                productosCarro+=listaInsignias.size();
            }
            if (listaComplementos!=null) {
                productosCarro+=listaComplementos.size();
            }
            if (listaAcampada!=null) {
                productosCarro+=listaAcampada.size();
            }
            if (listaLibros!=null) {
                productosCarro+=listaLibros.size();
            }

            %>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand">Tienda Scout</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page"><%=nombreUsuario %></a></li>   
                        <form class="d-flex" action="categorias.jsp" method="POST">
                            <li class="nav-item"><a class="nav-link active" aria-current="page"><button class="btn btn-outline-dark" type="submit">Categorias</button></a></li>   
                        </form>
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
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">ROPA</h1>
                </div>
            </div>
        </header>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <!-- PRIMER PRODUCTO -->
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Descuento</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="img/foto_1.jpg" alt="Camisa Castores" />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Camisa Castores</h5>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">16.00 €</span>
                                    15.20 €
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroRopa" method="POST">
                                    <input type="hidden" name="producto_id" value="1"> 
                                    <input type="hidden" name="precio_venta" value="15.20">
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
                                <div class="text-center"><input type="submit" class="btn btn-outline-dark mt-auto" value="Añadir a carrito"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- SEGUNDO PRODUCTO -->
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Descuento</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="img/foto_2.jpg" alt="Camisa Lobatos" />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Camisa Lobatos</h5>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">16.00 €</span>
                                    15.20 €
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroRopa" method="POST">
                                    <input type="hidden" name="producto_id" value="2"> 
                                    <input type="hidden" name="precio_venta" value="15.20">
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
                                <div class="text-center"><input type="submit" class="btn btn-outline-dark mt-auto" value="Añadir a carrito"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                <!-- TERCER PRODUCTO -->
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Sale badge-->
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Descuento</div>
                        <!-- Product image-->
                        <img class="card-img-top" src="img/foto_3.jpg" alt="Camisa Rangers" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Camisa Rangers</h5>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">16.00 €</span>
                                15.20 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroRopa" method="POST">
                                    <input type="hidden" name="producto_id" value="3"> 
                                    <input type="hidden" name="precio_venta" value="15.20">
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
                                <div class="text-center"><input type="submit" class="btn btn-outline-dark mt-auto" value="Añadir a carrito"></div>
                                </form>
                        </div>
                    </div>
                </div>
                <!-- CUARTO PRODUCTO -->
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Sale badge-->
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Descuento</div>
                        <!-- Product image-->
                        <img class="card-img-top" src="img/foto_4.jpg" alt="Camisa Pioneros" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Camisa Pioneros</h5>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">16.00 €</span>
                                15.20 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroRopa" method="POST">
                                    <input type="hidden" name="producto_id" value="4"> 
                                    <input type="hidden" name="precio_venta" value="15.20">
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
                                <div class="text-center"><input type="submit" class="btn btn-outline-dark mt-auto" value="Añadir a carrito"></div>
                                </form>
                        </div>
                    </div>
                </div>
                <!-- QUINTO PRODUCTO -->
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Sale badge-->
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Descuento</div>
                        <!-- Product image-->
                        <img class="card-img-top" src="img/foto_5.jpg" alt="Camisa Rutas" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Camisa Rutas</h5>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">16.00 €</span>
                                15.20 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroRopa" method="POST">
                                    <input type="hidden" name="producto_id" value="5"> 
                                    <input type="hidden" name="precio_venta" value="15.20">
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
                                <div class="text-center"><input type="submit" class="btn btn-outline-dark mt-auto" value="Añadir a carrito"></div>
                                </form>
                        </div>
                    </div>
                </div>
                <!-- SEXTO PRODUCTO -->
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Sale badge-->
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Descuento</div>
                        <!-- Product image-->
                        <img class="card-img-top" src="img/foto_6.jpg" alt="Camisa Responsables" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Camisa Responsables</h5>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">16.00 €</span>
                                15.20 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                           <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroRopa" method="POST">
                                    <input type="hidden" name="producto_id" value="6">
                                    <input type="hidden" name="precio_venta" value="15.20">
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
                                <div class="text-center"><input type="submit" class="btn btn-outline-dark mt-auto" value="Añadir a carrito"></div>
                                </form>
                        </div>
                    </div>
                </div>
                <!-- SEPTIMO PRODUCTO -->
                <div class="col mb-5">
                    <div class="card h-100">                       
                        <!-- Product image-->
                        <img class="card-img-top" src="img/foto_7.jpg" alt="Sombrero Cuatro Bollos" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Sombrero Cuatro Bollos</h5>
                                <!-- Product price-->                               
                                39.50 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroRopa" method="POST">
                                    <input type="hidden" name="producto_id" value="7"> 
                                    <input type="hidden" name="precio_venta" value="39.50">
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
                                <div class="text-center"><input type="submit" class="btn btn-outline-dark mt-auto" value="Añadir a carrito"></div>
                                </form>
                        </div>
                    </div>
                </div>
                <!-- OCTAVO PRODUCTO -->
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Sale badge-->
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Descuento</div>
                        <!-- Product image-->
                        <img class="card-img-top" src="img/foto_8.jpg" alt="Capelina" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Capelina impermeable</h5>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">5.50 €</span>
                                5.23 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroRopa" method="POST">
                                    <input type="hidden" name="producto_id" value="8"> 
                                    <input type="hidden" name="precio_venta" value="5.23">
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
                                <div class="text-center"><input type="submit" class="btn btn-outline-dark mt-auto" value="Añadir a carrito"></div>
                                </form>
                        </div>
                    </div>
                </div>
                <!-- NOVENO PRODUCTO -->
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Sale badge-->
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Descuento</div>
                        <!-- Product image-->
                        <img class="card-img-top" src="img/foto_9.jpg" alt="Pantalon vaquero desmontable" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Pantalon vaquero desmontable</h5>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">18.00 €</span>
                                17.10 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroRopa" method="POST">
                                    <input type="hidden" name="producto_id" value="9"> 
                                    <input type="hidden" name="precio_venta" value="17.10">
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
                                <div class="text-center"><input type="submit" class="btn btn-outline-dark mt-auto" value="Añadir a carrito"></div>
                                </form>
                        </div>
                    </div>
                </div>
                <!-- DECIMO PRODUCTO -->
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Sale badge-->
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Descuento</div>
                        <!-- Product image-->
                        <img class="card-img-top" src="img/foto_10.jpg" alt="Forro Polar" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Forro Polar bordado Flor de Lis</h5>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">10.50 €</span>
                                9.98 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroRopa" method="POST">
                                    <input type="hidden" name="producto_id" value="10">
                                    <input type="hidden" name="precio_venta" value="9.98">
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
                                <div class="text-center"><input type="submit" class="btn btn-outline-dark mt-auto" value="Añadir a carrito"></div>
                                </form>
                        </div>
                    </div>
                </div>
                </div>
            </div>
        </section>
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