<%-- 
    Document   : indexLibros
    Created on : 10 ene. 2022, 21:38:20
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
        <title>TIENDA SCOUT CATEGORIA LIBROS</title>
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
                    <h1 class="display-4 fw-bolder">LIBROS</h1>
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
                            <!-- Product image-->
                            <img class="card-img-top" src="img/foto_41.jpg" alt="Escultismo para muchachos. Lord Robert Baden Powel" />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Escultismo para muchachos. Lord Robert Baden Powel</h5>
                                    <!-- Product price-->
                                    18.95 €
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroLibros" method="POST">
                                    <input type="hidden" name="producto_id" value="41">  
                                    <input type="hidden" name="precio_venta" value="18.95">
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
                            <img class="card-img-top" src="img/foto_42.jpg" alt="El libro de las tierras virgenes. Rudyard Kipling" />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">El libro de las tierras virgenes. Rudyard Kipling</h5>
                                    <!-- Product price-->
                                    23.65 €
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroLibros" method="POST">
                                    <input type="hidden" name="producto_id" value="42"> 
                                    <input type="hidden" name="precio_venta" value="23.65">
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
                        <!-- Product image-->
                        <img class="card-img-top" src="img/foto_43.jpg" alt="Proyecto Hercules XXI SCA" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Proyecto Hercules XXI SCA</h5>
                                <!-- Product price-->
                                5.00 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroLibros" method="POST">
                                    <input type="hidden" name="producto_id" value="43"> 
                                    <input type="hidden" name="precio_venta" value="5.00">
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
                        <!-- Product image-->
                        <img class="card-img-top" src="img/foto_44.jpg" alt="Cuaderno de Chapoteo de Castores de MSC" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Cuaderno de Chapoteo de Castores de MSC</h5>
                                <!-- Product price-->
                                7.50 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroLibros" method="POST">
                                    <input type="hidden" name="producto_id" value="44"> 
                                    <input type="hidden" name="precio_venta" value="7.50">
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
                        <!-- Product image-->
                        <img class="card-img-top" src="img/foto_45.jpg" alt="Cuaderno de Caza de Lobatos de MSC" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Cuaderno de Caza de Lobatos de MSC</h5>
                                <!-- Product price-->
                                7.50 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroLibros" method="POST">
                                    <input type="hidden" name="producto_id" value="45">  
                                    <input type="hidden" name="precio_venta" value="7.50">
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
                        <!-- Product image-->
                        <img class="card-img-top" src="img/foto_46.jpg" alt="Cuaderno del explorador" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Cuaderno del explorador</h5>
                                <!-- Product price-->
                                7.50 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroLibros" method="POST">
                                    <input type="hidden" name="producto_id" value="46">  
                                    <input type="hidden" name="precio_venta" value="7.50">
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
                        <img class="card-img-top" src="img/foto_47.jpg" alt="Cartas de navegacion" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Sale Item</h5>
                                <!-- Product price-->
                                7.50 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroLibros" method="POST">
                                    <input type="hidden" name="producto_id" value="47">  
                                    <input type="hidden" name="precio_venta" value="7.50">
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
                        <!-- Product image-->
                        <img class="card-img-top" src="img/foto_48.jpg" alt="Manual ruta" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Manual ruta</h5>
                                <!-- Product price-->
                                7.50 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroLibros" method="POST">
                                    <input type="hidden" name="producto_id" value="48">   
                                    <input type="hidden" name="precio_venta" value="7.50">
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
                        <!-- Product image-->
                        <img class="card-img-top" src="img/foto_49.jpg" alt="Evangelio scout para el animador de fe" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Evangelio scout para el animador de fe</h5>
                                <!-- Product price-->
                                4.00 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroLibros" method="POST">
                                    <input type="hidden" name="producto_id" value="49"> 
                                    <input type="hidden" name="precio_venta" value="4.00">
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
                        <!-- Product image-->
                        <img class="card-img-top" src="img/foto_50.jpg" alt="Cuadernillo del consiliario" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Cuadernillo del consiliario</h5>
                                <!-- Product price-->
                                3.00 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroLibros" method="POST">
                                    <input type="hidden" name="producto_id" value="50"> 
                                    <input type="hidden" name="precio_venta" value="3.00">
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