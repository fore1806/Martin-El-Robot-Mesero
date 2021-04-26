public class Queue <T> {

  Node<T> head;
  Node<T> tail;

  Queue() {
    this.head=null;
    this.tail=null;
  }

  public void enQueue(Node newNode) {
    if (isEmpty()) {
      head=newNode;
      tail=newNode;
    } else {
      tail.setNext(newNode);
      tail = newNode;
    }
  }

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

  public Node<T> peek() {
    return head;
  }

  public boolean isEmpty() {
    return (head==null);
  }

  public void makeEmpty() {
    head=null;
    tail=null;
  }

  public void print() {
    Node pointer = head;
    while (pointer!=null&&pointer.getNext()!=null) {
      System.out.println(pointer.getData());
      pointer = pointer.getNext();
    }
  }
}
