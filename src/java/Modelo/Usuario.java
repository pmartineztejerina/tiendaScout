/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.util.Objects;

/**
 *
 * @author watanga
 */
public class Usuario {
    int usuario_id;
    String usuario_nombre;
    String usuario_apellidos;
    String usuario_tipo;
    String usuario_email;
    String usuario_password;
    String usuario_direccion;
    String usuario_telefono;

    public Usuario(int usuario_id, String usuario_nombre, String usuario_apellidos, String usuario_tipo, String usuario_email, String usuario_password, String usuario_direccion, String usuario_telefono) {
        this.usuario_id = usuario_id;
        this.usuario_nombre = usuario_nombre;
        this.usuario_apellidos = usuario_apellidos;
        this.usuario_tipo = usuario_tipo;
        this.usuario_email = usuario_email;
        this.usuario_password = usuario_password;
        this.usuario_direccion = usuario_direccion;
        this.usuario_telefono = usuario_telefono;
    }

    public Usuario(int usuario_id, String usuario_nombre, String usuario_apellidos, String usuario_email) {
        this.usuario_id = usuario_id;
        this.usuario_nombre = usuario_nombre;
        this.usuario_apellidos = usuario_apellidos;
        this.usuario_email = usuario_email;
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

    public String getUsuario_apellidos() {
        return usuario_apellidos;
    }

    public void setUsuario_apellidos(String usuario_apellidos) {
        this.usuario_apellidos = usuario_apellidos;
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

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 83 * hash + Objects.hashCode(this.usuario_email);
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
        final Usuario other = (Usuario) obj;
        if (this.usuario_id != other.usuario_id) {
            return false;
        }
        if (!Objects.equals(this.usuario_email, other.usuario_email)) {
            return false;
        }
        return true;
    }

    
}    