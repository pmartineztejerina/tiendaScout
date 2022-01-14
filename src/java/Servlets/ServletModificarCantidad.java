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
public class ServletModificarCantidad extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext contexto = getServletContext();
        RequestDispatcher rd;
        HttpSession sesion = request.getSession();

        String nombreUsuario = (String) sesion.getAttribute("nombreUsuario");
        if (sesion.getAttribute("nombreUsuario") == null) {
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
        
        int producto_id=Integer.parseInt(request.getParameter("producto_id"));
        int cantidad=Integer.parseInt(request.getParameter("cantidad"));
            //miro si el producto esta ya en la lista, recorriendola
            
            if (listaRopa!=null) {
            for (Producto lista : listaRopa) {                
                if (lista.getProducto_id()==producto_id) {                   
                    //y lo modifico en la lista
                    lista.setCantidad(cantidad);
                    break;
                } 
            }
            }
            
            if (listaInsignias!=null) {
            for (Producto lista : listaInsignias) {                
                if (lista.getProducto_id()==producto_id) {                    
                    //y lo modifico en la lista
                    lista.setCantidad(cantidad);
                    break;
                } 
            }
            }
            
            if (listaComplementos!=null) {
            for (Producto lista : listaComplementos) {                
                if (lista.getProducto_id()==producto_id) {
                    //y lo modifico en la lista
                    lista.setCantidad(cantidad);
                    break;
                } 
            }
            }
            
            if (listaAcampada!=null) {
            for (Producto lista : listaAcampada) {                
                if (lista.getProducto_id()==producto_id) {
                    //y lo modifico en la lista
                    lista.setCantidad(cantidad);
                    break;
                } 
            }
            }
            
            if (listaLibros!=null) {
            for (Producto lista : listaLibros) {                
                if (lista.getProducto_id()==producto_id) {
                    //y lo modifico en la lista
                    lista.setCantidad(cantidad);
                    break;
                } 
            }
            }
            
            sesion.setAttribute("listaRopa", listaRopa);
            sesion.setAttribute("listaInsignias", listaInsignias);
            sesion.setAttribute("listaComplementos", listaComplementos);
            sesion.setAttribute("listaAcampada", listaAcampada);
            sesion.setAttribute("listaLibros", listaLibros);
            request.getRequestDispatcher("/resumenCompra.jsp").forward(request, response);
    }
}
