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
public class Pedido {
    int pedido_id;
    String pedido_fecha;
    int usuario_id;
    double pedido_total;

    public Pedido(int pedido_id, String pedido_fecha, int usuario_id, double pedido_total) {
        this.pedido_id = pedido_id;
        this.pedido_fecha = pedido_fecha;
        this.usuario_id = usuario_id;
        this.pedido_total = pedido_total;
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
    
    
    
}
