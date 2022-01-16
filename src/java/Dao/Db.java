/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Modelo.Pedido;
import Modelo.Producto;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author watanga
 */
public class Db {
    public static String usuario = "root";
    public static String password = "";
    public static String servidor = "localhost:3306";
    public static String basedatos = "tiendascout";
    
    public static Connection CrearConexion() {
        Connection cnn = null;
        try {
            System.out.println("*****************************");
            Class.forName("com.mysql.jdbc.Driver"); //invocamos al driver
            String url = "jdbc:mysql://" + servidor + "/" + basedatos;
            cnn = (Connection) DriverManager.getConnection(url, usuario, password); //nos conectamos a la BD
        } catch (ClassNotFoundException c) {
            System.out.println("Controlador JDBC no encontrado" + c.toString());
        } catch (SQLException ex) {
            System.out.println("Fallo en la conexion" + ex.toString());
        }
        return cnn;
    }
    
    public static String consultaUsuario(String user) {
        Connection cnn = null;
        String passwordUser = "";
        String sql = "SELECT usuario_password FROM usuario WHERE usuario_email='" + user + "'";
        try {
            cnn = CrearConexion();
            PreparedStatement pst = cnn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                passwordUser = rs.getString(1);
            } else {
                passwordUser = "X";
            }
            if (cnn != null) {
                cnn.close();
            }

        } catch (SQLException ex) {
            System.out.println("Controlador JDBC no encontrado" + ex.toString());
        }
        return passwordUser;
    }
    
    public static String consultaNombreUsuario(String usuario) {
        Connection cnn = null;
        String usuarioNombre = "";
        String sql = "SELECT usuario_nombre FROM usuario WHERE usuario_email='" + usuario + "'";
        try {
            cnn = CrearConexion();
            PreparedStatement pst = cnn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                usuarioNombre = rs.getString(1);
            } 
            if (cnn != null) {
                cnn.close();
            }

        } catch (SQLException ex) {
            System.out.println("Controlador JDBC no encontrado" + ex.toString());
        }
        return usuarioNombre;
    }
    
    public static String consultaTipoUsuario(String nombreUsuario) {
        
        Connection cnn = null;
        String usuarioTipo = "";
        String sql = "SELECT usuario_tipo FROM usuario WHERE usuario_nombre='" + nombreUsuario + "'";
        try {
            cnn = CrearConexion();
            PreparedStatement pst = cnn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                usuarioTipo = rs.getString(1);
            } 
            if (cnn != null) {
                cnn.close();
            }

        } catch (SQLException ex) {
            System.out.println("Controlador JDBC no encontrado" + ex.toString());
        }
        return usuarioTipo;
    }
    
    public static void nuevoUsuario(String nombre, String apellidos, String email, String password, String direccion, String telefono) {
        Connection cnn=null;
        
        String tipo="usuario";
        
        String sql="INSERT INTO usuario(usuario_nombre, usuario_apellidos, usuario_tipo, usuario_email, usuario_password, usuario_direccion, usuario_telefono) VALUES (?,?,?,?,?,?,?)";
        try {
            cnn=CrearConexion();
            PreparedStatement pst;
            pst=cnn.prepareStatement(sql);
            
            pst.setString(1, nombre);
            pst.setString(2, apellidos);
            pst.setString(3, tipo);
            pst.setString(4, email);
            pst.setString(5, password);
            pst.setString(6, direccion);
            pst.setString(7, telefono);
            
            pst.executeUpdate();
            pst=null;
            
            if(cnn != null) {
            cnn.close();
            }
            
        } catch (SQLException e) {
            System.out.println("Controlador JDBC no encontrado"+e.toString());
        }
    }

    public static Producto encuentraProducto(int producto_id, int cantidad, double precio_venta) {
        Producto producto;
        producto=null;
        Connection cnn=null;
        String sql="SELECT producto_nombre, categoria_id, producto_detalle, producto_precio, producto_descuento, producto_foto FROM producto WHERE producto_id='"+producto_id+"'";
        try {
            cnn=CrearConexion();
            PreparedStatement pst;
            pst=cnn.prepareStatement(sql);
            ResultSet rs=pst.executeQuery();
            while(rs.next()){
                String producto_nombre=rs.getString(1);
                int categoria_id=rs.getInt(2);
                String producto_detalle=rs.getString(3);
                double producto_precio=rs.getDouble(4);
                double producto_descuento=rs.getDouble(5);;
                String producto_foto=rs.getString(6);
                
                producto=new Producto(producto_id,producto_nombre,categoria_id,producto_detalle,producto_precio,producto_descuento,producto_foto,cantidad,precio_venta);
               
            }
        } catch (SQLException e) {
            System.out.println("Controlador JDBC no encontrado"+e.toString());
        }
        
        return producto;
    }

   
