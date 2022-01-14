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
public class ServletEliminarProducto extends HttpServlet {

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
        
        Producto producto = Dao.Db.encuentraProducto(producto_id);
        
        listaRopa.remove(producto);
        
    }
}
