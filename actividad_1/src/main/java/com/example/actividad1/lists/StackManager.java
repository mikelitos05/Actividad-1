package com.example.actividad1.lists;

import java.util.Stack;

public class StackManager {

    Stack<Integer> pila;

    public StackManager() {
        this.pila = new Stack<>();
    }

    public Stack<Integer> getPila() {
        return pila;
    }

    public void setPila(Stack<Integer> pila) {
        this.pila = pila;
    }


    /**
     * Funcion que se encarga de agregar un numero a la pila
     * 
     * @param numero que se quiere añadir
     */
    public void addItem(int numero) {
        try {
            pila.push(numero);
        }catch (Exception e) {
            System.out.println("❌ Error al agregar el elemento a la pila: " + e.getMessage());
        }
        showStack();
    }

    /**
     * Funcion que se encarga de eliminar el elemento de hasta arriba de la pila
     */
    public void popItem() {
        pila.pop();
        showStack();

    }

    /**
     * Funcion que se encarga devolver el ultimo elemento de la pila
     * 
     * @return
     */
    public int getLastElement() {
        return pila.peek();
    }



    /**
     * Fucnion que se encarga de mostrar tres elementos de la pila en forma de LIFO
     */
    /**     public void showThreeOfTheElements() {
        // 10
        pila.size();
        int contador = 0;
        for (int item : pila) {
            if(contador++ >= 3) {
            }
        }
    }
*/


    public void addItemsDefault() {
        addItem(10);
        addItem(2);
        addItem(90);
        addItem(16);
        addItem(81);
    }

    /**
     * Funcion que se encarga de mostrar los elementos de la pila
     */
    public void showStack() {
        if (pila.isEmpty()) {
            System.out.println("❌ La pila esta vacia");
        } else {
            System.out.println("✅ Elementos de la pila:");
            for (int item : pila) {
                System.out.println(item);
            }
        }
    }


}
