class LinkedList <T> {
  Node head;
  Node tail;
  int elements;

  LinkedList(Node head) {
    this.head = head;
    this.tail = head;
    this.elements = 1;
  }

  LinkedList() {
    this.head = null;
    this.tail = null;
    this.elements = 0;
  }

  void insertFront(Node newN) {
    newN.next = head;
    if (isEmpty()) {
      tail = newN;
    } else {
      head.prev = newN;
    }
    head = newN;
    elements+=1;
  }

  void insertEnd(Node newN) {
    newN.prev = tail;
    if (isEmpty()) {
      head = newN;
    } else {
      tail.next = newN;
    }
    tail = newN;
    elements+=1;
  }

  void insert(T data, Node newN) {
    Node move = search(data);
    newN.next = move;
    newN.prev = move.prev;
    move.prev = newN;
    elements+=1;
  }

  void deleteFront() {
    if (isEmpty()) {
      System.out.println("Lista Vacia");
    } else {
      head.next.prev = null;
      if (elements==1) {
        head = null;
        tail = null;
      } else {
        head = head.next;
      }
      elements-=1;
    }
  }

  void deleteEnd() {
    if (isEmpty()) {
      System.out.println("Lista Vacia");
    } else {
      tail.prev.next = null;
      if (elements==1) {
        head = null;
        tail = null;
      } else {
        tail = tail.prev;
      }
      elements-=1;
    }
  }

  void delete(T data) {
    Node move = search(data);
    Node aux = move.next;
    move.prev = move.next;
    aux.prev = move.prev;
    elements+=1;
  }

  Node search(T data) {
    Node found = null;
    Node act = head;
    if (elements == 0) {
      found = null;
    } else {
      while (act!= null && act.next !=null) {
        if (act.data == data) {
          found = act;
          break;
        }
      }
    }
    return found;
  }
  
  Node getNth(int index)
    {
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

  boolean isEmpty() {
    return elements==0;
  }

  int length() {
    return elements;
  }

  void deleteList() {
    head.next=null;
    tail.prev=null;
    tail = null;
    head = null;
    elements = 0;
  }
}
