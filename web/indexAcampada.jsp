<%-- 
    Document   : indexAcampada
    Created on : 10 ene. 2022, 21:37:49
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
        <title>TIENDA SCOUT CATEGORIA ACAMPADA</title>
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
                    <h1 class="display-4 fw-bolder">ACAMPADA</h1>
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
                            <img class="card-img-top" src="img/foto_31.jpg" alt="Cantimplora Laken de MSC" />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Cantimplora Laken de MSC</h5>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">7.00 €</span>
                                    6.30 €
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroAcampada" method="POST">
                                    <input type="hidden" name="producto_id" value="31">   
                                    <input type="hidden" name="precio_venta" value="6.30">
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
                            <!-- Product image-->
                            <img class="card-img-top" src="img/foto_32.jpg" alt="Bordon Scout" />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Bordon Scout</h5>
                                    <!-- Product price-->
                                    16.00 €
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroAcampada" method="POST">
                                    <input type="hidden" name="producto_id" value="32"> 
                                    <input type="hidden" name="precio_venta" value="16.00">
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
                        <img class="card-img-top" src="img/foto_33.jpg" alt="Navaja multiusos" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Navaja Multiusos Victorinox</h5>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">30.83 €</span>
                                27.47 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroAcampada" method="POST">
                                    <input type="hidden" name="producto_id" value="33"> 
                                    <input type="hidden" name="precio_venta" value="27.47">
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
                        <img class="card-img-top" src="img/foto_34.jpg" alt="Mochila senderismo" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Mochila senderismo 50 litros con funda impermeable</h5>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">79.50 €</span>
                                75.53 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroAcampada" method="POST">
                                    <input type="hidden" name="producto_id" value="34"> 
                                    <input type="hidden" name="precio_venta" value="75.53">
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
                        <img class="card-img-top" src="img/foto_35.jpg" alt="Saco de dormir" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Saco de dormir 5 grados</h5>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">48.50 €</span>
                                46.08 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroAcampada" method="POST">
                                    <input type="hidden" name="producto_id" value="35"> 
                                    <input type="hidden" name="precio_venta" value="46.08">
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
                        <img class="card-img-top" src="img/foto_36.jpg" alt="Esterilla aislante" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Esterilla aislante</h5>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">14.80 €</span>
                                14.06 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroAcampada" method="POST">
                                    <input type="hidden" name="producto_id" value="36">  
                                    <input type="hidden" name="precio_venta" value="14.06">
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
                        <!-- Sale badge-->
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Descuento</div>
                        <!-- Product image-->
                        <img class="card-img-top" src="img/foto_37.jpg" alt="Tienda de campaña" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Tienda de campaña 4 personas</h5>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">68.75 €</span>
                                65.31 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroAcampada" method="POST">
                                    <input type="hidden" name="producto_id" value="37">  
                                    <input type="hidden" name="precio_venta" value="65.31">
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
                        <img class="card-img-top" src="img/foto_38.jpg" alt="Silla plegable" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Silla plegable camping</h5>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">12.99 €</span>
                                12.34 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroAcampada" method="POST">
                                    <input type="hidden" name="producto_id" value="38">  
                                    <input type="hidden" name="precio_venta" value="12.34">
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
                        <img class="card-img-top" src="img/foto_39.jpg" alt="Linterna Led" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Linterna led 30 lúmenes</h5>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">9.99 €</span>
                                9.49 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroAcampada" method="POST">
                                    <input type="hidden" name="producto_id" value="39">  
                                    <input type="hidden" name="precio_venta" value="9.49">
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
                        <img class="card-img-top" src="img/foto_40.jpg" alt="Taza esmaltada" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Taza esmaltada</h5>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">14.60 €</span>
                                13.14 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroAcampada" method="POST">
                                    <input type="hidden" name="producto_id" value="40">  
                                    <input type="hidden" name="precio_venta" value="13.14">
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