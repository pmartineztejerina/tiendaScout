/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.sql.Date;

/**
 *
 * @author watanga
 */
public class Pedido implements Comparable<Pedido> {
    int pedido_id;
    String pedido_fecha;
    int detalle_id;
    int producto_id;
    int detalle_cantidad;
    int usuario_id;
    double pedido_total;

    public Pedido(int pedido_id, String pedido_fecha, int usuario_id, double pedido_total) {
        this.pedido_id = pedido_id;
        this.pedido_fecha = pedido_fecha;
        this.usuario_id = usuario_id;
        this.pedido_total = pedido_total;
    }

    public Pedido(int usuario_id, double pedido_total) {
        this.usuario_id = usuario_id;
        this.pedido_total = pedido_total;
    }
    public Pedido(int detalle_id, int pedido_id, int producto_id, int detalle_cantidad) {
        this.detalle_id = detalle_id;
        this.pedido_id = pedido_id;
        this.producto_id = producto_id;
        this.detalle_cantidad = detalle_cantidad;
    }

    public Pedido(int pedido_id, int producto_id, int detalle_cantidad) {
        this.pedido_id = pedido_id;
        this.producto_id = producto_id;
        this.detalle_cantidad = detalle_cantidad;
    }

    public Pedido(int pedido_id, String pedido_fecha, int detalle_cantidad, int usuario_id) {
        this.pedido_id = pedido_id;
        this.pedido_fecha = pedido_fecha;
        this.detalle_cantidad = detalle_cantidad;
        this.usuario_id = usuario_id;
    }

    public int getPedido_id() {
        return pedido_id;
    }
 
    public void setPedido_id(int pedido_id) {
        this.pedido_id = pedido_id;
    }

    public String getPedido_fecha() {
        return pedido_fecha;
    }

    public void setPedido_fecha(String pedido_fecha) {
        this.pedido_fecha = pedido_fecha;
    }

    public int getDetalle_id() {
        return detalle_id;
    }

    public void setDetalle_id(int detalle_id) {
        this.detalle_id = detalle_id;
    }

    public int getProducto_id() {
        return producto_id;
    }

    public void setProducto_id(int producto_id) {
        this.producto_id = producto_id;
    }

    public int getDetalle_cantidad() {
        return detalle_cantidad;
    }

    public void setDetalle_cantidad(int detalle_cantidad) {
        this.detalle_cantidad = detalle_cantidad;
    }

    public int getUsuario_id() {
        return usuario_id;
    }

    public void setUsuario_id(int usuario_id) {
        this.usuario_id = usuario_id;
    }

    public double getPedido_total() {
        return pedido_total;
    }

    public void setPedido_total(double pedido_total) {
        this.pedido_total = pedido_total;
    }

    @Override
    public int compareTo(Pedido o) {
        return this.pedido_fecha.compareTo(o.getPedido_fecha());
    }
   
    
}
