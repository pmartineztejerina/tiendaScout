/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Modelo.Pedido;
import Modelo.Producto;
import Modelo.Usuario;
import java.sql.Connection;
import java.sql.Date;
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

    public static ArrayList<Usuario> listaUsuarios() {
        ArrayList<Usuario> listaUsuarios=new ArrayList<Usuario>();
        Usuario usuario;
        Connection cnn=null;
        String sql="SELECT usuario_id, usuario_nombre, usuario_apellidos, usuario_email FROM usuario";
        try {
            cnn=CrearConexion();
            PreparedStatement pst;
            pst = cnn.prepareStatement(sql);
            ResultSet rs=pst.executeQuery();
            
            while(rs.next()){
                int usuario_id=rs.getInt(1);
                String usuario_nombre=rs.getString(2);
                String usuario_apellidos=rs.getString(3);
                String usuario_email=rs.getString(4);
                
                usuario=new Usuario(usuario_id, usuario_nombre, usuario_apellidos, usuario_email);
                listaUsuarios.add(usuario);
            }
            pst=null;
            
            if(cnn != null){
                cnn.close();
            }
            
        } catch (SQLException e) {
            System.out.println("Controlador JDBC no encontrado"+e.toString());
        }
    
        return listaUsuarios;
    }
    
    public static ArrayList<Pedido> listaPedidosCliente(int usuario_id) {
        
        ArrayList<Pedido> listaPedidosCliente=new ArrayList<Pedido>();
        Pedido pedido;
        Connection cnn=null;
        String sql="SELECT pedido_id, pedido_fecha, pedido_total FROM pedido WHERE usuario_id='" + usuario_id + "'";
        try {
            cnn=CrearConexion();
            PreparedStatement pst;
            pst = cnn.prepareStatement(sql);
            ResultSet rs=pst.executeQuery();
            
            while(rs.next()){
                int pedido_id=rs.getInt(1);
                Date pedido_fecha=rs.getDate(2);
                double pedido_total=rs.getDouble(3);
 
                
                String fecha=String.format("%1$td-%1$tm-%1$tY", pedido_fecha);
                
                pedido=new Pedido(pedido_id, fecha, usuario_id, pedido_total);
                listaPedidosCliente.add(pedido);
                
            }
            pst=null;
            
            if(cnn != null){
                cnn.close();
            }
            
        } catch (SQLException e) {
            System.out.println("Controlador JDBC no encontrado"+e.toString());
        }
    
        return listaPedidosCliente;
    }
    
    public static ArrayList<Pedido> listaDetallePedido(int pedido_id) {
        
        ArrayList<Pedido> listaDetallePedido=new ArrayList<Pedido>();
        Pedido pedido;
        Connection cnn=null;
        String sql="SELECT detalle_id, producto_id, detalle_cantidad FROM detallepedido WHERE pedido_id='" + pedido_id + "'";
        try {
            cnn=CrearConexion();
            PreparedStatement pst;
            pst = cnn.prepareStatement(sql);
            ResultSet rs=pst.executeQuery();
            
            while(rs.next()){
                int detalle_id=rs.getInt(1);
                int producto_id=rs.getInt(2);
                int detalle_cantidad=rs.getInt(3);

                
                pedido=new Pedido(detalle_id, pedido_id, producto_id, detalle_cantidad);
                listaDetallePedido.add(pedido);              
            }
            pst=null;
            
            if(cnn != null){
                cnn.close();
            }
            
        } catch (SQLException e) {
            System.out.println("Controlador JDBC no encontrado"+e.toString());
        }
    
        return listaDetallePedido;
    }
        
    public static ArrayList<Producto> listaProductos() {
        ArrayList<Producto> listaProductos=new ArrayList<Producto>();
        Producto producto;
        Connection cnn=null;
        String sql="SELECT producto_id, producto_nombre FROM producto";
        try {
            cnn=CrearConexion();
            PreparedStatement pst;
            pst = cnn.prepareStatement(sql);
            ResultSet rs=pst.executeQuery();
            
            while(rs.next()){
                int producto_id=rs.getInt(1);
                String producto_nombre=rs.getString(2);
 
                producto=new Producto(producto_id, producto_nombre);
                listaProductos.add(producto);
            }
            pst=null;
            
            if(cnn != null){
                cnn.close();
            }
            
        } catch (SQLException e) {
            System.out.println("Controlador JDBC no encontrado"+e.toString());
        }
    
        return listaProductos;
    } 
    
    public static ArrayList<Pedido> listaPedidosProducto(int producto_id) {
        
        ArrayList<Pedido> listaPedidosProducto=new ArrayList<Pedido>();
        Pedido pedido;
        Connection cnn=null;
        String sql="SELECT detallepedido.pedido_id, detallepedido.detalle_cantidad, pedido.pedido_fecha, pedido.usuario_id FROM pedido, detallepedido WHERE detallepedido.producto_id="+producto_id+" AND pedido.pedido_id=detallepedido.pedido_id";
        try {
            cnn=CrearConexion();
            PreparedStatement pst;
            pst = cnn.prepareStatement(sql);
            ResultSet rs=pst.executeQuery();
            
            while(rs.next()){
                int pedido_id=rs.getInt(1);       
                int detalle_cantidad=rs.getInt(2);
                Date fecha=rs.getDate(3);
                int usuario_id=rs.getInt(4);
                
                String pedido_fecha=String.format("%1$td-%1$tm-%1$tY", fecha);
                
                pedido=new Pedido(pedido_id, pedido_fecha, detalle_cantidad, usuario_id);
                listaPedidosProducto.add(pedido);
                
            }
            pst=null;
            
            if(cnn != null){
                cnn.close();
            }
            
        } catch (SQLException e) {
            System.out.println("Controlador JDBC no encontrado"+e.toString());
        }
    
        return listaPedidosProducto;
    }
            
    public static ArrayList<Pedido> listaPedido(int pedido_id) {
        
        ArrayList<Pedido> listaPedido=new ArrayList<Pedido>();
        Pedido pedido;
        Connection cnn=null;
        String sql="SELECT pedido_fecha, usuario_id, pedido_total FROM pedido WHERE pedido_id='"+pedido_id+"'";
        try {
            cnn=CrearConexion();
            PreparedStatement pst;
            pst = cnn.prepareStatement(sql);
            ResultSet rs=pst.executeQuery();
            
            while(rs.next()){
                Date fecha=rs.getDate(1);       
                int usuario_id=rs.getInt(2); 
                double pedido_total=rs.getDouble(3);
                
                String pedido_fecha=String.format("%1$td-%1$tm-%1$tY", fecha);
                             
                pedido=new Pedido(pedido_id, pedido_fecha, usuario_id, pedido_total);
                listaPedido.add(pedido);
                
            }
            pst=null;
            
            if(cnn != null){
                cnn.close();
            }
            
        } catch (SQLException e) {
            System.out.println("Controlador JDBC no encontrado"+e.toString());
        }
    
        return listaPedido;
    }  
    
    public static ArrayList<Pedido> listaPedidos(String fecha1, String fecha2) {
        ArrayList<Pedido> listaPedidos=new ArrayList<Pedido>();
        Pedido pedido;
        Connection cnn=null;
        String sql="SELECT pedido_id, pedido_fecha, usuario_id, pedido_total FROM pedido WHERE pedido_fecha BETWEEN '"+fecha1+"' AND '"+fecha2+"'";
        try {
            cnn=CrearConexion();
            PreparedStatement pst;
            pst = cnn.prepareStatement(sql);
            ResultSet rs=pst.executeQuery();
            
            while(rs.next()){
                int pedido_id=rs.getInt(1);
                Date fecha=rs.getDate(2);
                int usuario_id=rs.getInt(3);
                double pedido_total=rs.getDouble(4);
                
                String pedido_fecha=String.format("%1$td-%1$tm-%1$tY", fecha);
 
                pedido=new Pedido(pedido_id,pedido_fecha, usuario_id, pedido_total);
                listaPedidos.add(pedido);
            }
            pst=null;
            
            if(cnn != null){
                cnn.close();
            }
            
        } catch (SQLException e) {
            System.out.println("Controlador JDBC no encontrado"+e.toString());
        }
    
        return listaPedidos;
    } 
}
