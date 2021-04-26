public class Node<T> {

  T data;
  Node<T> next;
  Node<T> prev;

  Node() {
    this.next = null;
    this.prev = null;
    this.data = null;
  }

  Node(T data) {
    this.data = data;
    this.prev = null;
    this.next = null;
  }

  public T getData() {
    return data;
  }

  public void setData(T data) {
    this.data = data;
  }

  public void setNext(Node<T> next) {
    this.next = next;
  }

  public Node<T> getNext() {
    return next;
  }

  public void setPrev(Node<T> prev) {
    this.prev = prev;
  }

  public Node<T> getPrev() {
    return prev;
  }
}
