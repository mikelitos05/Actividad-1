package com.example.actividad1.ui;

import java.util.Scanner;

public class Ui {

    /**
     * Funcion que se encarga de mostrar el menu principal
     */
    public static void showMenu() {
        System.out.println("--------------------------------------------------");
        System.out.println("1. Gestor de contactos");
        System.out.println("2. Pila");
        System.out.println("3. Cola");
        System.out.println("4. Salir");
        System.out.println("--------------------------------------------------");
    }

    public static void runApp() {
        Scanner scanner = new Scanner(System.in);
        showMenu();
        int opciones = scanner.nextInt();
        scanner.nextLine();

        while (opciones != 4) {
            switch (opciones) {
                case 1:
                    UiContacts.runContacts();
                    break;
                case 2:
                    UiStack.runStack();
                    break;
                case 3:
                    UiQueue.runQueue();
                default:
                    break;
            }
        }

    }

}
