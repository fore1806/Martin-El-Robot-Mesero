/**
 * Función que define cual es el robot que debe ser escogido para entregar
 * el pedido.
 *
 * @param listaRobots Cola en la que se almacenan los robots que están en (0, 0).
 * @param RobotsActivos Lista en la que se almacenan los robots que están en la zona de mesas.
 * @param mesa Mesa a la que debe ser llevado el pedido
 * @return Robot escogido para entregar el pedido.
 */

Robot EscogerRobot(Queue<Node<Robot>> listaRobots, LinkedList<Node<Robot>> RobotsActivos, Mesa mesa ) {
  int[] cm = mesa.getCoordenadas();
  float dri = sqrt((cm[0]^2)+(cm[1]^2));
  int ganador= -1;
  Robot martinElElegido = null;
  if (RobotsActivos.isEmpty()) {
    martinElElegido =  ((Robot)((Node)listaRobots.deQueue()).getData());
  } else {
    float dmin =dri;
    for (int i=0; i<RobotsActivos.length(); i++) {
      if ( !((Robot) RobotsActivos.getNth(i).getData()).isMoving() /*&& ((Robot) RobotsActivos.getNth(i).getData()).battery>30*/ ) {      
        int[] cr = ((Robot) RobotsActivos.getNth(i).getData()).pos; 
        float dra = abs(sqrt((cr[0]-cm[0])^2)+((cr[1]-cm[1])^2));
        if (dra<dmin) {
          dmin=dra;
          ganador=i;
        }
      }
    }
    if (ganador !=-1) {
      martinElElegido =  ((Robot) RobotsActivos.getNth(ganador).getData());
    } else {
      martinElElegido = ((Robot)((Node)listaRobots.deQueue()).getData());
    }
  }

  if (martinElElegido!=null) {
    martinElElegido.battery = 100; //De momento le seteamos la bateria arbitrariamente en 100
  }

  return martinElElegido;
}

/**
 * Método encargado de analizar el transcurrir del tiempo
 * en el software y realizar las operaciones de selección
 * para la entrega de los pedidos.
 */

void tiempo2() {
  if (millis() - timer2 >= intervalo2) {
    Node pointer;
    if (!listaDePedidos.isEmpty()) {
      pointer = listaDePedidos.head;
      while (pointer != null) {
        Pedido pedido = (Pedido)pointer.getData();
        if (pedido.estaListo() && !pedido.yaSeAsigno) {
          pedido.robotAsignado = EscogerRobot(robotsinactivos, robotsList, pedido.mesaDestino);
          println("Se ha asignado el robot "+pedido.robotAsignado.id);
          //pedido.robotAsignado.empty = false;
          pedido.llevarComida();
          pedido.yaSeAsigno = true;
        }

        robotArrived(pedido);
        if (pedido.robotAsignado!=null) {
          if ((pedido.robotAsignado.estaenlamesa==true) && pedido.yaSirvio() && pedido.robotAsignado.activo) {
            println("Pedido del robot "+pedido.robotAsignado.id+" entregado");
            pedido.robotAsignado.setDirection(0, 0);
            robotsinactivos.enQueue(new Node(pedido.robotAsignado));
            //robotsActivos.delete(pedido.robotAsignado);
            pedido.robotAsignado.activo = false;
            pedido.robotAsignado.empty = true;
          }
        }
        pointer = pointer.getNext();
      }
    }
    timer2=millis();
  }
}

/**
 * Método encargado de inicializar robots para el restaurante
 *
 * @param cantidad entero que define la cantidad de robots a crear
 */
 
void addRobots(int cantidad) {
  for (int i=0; i<=cantidad; i++) {
    Robot martin = new Robot(0, 0, 100, i);
    Node n = new Node(martin);
    robotsinactivos.enQueue(n);
  }
}

/**
 * Método encargado de inicializar las mesas del restaurante
 *
 * @param mesasH entero que define la cantidad de mesas por fila
 * @param mesasV entero que define la cantidad de mesas por hilera
 */

void crearMesas(int mesasH, int mesasV) {
  for (int i=0; i<=mesasH; i++) {
    for (int j=0; j<=mesasV; j++) {
      Mesa m = new Mesa(str(i)+'-'+str(j));
      Node n = new Node(m);
      mesas.insertEnd(n);
    }
  }
}

/**
 * Método encargado de simular la entrega de los pedidos
 *
 * @param pedido Objeto de tipo Pedido que fue entregado
 */

void robotArrived(Pedido pedido) {
  if (pedido.robotAsignado!=null) {
    if ((pedido.robotAsignado.pos[0]== pedido.mesaDestino.coordenadas[0]) && (pedido.robotAsignado.pos[1]== pedido.mesaDestino.coordenadas[1]) && (pedido.enCamino==true)) {
      pedido.robotAsignado.estaenlamesa=true; 
      pedido.horaALaQueLlega=millis();
      pedido.enCamino=false;
    }
  }
}

/**
 * Método encargado de simular la realización de los pedidos
 */

void realizarPedido() {
  Pedido p1 = new Pedido(pedidoEnTramite, (Mesa)mesas.getNth((int)random(1, mesasVerticales*mesasHorizontales)).getData());
  p1.HacerPedido();
  Node n = new  Node(p1);
  listaDePedidos.insertEnd(n);
  println("El pedido se está preparando");
}
