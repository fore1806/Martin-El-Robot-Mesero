class Pedido{
   int tiempoDePreparacion = 0;
   Mesa mesaDestino;
   int horaALaQueSePide;
   LinkedList<Node<Producto>> productos;
   Robot robotAsignado;
   
   Pedido(LinkedList<Node<Producto>> p,Mesa mesaDes){
     this.mesaDestino = mesaDes;
     this.productos = p;
   }
   Pedido(){
   }
   
   void HacerPedido(){ 
      for (int i = 0; i<this.productos.length();i++){
       this.tiempoDePreparacion += ((Producto) productos.getNth(i).getData()).getTiempoDePreparacion();  
     }
     this.horaALaQueSePide = millis();
   }
   
      
   boolean estaListo(){
     if (millis()-this.horaALaQueSePide>=this.tiempoDePreparacion){         
       return true;
     }
     return false;
   }
  
   void setProductos(LinkedList<Node<Producto>> p){
     this.productos = p;
   }
   
   void setRobotAsignado(Robot r){
     this.robotAsignado = r;
   }
   
   void llevarComida(Robot robotelegido){
     this.robotAsignado=robotelegido;
     int[] c = this.mesaDestino.getCoordenadas();       
     this.robotAsignado.setDirection(c[0],c[1]);
   }
   
}
