/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author watanga
 */
public class Usuario {
    int usuario_id;
    String usuario_nombre;
    String usuario_tipo;
    String usuario_email;
    String usuario_password;
    String usuario_direccion;
    String usuario_telefono;

    public Usuario(int usuario_id, String usuario_nombre, String usuario_tipo, String usuario_email, String usuario_password, String usuario_direccion, String usuario_telefono) {
        this.usuario_id = usuario_id;
        this.usuario_nombre = usuario_nombre;
        this.usuario_tipo = usuario_tipo;
        this.usuario_email = usuario_email;
        this.usuario_password = usuario_password;
        this.usuario_direccion = usuario_direccion;
        this.usuario_telefono = usuario_telefono;
    }

    public int getUsuario_id() {
        return usuario_id;
    }

    public void setUsuario_id(int usuario_id) {
        this.usuario_id = usuario_id;
    }

    public String getUsuario_nombre() {
        return usuario_nombre;
    }

    public void setUsuario_nombre(String usuario_nombre) {
        this.usuario_nombre = usuario_nombre;
    }

    public String getUsuario_tipo() {
        return usuario_tipo;
    }

    public void setUsuario_tipo(String usuario_tipo) {
        this.usuario_tipo = usuario_tipo;
    }

    public String getUsuario_email() {
        return usuario_email;
    }

    public void setUsuario_email(String usuario_email) {
        this.usuario_email = usuario_email;
    }

    public String getUsuario_password() {
        return usuario_password;
    }

    public void setUsuario_password(String usuario_password) {
        this.usuario_password = usuario_password;
    }

    public String getUsuario_direccion() {
        return usuario_direccion;
    }

    public void setUsuario_direccion(String usuario_direccion) {
        this.usuario_direccion = usuario_direccion;
    }

    public String getUsuario_telefono() {
        return usuario_telefono;
    }

    public void setUsuario_telefono(String usuario_telefono) {
        this.usuario_telefono = usuario_telefono;
    }
        
}
