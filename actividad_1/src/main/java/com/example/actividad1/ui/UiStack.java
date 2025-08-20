package com.example.actividad1.ui;

import java.util.Scanner;

import com.example.actividad1.lists.StackManager;

public class UiStack {

    /**
     * Funcion que se encarga de mostrar el menu de la pila
     */
    public static void showMenu() {
        System.out.println("--------------------------------------------------");
        System.out.println("1. Mostrar pila");
        System.out.println("2. Agregar elemento a la pila");
        System.out.println("3. Eliminar elemento de la pila");
        System.out.println("4. Mostrar ultimo elemento de la pila");
        System.out.println("5. Salir");
        System.out.println("--------------------------------------------------");
    }

    public static void runStack() {

        Scanner scanner = new Scanner(System.in);
        StackManager stackManager = new StackManager();
        showMenu();
        int opciones = scanner.nextInt();
        scanner.nextLine();

        while (opciones != 5) {
            switch (opciones) {
                case 1:
                    stackManager.showStack();
                    break;
                case 2:
                    System.out.println("Introduce el elemento a agregar a la pila:");
                    int item = scanner.nextInt();
                    stackManager.addItem(item);
                    break;
                case 3:
                    stackManager.popItem();
                    break;
                case 4:
                    System.out.println("Ultimo elemento de la pila: " + stackManager.getLastElement());
                    break;
                case 97:
                    stackManager.addItemsDefault();
                    break;
                default:
                    System.out.println("Opcion no valida, por favor intenta de nuevo.");
            }
            showMenu();
            opciones = scanner.nextInt();
            scanner.nextLine();
        }

    }

}
