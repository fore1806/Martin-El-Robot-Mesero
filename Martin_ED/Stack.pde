public class Stack<T> {
  Node<T> head;

  Stack() {
    this.head=null;
  }

  public void push(Node<T> newNode) {
    newNode.setNext(head);
    head = newNode;
  }

  public Node<T> pop() {
    Node salida = head;
    if (!isEmpty()) {
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
  }

  public void print() {
    Node pointer = head;
    while (pointer!=null&&pointer.getNext()!=null) {
      System.out.println(pointer.getData());
      pointer = pointer.getNext();
    }
  }
}
