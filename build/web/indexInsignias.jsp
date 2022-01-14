<%-- 
    Document   : indexInsignias
    Created on : 10 ene. 2022, 21:36:18
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
        <title>TIENDA SCOUT CATEGORIA INSIGNIAS</title>
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
                    <h1 class="display-4 fw-bolder">INSIGNIAS</h1>
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
                            <img class="card-img-top" src="img/foto_11.jpg" alt="Set insignias Castores" />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Set de Insignias de Progreso de la rama Castores de MSC</h5>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">0.80 €</span>
                                    0.72 €
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroInsignias" method="POST">
                                    <input type="hidden" name="producto_id" value="11"> 
                                    <input type="hidden" name="precio_venta" value="0.72">
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
                            <img class="card-img-top" src="img/foto_12.jpg" alt="Set insignias Lobatos" />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Set de Insignias de Progreso de la rama Lobatos de MSC</h5>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">2.30 €</span>
                                    2.07 €
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroInsignias" method="POST">
                                    <input type="hidden" name="producto_id" value="12"> 
                                    <input type="hidden" name="precio_venta" value="2.07">
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
                        <img class="card-img-top" src="img/foto_13.jpg" alt="Set insignias Rangers" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Set de Insignias de Progreso de la rama Rangers de MSC</h5>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">3.50 €</span>
                                3.15 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroInsignias" method="POST">
                                    <input type="hidden" name="producto_id" value="13">  
                                    <input type="hidden" name="precio_venta" value="3.15">
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
                        <img class="card-img-top" src="img/foto_14.jpg" alt="Set insignias Pioneros" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Set de Insignias de Progreso de la rama Pioneros de MSC</h5>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">1.80 €</span>
                                1.62 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroInsignias" method="POST">
                                    <input type="hidden" name="producto_id" value="14">  
                                    <input type="hidden" name="precio_venta" value="1.62">
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
                        <img class="card-img-top" src="img/foto_15.jpg" alt="Insignia Rutas" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Insignias de Progreso de la rama Rutas de MSC</h5>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">0.70 €</span>
                                0.63 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroInsignias" method="POST">
                                    <input type="hidden" name="producto_id" value="15">
                                    <input type="hidden" name="precio_venta" value="0.63">
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
                        <img class="card-img-top" src="img/foto_16.jpg" alt="Insignia tejida MSC" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Insignia Tejida de MSC para bolsillo delantero camisa</h5>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">0.95 €</span>
                                0.86 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroInsignias" method="POST">
                                    <input type="hidden" name="producto_id" value="16"> 
                                    <input type="hidden" name="precio_venta" value="0.86">
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
                        <img class="card-img-top" src="img/foto_17.jpg" alt="Insignia tejida oficial MSC" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Insignia tejida oficial MSC</h5>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">2.00 €</span>
                                1.80 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroInsignias" method="POST">
                                    <input type="hidden" name="producto_id" value="17">  
                                    <input type="hidden" name="precio_venta" value="1.80">
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
                        <img class="card-img-top" src="img/foto_18.jpg" alt="Insignia flor de lis" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Insignia Scout Flor de Lis Mundial (FLM)</h5>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">2.00 €</span>
                                1.80 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroInsignias" method="POST">
                                    <input type="hidden" name="producto_id" value="18">  
                                    <input type="hidden" name="precio_venta" value="1.80">
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
                        <img class="card-img-top" src="img/foto_19.jpg" alt="Insignia tejida curva MSC" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Insignia Tejida Curva Scouts MSC para brazo camisa</h5>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">0.70 €</span>
                                0.63 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroInsignias" method="POST">
                                    <input type="hidden" name="producto_id" value="19"> 
                                    <input type="hidden" name="precio_venta" value="0.63">
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
                        <img class="card-img-top" src="img/foto_20.jpg" alt="insignia tejida responsable" />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Insignia Tejida Responsable MSC para brazo camisa</h5>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">0.45 €</span>
                                0.41 €
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- Añadir al carro-->
                                <form action="ServletAgregarCarroInsignias" method="POST">
                                    <input type="hidden" name="producto_id" value="20"> 
                                    <input type="hidden" name="precio_venta" value="0.41">
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