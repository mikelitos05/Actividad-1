package com.example.actividad_2.lists;

import java.util.LinkedList;

import com.example.actividad_2.models.Contact;

public class LinkedListContacts {

   LinkedList<Contact> contacts;

   public LinkedListContacts() {
      this.contacts = new LinkedList<>();
   }

   /**
    * Esta funcion muestra todos los contactos disponibles ordenados por id
    */
   public void showContacts() {
      if (contacts.size() == 0) {
         System.out.println("==================================================");
         System.out.println("No hay contactos");
         return;
      }

      System.out.println("==================================================");
      for (Contact contact : contacts) {
         System.out.println("Id: " + contact.getId());
         System.out.println("Nombre de el contacto: " + contact.getName());
         System.out.println("Direccion de el contacto: " + contact.getdirection());
         System.out.println("Numero de el contacto: " + contact.getnumber());
         System.out.println("==================================================");

      }
   }

   /**
    * Ordenar contactos por nombre con metodo burbuja
    */
   public void sortContactsByName() {
      for (int i = 0; i < contacts.size() - 1; i++) {
         for (int j = 0; j < contacts.size() - 1 - i; j++) {
            Contact c1 = contacts.get(j);
            Contact c2 = contacts.get(j + 1);

            // devuelve 0 si son iguales 
            // devuelve 1 si c1 > ce
            if (c1.getName().compareToIgnoreCase(c2.getName()) > 0) {
               contacts.set(j, c2);
               contacts.set(j + 1, c1);
            }
         }
      }
   }

   /**
    * Ordenar contactos por id con el metodo burbuja
    */
   public void sortContactsById() {
      for (int i = 0; i < contacts.size() - 1; i++) {
         for (int j = 0; j < contacts.size() - 1 - i; j++) {
            Contact c1 = contacts.get(j);
            Contact c2 = contacts.get(j + 1);

            if (c1.getId() > c2.getId()) {
               contacts.set(j, c2);
               contacts.set(j + 1, c1);
            }
         }
      }
   }

   /**
    * Esta funcion es para poder añadir contactos
    * 
    * @param name      de el contacto
    * @param direction de el contacto
    * @param number    de el contacto
    */
   public void addContact(String name, String direction, String number) {
      int id = contacts.size();
      Contact contact = new Contact(id, name, direction, number);
      contacts.add(contact);
   }

   /**
    * Esta funcion nada mas es para agregar contactos default para pruebas
    */
   public void addDefaultContacts() {
      addContact("Malagón", "Calle 1 #001", "3312345678");
      addContact("Cota", "Calle 2 #002", "3312345679");
      addContact("Reyes", "Calle 3 #003", "3312345680");
      addContact("Cáceres", "Calle 4 #004", "3312345681");
      addContact("Zendejas", "Calle 5 #005", "3312345682");
      addContact("Maximin", "Calle 6 #006", "3312345683");
      addContact("Borja", "Calle 7 #007", "3312345684");
      addContact("Fidalgo", "Calle 8 #008", "3312345685");
      addContact("Dos Santos", "Calle 9 #009", "3312345686");
      addContact("Martín", "Calle 10 #010", "3312345687");
   }

   /**
    * Esta funcion eliminara un contacto con su id
    * 
    * @param id de el contacto que sera eliminado
    * @return True si se elmino y false en caso de que no exista la id o no se haya
    *         podido eliminar
    */
   public boolean removeContactById(int id) {
      return contacts.removeIf(c -> c.getId() == id);
   }

   public void removeLastContact() {
      contacts.removeLast();
   }

   public void removeFirstContact() {
      contacts.removeFirst();
   }

   /**
    * @return Cantidad de contactos
    */
   public int getSizeOfContacts() {
      return contacts.size();
   }

}
