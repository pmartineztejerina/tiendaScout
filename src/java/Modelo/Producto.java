/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author watanga
 */
public class Producto {
    int producto_id;
    String producto_nombre;
    int categoria_id;
    String producto_detalle;
    double producto_precio;
    double producto_descuento;
    String producto_foto;
    int cantidad;
    double precio_venta;

    public Producto(int producto_id, String producto_nombre, int categoria_id, String producto_detalle, double producto_precio, double producto_descuento, String producto_foto) {
        this.producto_id = producto_id;
        this.producto_nombre = producto_nombre;
        this.categoria_id = categoria_id;
        this.producto_detalle = producto_detalle;
        this.producto_precio = producto_precio;
        this.producto_descuento = producto_descuento;
        this.producto_foto = producto_foto;
    }

    public Producto(int producto_id, String producto_nombre) {
        this.producto_id = producto_id;
        this.producto_nombre = producto_nombre;
    }

    public Producto(int producto_id, String producto_nombre, int categoria_id, String producto_detalle, double producto_precio, double producto_descuento, String producto_foto, int cantidad, double precio_venta) {
        this.producto_id = producto_id;
        this.producto_nombre = producto_nombre;
        this.categoria_id = categoria_id;
        this.producto_detalle = producto_detalle;
        this.producto_precio = producto_precio;
        this.producto_descuento = producto_descuento;
        this.producto_foto = producto_foto;
        this.cantidad = cantidad;
        this.precio_venta = precio_venta;
    }

    public int getProducto_id() {
        return producto_id;
    }

    public void setProducto_id(int producto_id) {
        this.producto_id = producto_id;
    }

    public String getProducto_nombre() {
        return producto_nombre;
    }

    public void setProducto_nombre(String producto_nombre) {
        this.producto_nombre = producto_nombre;
    }

    public int getCategoria_id() {
        return categoria_id;
    }

    public void setCategoria_id(int categoria_id) {
        this.categoria_id = categoria_id;
    }

    public String getProducto_detalle() {
        return producto_detalle;
    }

    public void setProducto_detalle(String producto_detalle) {
        this.producto_detalle = producto_detalle;
    }

    public double getProducto_precio() {
        return producto_precio;
    }

    public void setProducto_precio(double producto_precio) {
        this.producto_precio = producto_precio;
    }

    public double getProducto_descuento() {
        return producto_descuento;
    }

    public void setProducto_descuento(double producto_descuento) {
        this.producto_descuento = producto_descuento;
    }

    public String getProducto_foto() {
        return producto_foto;
    }

    public void setProducto_foto(String producto_foto) {
        this.producto_foto = producto_foto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecio_venta() {
        return precio_venta;
    }

    public void setPrecio_venta(double precio_venta) {
        this.precio_venta = precio_venta;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 43 * hash + this.producto_id;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Producto other = (Producto) obj;
        if (this.producto_id != other.producto_id) {
            return false;
        }
        return true;
    }

    

    
}