/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Modelo.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
public class ServletConfirmacionCompra extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sesion = request.getSession();
        ServletContext contexto=getServletContext();
        RequestDispatcher rd;

        String nombreUsuario = (String) sesion.getAttribute("nombreUsuario");
        
        int usuario_id=Dao.Db.consultaIdUsuario(nombreUsuario);
        
        if (sesion.getAttribute("nombreUsuario") == null) {
            //lo envio al index
            response.sendRedirect("index.html");
        }
        double total= (double) sesion.getAttribute("total");
        
        ArrayList<Producto> listaCompra;
        listaCompra = (ArrayList<Producto>) sesion.getAttribute("listaCompra");
                     
        Dao.Db.altaPedido(usuario_id, total);
        
        int pedido_id=Dao.Db.numeroPedido();
        
        for (Producto producto : listaCompra) {
            Dao.Db.altaDetallePedido(producto,pedido_id);
        }
        
        listaCompra.clear();
        String mensaje="Muchas gracias por su compra";
        contexto.setAttribute("mensaje", mensaje);
        rd=contexto.getRequestDispatcher("/indexRopa.jsp");
        rd.forward(request, response);
        
    }

}
