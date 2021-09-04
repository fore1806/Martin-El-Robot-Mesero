///**
// * LinkedList
// * Clase para implementar la lista enlazada 
// */

//class LinkedList <T> {
//  Node head;
//  Node tail;
//  int elements;

//  LinkedList(Node head) {
//    this.head = head;
//    this.tail = head;
//    this.elements = 1;
//  }

//  LinkedList() {
//    this.head = null;
//    this.tail = null;
//    this.elements = 0;
//  }

//  /**
//   * Inserta el nodo al principio de la lista  
//   * El nodo newN se inserta al principio de la lista
//   *
//   * @param newN Node el cual queremos agregar
//   */

//  void insertFront(Node newN) {
//    newN.next = head;
//    if (isEmpty()) {
//      tail = newN;
//    } else {
//      head.prev = newN;
//    }
//    head = newN;
//    elements+=1;
//  }

//  /**
//   * Inserte el nodo newN al final
//   * Inserta el nodo newN al final de la lista 
//   *
//   * @param newN Node el cual queremos insertar
//   */

//  void insertEnd(Node newN) {
//    newN.prev = tail;
//    if (isEmpty()) {
//      head = newN;
//    } else {
//      tail.next = newN;
//    }
//    tail = newN;
//    elements+=1;
//  }

//  /**
//   * Inserta el nodo newN en data 
//   * Inserta en el lugar de nodo data el nodo newN
//   */

//  void insert(T data, Node newN) {
//    Node move = search(data);
//    newN.next = move;
//    newN.prev = move.prev;
//    move.prev = newN;
//    elements+=1;
//  }


//  /**
//   * Elimina el primer elemento
//   * Elimina el primer elemento de la lista, si está vacia
//   * informa por consola
//   *
//   */

//  void deleteFront() {
//    if (isEmpty()) {
//      System.out.println("Lista Vacia");
//    } else {
//      head.next.prev = null;
//      if (elements==1) {
//        head = null;
//        tail = null;
//      } else {
//        head = head.next;
//      }
//      elements-=1;
//    }
//  }

//  /**
//   * Elimina el nodo del final  
//   * Elimina el nodo final comprobando que la lista no esté vacia
//   * Si está vacia arroja una alerta por consola
//   */

//  void deleteEnd() {
//    if (isEmpty()) {
//      System.out.println("Lista Vacia");
//    } else {
//      tail.prev.next = null;
//      if (elements==1) {
//        head = null;
//        tail = null;
//      } else {
//        tail = tail.prev;
//      }
//      elements-=1;
//    }
//  }

//  /**
//   * Elimina el nodo data
//   *
//   * @param data Node el cual queremos eliminar
//   */

//  void delete(T data) {
//    Node move = search(data);
//    Node aux = move.next;
//    move.prev = move.next;
//    aux.prev = move.prev;
//    elements-=1;
//  }

//  //void deleteNode(Node<T> nodeDelete) {
//  //  if (isEmpty()) {
//  //    println("Esta vacia la lista");
//  //  } else if (nodeDelete == head) {
//  //    nodeDelete.next.prev = new Node();
//  //    head = nodeDelete.next;
//  //    //head.prev = null;
//  //  } else if (nodeDelete == tail) {
//  //    tail = nodeDelete.prev;
//  //    tail.next = null;
//  //  } else {
//  //    nodeDelete.prev.next = nodeDelete.next;
//  //    nodeDelete.next.prev = nodeDelete.prev;
//  //  }
//  //  nodeDelete.next = null;
//  //  nodeDelete.prev = null;
//  //  elements-=1;
//  //}

//  /**
//   * Retorna el nodo que coincida con data  
//   * Recorre la lista y entrega el nodo que coincida con data
//   *
//   * @return found Node que coincide
//   * @param data Node el cual queremos que coincida
//   */

//  Node search(T data) {
//    Node found = null;
//    Node act = head;
//    if (elements != 0) {
//      while (act!= null && act.next !=null) {
//        if (act.data == data) {
//          found = act;
//          break;
//        }
//      }
//    }
//    return found;
//  }

//  /**
//   * Retorna el nodo enésimo  
//   * Recorre la lista y entrega el nodo enésimo 
//   *
//   * @return getNth Node enésimo en la lista
//   * @param index el numero de nodo que queremos
//   */

//  Node getNth(int index)
//  {
//    Node current = head;
//    int count = 0; 
//    while (current != null)
//    {
//      if (count == index)
//        return current;
//      count++;
//      current = current.next;
//    }
//    return null;
//  }


