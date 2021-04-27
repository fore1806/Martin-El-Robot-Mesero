/**
 *  Queue
 * 
 *  Clase de tipo genérica implementada a partir de referencias 
 *  Consta de 2 atributos y 6 métodos
 */
 
public class Queue <T> {

  Node<T> head;
  Node<T> tail;

  Queue() {
    this.head=null;
    this.tail=null;
  }

  /**
   * Método encargado de agregar un elemento a la cola.
   * Recibe como parámetro el nodo a insertar.
   *
   * @param newNode Objeto de la clase Node que será encolado
   */

  public void enQueue(Node newNode) {
    if (isEmpty()) {
      head=newNode;
      tail=newNode;
    } else {
      tail.setNext(newNode);
      tail = newNode;
    }
  }

  /**
   * Función encargada de sacar el primer elemento a la cola.
   * Retorna el nodo desencolado.
   *
   * @return Objeto de la clase Node, que coincide con el primer elemento de la cola.
   */

  public Node<T> deQueue() {
    Node salida;
    if (!isEmpty()) {
      salida = head;
      head = head.getNext();
    } else {
      salida = new Node();
    }
    return salida;
  }

  /**
   * Función encargada de mostrar el primer elemento a la cola.
   * Retorna el primer nodo de la cola.
   *
   * @return Objeto de la clase Node, que coincide con el primer elemento sin eliminarlo de la cola.
   */

  public Node<T> peek() {
    return head;
  }

  /**
   * Función que retorna un booleano que permite conocer si la cola esta vacia.
   *
   * @return un booleano que indica si la cola está vacia.
   */

  public boolean isEmpty() {
    return (head==null);
  }

  /**
   * Método encargado de vaciar la cola.
   */

  public void makeEmpty() {
    head=null;
    tail=null;
  }

  /**
   * Método encargado de imprimir la información de los elementos de la cola.
   */

  public void printQueue() {
    Node pointer = head;
    while (pointer!=null && pointer.getNext()!=null) {
      System.out.println(pointer.getData());
      pointer = pointer.getNext();
    }
  }
}
