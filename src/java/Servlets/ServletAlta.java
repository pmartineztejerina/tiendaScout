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
public class ServletAlta extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext contexto=getServletContext();
        RequestDispatcher rd;
        
        String nombre=request.getParameter("nombre");
        String apellidos=request.getParameter("apellidos");
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        String direccion=request.getParameter("direccion");
        String telefono=request.getParameter("telefono");
        
        boolean existeUsuario = Dao.Db.existeUsuario(email);
        
        if (!existeUsuario) {
            Dao.Db.nuevoUsuario(nombre,apellidos,email,password,direccion,telefono);
       
            rd=contexto.getRequestDispatcher("/index.html");
            rd.forward(request,response);
        
        } else {
            String error="El email introducido ya esta dado de alta para un cliente";
            contexto.setAttribute("error", error);
            rd=contexto.getRequestDispatcher("/error.jsp");
            rd.forward(request, response);
        }
        
        
    }  
}