public static Producto encuentraProducto(int producto_id) {
        Producto producto;
        producto=null;
        Connection cnn=null;
        String sql="SELECT producto_nombre, categoria_id, producto_detalle, producto_precio, producto_descuento, producto_foto FROM producto WHERE producto_id='"+producto_id+"'";
        try {
            cnn=CrearConexion();
            PreparedStatement pst;
            pst=cnn.prepareStatement(sql);
            ResultSet rs=pst.executeQuery();
            while(rs.next()){
                String producto_nombre=rs.getString(1);
                int categoria_id=rs.getInt(2);
                String producto_detalle=rs.getString(3);
                double producto_precio=rs.getDouble(4);
                double producto_descuento=rs.getDouble(5);;
                String producto_foto=rs.getString(6);
                
                producto=new Producto(producto_id,producto_nombre,categoria_id,producto_detalle,producto_precio,producto_descuento,producto_foto);
               
            }
        } catch (SQLException e) {
            System.out.println("Controlador JDBC no encontrado"+e.toString());
        }
        
        return producto;
    }

    public static int consultaIdUsuario(String nombreUsuario) {
        
        int usuario_id=0;
        Connection cnn = null;
        String usuarioNombre = "";
        String sql = "SELECT usuario_id FROM usuario WHERE usuario_nombre='" + nombreUsuario + "'";
        try {
            cnn = CrearConexion();
            PreparedStatement pst = cnn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                usuario_id=rs.getInt(1);
            } 
            if (cnn != null) {
                cnn.close();
            }

        } catch (SQLException ex) {
            System.out.println("Controlador JDBC no encontrado" + ex.toString());
        }
        return usuario_id;
    }

    public static void altaPedido(int usuario_id, double pedido_total) {
              
        Connection cnn=null;
        
        String sql="INSERT INTO pedido (usuario_id, pedido_total) VALUES (?,?)";
        try {
            cnn=CrearConexion();
            PreparedStatement pst;
            pst = cnn.prepareStatement(sql);
            
            pst.setInt(1, usuario_id);
            pst.setDouble(2, pedido_total);
            
            pst.executeUpdate();
            pst=null;
            
            
            
            if(cnn != null){
                cnn.close();
            }
            
        } catch (SQLException e) {
            System.out.println("Controlador JDBC no encontrado"+e.toString());
        }
    
    }

    public static int numeroPedido() {
        
        int pedido_id=0;
        
        Connection cnn=null;
        String sql="SELECT MAX(pedido_id) FROM pedido";
        try {
            cnn=CrearConexion();
            PreparedStatement pst;
            pst=cnn.prepareStatement(sql);
            ResultSet rs=pst.executeQuery();
            if(rs.next()){
                pedido_id=rs.getInt(1);  
            }
        } catch (SQLException e) {
            System.out.println("Controlador JDBC no encontrado"+e.toString());
        }
        return pedido_id;
    }

    public static void altaDetallePedido(Producto producto, int pedido_id) {
        
        Connection cnn=null;
        String sql="INSERT INTO detallepedido (pedido_id, producto_id, detalle_cantidad) VALUES (?,?,?)";
        int producto_id=producto.getProducto_id();
        int detalle_cantidad=producto.getCantidad();
        try {
            cnn=CrearConexion();
            PreparedStatement pst;
            pst = cnn.prepareStatement(sql);
            
            pst.setInt(1, pedido_id);
            pst.setInt(2, producto_id);
            pst.setInt(3, detalle_cantidad);
            
            pst.executeUpdate();
            pst=null;
            
            
            
            if(cnn != null){
                cnn.close();
            }
            
        } catch (SQLException e) {
            System.out.println("Controlador JDBC no encontrado"+e.toString());
        }
        
    }

    
    
    
}
