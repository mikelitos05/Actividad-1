package com.example.actividad1.models;

public class Contact {
    private String name;
    private String direccion;
    private int numero;

    public Contact(String name, String direccion, int numero) {
        this.name = name;
        this.direccion = direccion;
        this.numero = numero;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getDireccion() {
        return direccion;
    }
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    public int getNumero() {
        return numero;
    }
    public void setNumero(int numero) {
        this.numero = numero;
    }

}
