package com.example.actividad_2.ui;

import java.util.InputMismatchException;
import java.util.Scanner;

import com.example.actividad_2.lists.LinkedListContacts;

public class UiContacts {

    /**
     * Funcion que se encarga de mostrar el menu
     */
    public static void showMenu() {
        System.out.println("--------------------------------------------------");
        System.out.println("1. Mostrar linked list");
        System.out.println("2. Agregar contacto");
        System.out.println("3. Eliminar contacto por id");
        System.out.println("4. Eliminar primer contacto");
        System.out.println("5. Eliminar ultimo contacto");
        System.out.println("6. Ordenar contactos por nombre");
        System.out.println("7. Ordenar contactos por id");
        System.out.println("8. Salir");
        System.out.println("--------------------------------------------------");
    }

    /**
     * Funcion que se encarga de mostrar la consola
     */
    public static void cleanConsole() {
        System.out.print("\033[H\033[2J");
        System.out.flush();
    }

    /**
     * Funcion que se encarga de validar el numero que introducira el contacto
     * 
     * @param scanner      Scanner para poder introducir cosas con teclado
     * @param message      mensaje que se le mostrara al usuario antes de pedir el
     *                     numero
     * @param messageError mensaje en caso de que sea un numero no valido
     * @return el numero de el usuario
     */
    public static String numberValidator(Scanner scanner, String message, String messageError) {
        String numero = "0";
        boolean valid = false;

        System.out.println(message);
        while (!valid) {
            numero = scanner.nextLine();
            if (numero.matches("\\d+")) {
                valid = true;
                return numero;
            } else {
                System.out.println(messageError);
            }
        }
        return numero;

    }

    private static int idValidator(Scanner scanner, String message, String messageError) {
        int numero = 0;
        boolean valido = false;
        while (!valido) {
            System.out.print(message);
            try {
                numero = scanner.nextInt();
                scanner.nextLine();
                valido = true;
            } catch (InputMismatchException e) {
                System.out.println(messageError);
                scanner.nextLine();
            }
        }
        return numero;
    }

    /**
     * Funcion que se encarga de correr contactos
     */
    public static void runContacts() {
        Scanner scanner = new Scanner(System.in);
        LinkedListContacts linkedListContacts = new LinkedListContacts();

        showMenu();
        int opciones = scanner.nextInt();
        scanner.nextLine();

        while (opciones != 8) {
            cleanConsole();
            switch (opciones) {

                case 1:
                    linkedListContacts.showContacts();
                    break;

                case 2:
                    String messageForNumberError = "Por favor introduzca un numero correcto";
                    String messageForNumber = "Introduzca el numero de el contacto";

                    System.out.println("Introduzca el nombre de el contacto: ");
                    String name = scanner.nextLine();
                    System.out.println("Introduzca la direccion de el contacto: ");
                    String direction = scanner.nextLine();

                    String number = numberValidator(scanner, messageForNumber, messageForNumberError);

                    linkedListContacts.addContact(name, direction, number);
                    break;

                case 3:
                    linkedListContacts.showContacts();
                    if (linkedListContacts.getSizeOfContacts() != 0) {

                        String messageForId = "Introduzca la id de el contacto que desea eliminar: ";
                        String messageForIdError = "Introduzca una id valida: ";

                        int id = idValidator(scanner, messageForId, messageForIdError);

                        boolean contactIdExist = linkedListContacts.removeContactById(id);

                        if (!contactIdExist) {
                            System.out.println("No existe un contacto con id " + id);
                        }
                    }
                    break;

                case 4:
                    if (linkedListContacts.getSizeOfContacts() != 0) {
                        linkedListContacts.removeFirstContact();
                    }
                    linkedListContacts.showContacts();
                    break;
                case 5:
                    if (linkedListContacts.getSizeOfContacts() != 0) {
                        linkedListContacts.removeLastContact();

                    }
                    linkedListContacts.showContacts();
                    break;
                case 6:
                    linkedListContacts.sortContactsByName();
                    linkedListContacts.showContacts();
                    break;
                case 7:
                    linkedListContacts.sortContactsById();
                    linkedListContacts.showContacts();
                    break;
                case 97:
                    linkedListContacts.addDefaultContacts();
                    break;

            }

            showMenu();
            opciones = scanner.nextInt();
            scanner.nextLine();
        }

    }

}
