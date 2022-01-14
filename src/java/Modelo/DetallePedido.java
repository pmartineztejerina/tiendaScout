/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author watanga
 */
public class DetallePedido {
    int detalle_id;
    int pedido_id;
    int producto_id;
    int detalle_cantidad;

    public DetallePedido(int detalle_id, int pedido_id, int producto_id, int detalle_cantidad) {
        this.detalle_id = detalle_id;
        this.pedido_id = pedido_id;
        this.producto_id = producto_id;
        this.detalle_cantidad = detalle_cantidad;
    }

    public int getDetalle_id() {
        return detalle_id;
    }

    public void setDetalle_id(int detalle_id) {
        this.detalle_id = detalle_id;
    }

    public int getPedido_id() {
        return pedido_id;
    }

    public void setPedido_id(int pedido_id) {
        this.pedido_id = pedido_id;
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
    
    
    
}
