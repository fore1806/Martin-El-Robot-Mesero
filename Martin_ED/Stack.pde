/**
 *  Stack
 * 
 *  Clase de tipo genérica para implementar la estructura Stack
 */
 
public class Stack<T> {
  Node<T> head;

  Stack() {
    this.head=null;
  }

  public void push(Node<T> newNode) {
    newNode.setNext(head);
    head = newNode;
  }
 /**
  * Retorna el primer nodo y lo elimina del stack  
  *
  * @return salida Node con el head del Stack 
  *
  */

  public Node<T> pop() {
    Node salida = head;
    if (!isEmpty()) {
      head = head.getNext();
    } else {
      salida = new Node();
    }
    return salida;
  }

 /**
  * Retorna el head 
  *
  * @return head Nodo head del Stack
  */

  public Node<T> peek() {
    return head;
  }

 /**
  * Retorna true si está vacia
  *
  * @return Boolean true si está vacia
  */

  public boolean isEmpty() {
    return (head==null);
  }

 /**
  * Configura head en null e
  * Elimina el Stack anulando head
  *
  */

  public void makeEmpty() {
    head=null;
  }


 /**
  * Imprime el Stack 
  * Recorre la lista e imprime cada uno de los elementos por consola
  *
  */

  public void print() {
    Node pointer = head;
    while (pointer!=null&&pointer.getNext()!=null) {
      System.out.println(pointer.getData());
      pointer = pointer.getNext();
    }
  }
}
