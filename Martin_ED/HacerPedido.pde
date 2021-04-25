// Función para realizar un pedido

void HacerPedido(LinkedList<Node<Producto>> productos, int idMesa){
  int tiempoDeEspera = 0; 
  for (int i = 0; i<=productos.length();i++){
     tiempoDeEspera += ((Producto) productos.getNth(i).getData()).getTiempoDePreparacion();  
   }
   
}

void tiempo2(){
  
}
