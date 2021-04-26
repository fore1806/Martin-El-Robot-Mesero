//Tiempo

void tiempo() {
  if (millis() - timer >= intervalo) {

    Node pointer = robotsActivos.head;

    //Mover robots
    
    while (pointer!= null) {

      if (((Robot)(pointer.data)).isMoving()) {
        ((Robot)(pointer.data)).goDirection();
        println("Robot");
        println("pos x: " + ((Robot)(pointer.data)).pos[0]);
        println("pos y: " + ((Robot)(pointer.data)).pos[1]);
        //println("dir x: " + ((Robot)(pointer.data)).dir[0]);
        //println("dir y: " + ((Robot)(pointer.data)).dir[1]);
        //println("Bateria: " + ((Robot)(pointer.data)).battery);
        println("Se mueve?: " + ((Robot)(pointer.data)).isMoving());
      }

      if (((Robot)(pointer.data)).battery <= 30) {
        robotsToCharge.insertEnd(pointer);
      }

      pointer = pointer.getNext();
    }

    pointer = robotsToCharge.head;

    while (pointer!= null) {

      //Setear que deban ir a cargar

      if (((((Robot)(pointer.data)).dir[0] == 0)&&(((Robot)(pointer.data)).dir[1] == 0))) {
        ((Robot)(pointer.data)).setDirection(1300, 0);
        ((Robot)(pointer.data)).empty = false;
      }

      //Si ya estan deben ser cargados
      
      if (((Robot)(pointer.data)).isCharging()) {
        ((Robot)(pointer.data)).charge();
      } else if(((Robot)(pointer.data)).battery == 100){
        ((Robot)(pointer.data)).empty = true;
        ((Robot)(pointer.data)).charging = true;
        ((Robot)(pointer.data)).setDirection(0, 0);
        robotsActivos.insertEnd(pointer);
      } else if (((((Robot)(pointer.data)).pos[0] == 1300)&&(((Robot)(pointer.data)).pos[1] == 0))) {
        ((Robot)(pointer.data)).charging = true;
        robotsActivos.deleteNode(pointer);
      }

      pointer = pointer.getNext();
    }

    timer = millis();  //Asignamos el valor de millis a la variable para asi empezar un nuevo "intervalo"
  }
}
