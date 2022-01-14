/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Modelo.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author watanga
 */
public class ServletAgregarCarroRopa extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ServletContext contexto = getServletContext();
        RequestDispatcher rd;
        HttpSession sesion = request.getSession();

        int producto_id = Integer.parseInt(request.getParameter("producto_id"));
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        double precio_venta = Double.parseDouble(request.getParameter("precio_venta"));

        ArrayList<Producto> listaRopa;
        Producto producto;
        listaRopa = (ArrayList<Producto>) sesion.getAttribute("listaRopa");

        if (listaRopa == null) {
            listaRopa = new ArrayList<Producto>();
            producto = Dao.Db.encuentraProducto(producto_id, cantidad, precio_venta);
            listaRopa.add(producto);

        } else {
            producto = Dao.Db.encuentraProducto(producto_id, cantidad, precio_venta);

            //miro si el producto esta ya en la lista, recorriendola
            if (listaRopa.contains(producto)) {
                for (Producto lista : listaRopa) {

                    if (lista.getProducto_id() == producto_id) {
                        //y lo modifico en la lista
                        int cantidadLista=lista.getCantidad();
                        cantidadLista+=cantidad;
                        lista.setCantidad(cantidadLista);
                        break;
                    }
                }
            } else {
                listaRopa.add(producto);
            }
        }
        sesion.setAttribute("listaRopa", listaRopa);
        request.getRequestDispatcher("/indexRopa.jsp").forward(request, response);

    }
}
