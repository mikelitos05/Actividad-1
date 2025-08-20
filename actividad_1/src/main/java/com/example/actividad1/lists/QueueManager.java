package com.example.actividad1.lists;

import java.util.LinkedList;
import java.util.Queue;

public class QueueManager {

    Queue<Integer> cola;

    public Queue<Integer> getCola() {
        return cola;
    }

    public void setCola(Queue<Integer> cola) {
        this.cola = cola;
    }

    public QueueManager() {
        this.cola = new LinkedList<>();
    }

    /**
     * Funcion que se encarga de agregar un elemento a la cola
     * 
     * @param numero que se quiere añadir
     */
    public void addItem(int numero) {
        cola.add(numero);
        showQueue();
    }

    public void removeItem() {
        if (cola.poll() == null) {
            System.out.println("❌ La cola esta vacia, no se puede eliminar ningun elemento.");
        } else {
            System.out.println("✅ Elemento eliminado de la cola.");
        }
        showQueue();
    }

    public int getElement(){
        if (cola.peek() == null) {
            System.out.println("\u274C" + "La cola esta vacia, no hay ningun elemento.");
            return -1; // Indica que la cola esta vacia
        } else {
            return cola.peek();
        }
    }

    public void showQueue() {
        if (cola.isEmpty()) {
            System.out.println("❌ La cola esta vacia.");
        } else {
            System.out.println("Elementos en la cola: " + cola);
        }
    }
}
