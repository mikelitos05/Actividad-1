package com.example.actividad1.ui;

import java.util.Scanner;

import com.example.actividad1.lists.QueueManager;

public class UiQueue {

    public static void showMenu() {
        System.out.println("--------------------------------------------------");
        System.out.println("1. Mostrar cola");
        System.out.println("2. Agregar elemento a la cola");
        System.out.println("3. Eliminar elemento de la cola");
        System.out.println("4. primer elemento de la cola");
        System.out.println("5. Salir");
        System.out.println("--------------------------------------------------");
    }

    public static void runQueue() {
        Scanner scanner = new Scanner(System.in);
        QueueManager queueManager = new QueueManager();
        
        showMenu();
        int opciones = scanner.nextInt();
        scanner.nextLine();

        while (opciones != 5) {
            switch (opciones) {
                case 1:
                    queueManager.showQueue();
                    break;
                case 2:
                    System.out.println("Introduce el elemento a agregar a la cola:");
                    int item = scanner.nextInt();
                    queueManager.addItem(item);
                    break;
                case 3:
                    queueManager.removeItem();
                    break;
                case 4:
                    System.out.println("Primer elemento de la cola: " + queueManager.getElement());
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
