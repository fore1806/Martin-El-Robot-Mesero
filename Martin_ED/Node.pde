/**
 *  Node
 * 
 *  Clase de tipo genérica utilizada en la implementación
 *  de estructuras de datos lineales con referencias.
 *  Consta de 3 atributos y 6 métodos
 */
public class Node<T> {

  T data;
  Node<T> next;
  Node<T> prev;
  Node<T> left;
    Node<T> right;

  Node() {
    this.next = null;
    this.prev = null;
    this.data = null;
  }

  Node(T data){
        this.data = data;
        this.prev = null;
        this.next = null;
        this.left = null;
        this.right = null;
    }
  

  /**
   * Función encargada de entregar la información contenida en el nodo.
   *
   * @return Objeto de tipo genérico, almacenado en el Nodo.
   */

  public T getData() {
    return data;
  }

  /**
   * Método encargado de definir la información del nodo.
   *
   * @param data Objeto genérico que será almacenado en el nodo.
   */

  public void setData(T data) {
    this.data = data;
  }

  /**
   * Método encargado de agregar el sucesor del nodo.
   *
   * @param next Objeto tipo Node que será la referencia al siguiente nodo.
   */

  public void setNext(Node<T> next) {
    this.next = next;
  }

  /**
   * Función encargada de obtener el sucesor del nodo.
   *
   * @return Objeto Node, que es el siguiente del nodo.
   */

  public Node<T> getNext() {
    return next;
  }

  /**
   * Método encargado de agregar el antecesor del nodo.
   *
   * @param next Objeto tipo Node que será la referencia al nodo anterior.
   */

  public void setPrev(Node<T> prev) {
    this.prev = prev;
  }

  /**
   * Función encargada de obtener el antecesor del nodo.
   *
   * @return Objeto Node, que es el nodo previo al mismo.
   */

  public Node<T> getPrev() {
    return prev;
  }
  public void setLeft(Node<T> left) {
        this.left = left;
    }

    public Node<T> getLeft() {
        return left;
    }

    public void setRight(Node<T> right) {
        this.right = right;
    }

    public Node<T> getRight() {
        return right;
    }

    public T getNextData(){
        return next.getData();
    }

    public T getPrevData(){
        return prev.getData();
    }

    public T getLeftData(){
        return left.getData();
    }

    public T getRightData(){
        return right.getData();
    }
}
