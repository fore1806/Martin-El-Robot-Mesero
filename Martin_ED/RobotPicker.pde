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
      pedido.robotAsignado = EscogerRobot(robotsinactivos,robotsList,pedido.mesaDestino);
      pedido.llevarComida();
    }
    while (pedido.robotAsignado != null) {
      if(pedido.robotAsignado.isMoving()){
        pedido.robotAsignado.goDirection();
        println("pos x: " + (pedido.robotAsignado.pos[0]));
        println("pos y: " + (pedido.robotAsignado.pos[1]));
      }
    }
  timer2=millis();
  }
}

void addRobots(int cantidad){
  for (int i=0; i<=cantidad; i++){
    Robot martin = new Robot(0,0,100,i);
    Node n = new Node(martin);
    robotsinactivos.enQueue(n);
  }
}

void crearMesas(int mesasH, int mesasV){
  for (int i=0; i<=mesasH; i++){
     for (int j=0; j<=mesasV; j++){
         Mesa m = new Mesa(str(i)+'-'+str(j));
         Node n = new Node(m);
         mesas.insertEnd(n);
     }
  }
}