//  /**
//   * Comprueba si la lista está vacia
//   *
//   * @return Booleano, true si la lista está vacia
//   * @param menu_creado Booleano que indica si ya se creo el menú anteriormente
//   */
//  boolean isEmpty() {
//    return elements==0;
//  }

//  /**
//   * Retorna el numero de elementos
//   * @return elements Entero con la cantidad de elementos 
//   */

//  int length() {
//    return elements;
//  }

//  /**
//   * Establece en null los parametros head,tail
//   * y en 0 el parametro elements
//   */

//  void deleteList() {
//    head.next=null;
//    tail.prev=null;
//    tail = null;
//    head = null;
//    elements = 0;
//  }
//}


public class LinkedList <T> {
  Node<T> head;
  Node<T> tail;
  int elements;

  LinkedList() {
    this.head = null;
    this.tail = null;
    this.elements = 0;
  }

  LinkedList(Node head, Node tail) {
    this.head = head;
    this.tail = tail;
    this.elements = 1;
  }

  public void pushFront(T data) {
    Node <T> nodeInsert = new Node(data);
    if (this.isEmpty()) {
      this.setTail(nodeInsert);
    } else {
      nodeInsert.setNext(this.head);
      this.head.setPrev(nodeInsert);
    }
    this.setHead(nodeInsert);
    this.elements ++;
  }

  public void pushBack(T data) {
    Node <T> nodeInsert = new Node(data);
    if (this.isEmpty()) {
      this.setHead(nodeInsert);
    } else {
      nodeInsert.setPrev(this.tail);
      this.tail.setNext(nodeInsert);
    }
    this.setTail(nodeInsert);
    this.elements ++;
  }
  
  void pushBack(Node newN) {
    newN.prev = tail;
    if (isEmpty()) {
      head = newN;
    } else {
      tail.next = newN;
    }
    tail = newN;
    elements+=1;
  }

  public T popFront() {
    T toReturn;
    if (this.isEmpty()) {
      System.out.println("Lista Vacia, no se puede eliminar el elemento");
      toReturn = null;
    } else {
      if (this.head.getNext()!=null) {
        this.head.getNext().setPrev(null);
      }
      toReturn = getHeadData();
      this.setHead(this.head.getNext());
      this.elements --;
    }
    return toReturn;
  }

  public T popBack() {
    T toReturn;
    if (this.isEmpty()) {
      System.out.println("Lista Vacia, no se puede eliminar el elemento");
      toReturn = null;
    } else {
      if (this.tail.getPrev()!=null) {
        this.tail.getPrev().setNext(null);
      }
      toReturn = getTailData();
      this.setTail(this.tail.getPrev());
      this.elements --;
    }
    return toReturn;
  }

  public T peekFront() {
    T data;
    if (this.isEmpty()) {
      data = null;
    } else {
      data = getHeadData();
    }
    return data;
  }

  public T peekBack() {
    T data;
    if (this.isEmpty()) {
      data = null;
    } else {
      data = getTailData();
    }
    return data;
  }

  public void print() {
    Node<T> pointer = getHead();
    while (pointer!=null) {
      System.out.println((pointer.getData()));
    }
  }

  public void delete(Node<T> nToDelete) {
    if (nToDelete==this.head) {
      popFront();
    } else if (nToDelete==this.tail) {
      popBack();
    } else {
      nToDelete.getPrev().setNext(nToDelete.getNext());
      nToDelete.getNext().setPrev(nToDelete.getPrev());
      nToDelete = null;
    }
  }

  /**
   * Retorna el nodo enésimo  
   * Recorre la lista y entrega el nodo enésimo 
   *
   * @return getNth Node enésimo en la lista
   * @param index el numero de nodo que queremos
   */

  Node getNth(int index) {
    Node current = head;
    int count = 0; 
    while (current != null)
    {
      if (count == index)
        return current;
      count++;
      current = current.next;
    }
    return null;
  }

  public Boolean isEmpty() {
    return this.elements==0;
  }

  public void setHead(Node<T> head) {
    this.head = head;
  }

  public void setTail(Node<T> tail) {
    this.tail = tail;
  }

  public Node<T> getHead() {
    return this.head;
  }

  public Node<T> getTail() {
    return this.tail;
  }

  public T getHeadData() {
    return this.head.getData();
  }

  public T getTailData() {
    return this.tail.getData();
  }

  public int length() {
    return this.elements;
  }
}
