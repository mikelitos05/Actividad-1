package com.example.actividad1.models;

public class Contact {
    private int id;
    private String name;
    private String direction;
    private String number;

    public Contact(int id, String name, String direction, String number) {
        this.id = id;
        this.name = name;
        this.direction = direction;
        this.number = number;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getdirection() {
        return direction;
    }

    public void setdirection(String direction) {
        this.direction = direction;
    }

    public String getnumber() {
        return number;
    }

    public void setnumber(String number) {
        this.number = number;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

}
