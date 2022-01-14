/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author watanga
 */
public class ServletCategoria extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext contexto=getServletContext();
        RequestDispatcher rd;
        
        String categoria=request.getParameter("categorias");
        switch (categoria) {
            case "ropa":
                rd=request.getRequestDispatcher("/indexRopa.jsp");
                rd.forward(request, response);
                break;
            case "insignias":
                rd=request.getRequestDispatcher("/indexInsignias.jsp");
                rd.forward(request, response);
                break;  
            case "complementos":
                rd=request.getRequestDispatcher("/indexComplementos.jsp");
                rd.forward(request, response);
                break;
            case "acampada":
                rd=request.getRequestDispatcher("/indexAcampada.jsp");
                rd.forward(request, response);
                break;
            case "libros":
                rd=request.getRequestDispatcher("/indexLibros.jsp");
                rd.forward(request, response);
                break;
        }
               
        
    }
   
}
