package com.example.actividad1.lists;

import java.util.LinkedList;

import com.example.actividad1.models.Contact;

public class LinkedListContacts {

   LinkedList<Contact> contacts;

   public LinkedListContacts() {
      this.contacts = new LinkedList<>();
   }

   public void addContact(String name, String direccion, int numero){
      Contact contact = new Contact(name,direccion,numero);

   }

}
