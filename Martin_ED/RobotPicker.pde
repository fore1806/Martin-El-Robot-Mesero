Robot EscogerRobot(Queue<Node<Robot>> listaRobots, LinkedList<Node<Robot>> RobotsActivos, Mesa mesa ){
  int[] cm = mesa.getCoordenadas();
  float dri = sqrt((cm[0]^2)+(cm[1]^2));
  int ganador= -1;
  if(RobotsActivos.isEmpty()){
    
    return ((Robot)((Node)listaRobots.deQueue()).getData());
    
  }
  else{
    for(int i=0;i<RobotsActivos.length();i++){
      if( !((Robot) RobotsActivos.getNth(i).getData()).isMoving() ){
        float dmin =dri;        
        int[] cr = ((Robot) RobotsActivos.getNth(i).getData()).pos; 
        float dra = abs(sqrt((cr[0]-cm[0])^2)+((cr[1]-cm[1])^2));
        if(dra<dmin){
          dmin=dra;
          ganador=i;
        }
      }
    }
    if(ganador !=-1){
      return ((Robot) RobotsActivos.getNth(ganador).getData());
    }else{
      return ((Robot)((Node)listaRobots.deQueue()).getData());
    }
  }
}

void tiempo2(Pedido pedido){
  if (millis() - timer2 >= intervalo2){
    if(pedido.estaListo()){
      pedido.llevarComida(EscogerRobot(robotsinactivos,robotsList,pedido.mesaDestino));
      
    }
  timer2=millis();
  }

}
