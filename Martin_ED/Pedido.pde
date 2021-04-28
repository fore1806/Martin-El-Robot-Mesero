/**
 *  Pedido
 * 
 *  Clase para instanciar los pedidos, junto con sus posibles estados
 */

class Pedido {
  int tiempoDePreparacion = 0;
  int tiempoDeSuministro = 10000;
  Mesa mesaDestino;
  int horaALaQueSePide;
  int horaALaQueLlega;
  LinkedList<Node<Producto>> productos;
  Robot robotAsignado;
  boolean enCamino;
  boolean yaSeAsigno;


  Pedido(LinkedList<Node<Producto>> p, Mesa mesaDes) {
    this.mesaDestino = mesaDes;
    this.productos = p;
  }
  Pedido() {
  }

  /**
   * Analiza la lista de pedidos y suma sus tiempos de preparacion
   * Recorre la lista productos, suma su tiempo de preparacion y guarda el momento en donde se realizó el pedido 
   *
   */
  void HacerPedido() { 
    for (int i = 0; i<this.productos.length(); i++) {
      this.tiempoDePreparacion += ((Producto) productos.getNth(i).getData()).getTiempoDePreparacion();
    }
    this.horaALaQueSePide = millis();
  }

  /**
   * Retorna si el pedido está listo
   * Compara el tiempo en que se tomó el pedido y su duracion. 
   * @return boorlean true si el pedido ya está listo
   */
  boolean estaListo() {
    if (millis()-this.horaALaQueSePide>=this.tiempoDePreparacion) {         
      return true;
    }
    return false;
  }

  /**
   * Retorna si el pedido está servido
   * Revisa el tiempo de llegada y el tiempo de suministro.
   * @return boorlean true si el pedido ya está sevido
   */
  boolean yaSirvio() {
    if (millis()-this.horaALaQueLlega>=this.tiempoDeSuministro) {         
      return true;
    }
    return false;
  }

  /**
   * Asigna una lista de productos al pedido
   * Asigna a la lista de productos la lista p
   *
   * @param p LinkedList<Node<Producto>>con los productos a asignar 
   */
  void setProductos(LinkedList<Node<Producto>> p) {
    this.productos = p;
  }

  /**
   * Asigna un robot al pedido
   * Asigna al pedido un Robot
   *
   * @param r Robot con el robot a asignar 
   */
  void setRobotAsignado(Robot r) {
    this.robotAsignado = r;
  }

  /**
   * Obtiene la posicion a la que debe ir
   * y configura los parametros del robot para atender el pedido
   *
   */
  void llevarComida() {
    if (robotAsignado != null) {
      int[] c = this.mesaDestino.getCoordenadas();       
      this.robotAsignado.setDirection(c[0], c[1]);
      this.enCamino=true;
      Node n = new Node(this.robotAsignado);
      robotsActivos.insertEnd(n);
      this.robotAsignado.activo = true;
    }
  }
}
