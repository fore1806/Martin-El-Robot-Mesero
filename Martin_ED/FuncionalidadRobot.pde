//Tiempo

void tiempo() {
  if (millis() - timer >= intervalo) {
    
    Node pointer;
    

    if (!robotsActivos.isEmpty()) {

      pointer = robotsActivos.head;

      //Mover robots
      while (pointer!= null) {
        // print(((Robot)(pointer.data)).id+" ");
        if (((Robot)(pointer.data)).isMoving()) {
          ((Robot)(pointer.data)).goDirection();
          println("Robot: " + ((Robot)(pointer.data)).id);
          println("pos x: " + ((Robot)(pointer.data)).pos[0]);
          println("pos y: " + ((Robot)(pointer.data)).pos[1]);
          println();
          //println("dir x: " + ((Robot)(pointer.data)).dir[0]);
          //println("dir y: " + ((Robot)(pointer.data)).dir[1]);
          //println("Bateria: " + ((Robot)(pointer.data)).battery);
          //println("Se mueve?: " + ((Robot)(pointer.data)).isMoving());
        }
        

        //if (((Robot)(pointer.data)).battery <= 30) {
        //  robotsToCharge.insertEnd(pointer);
        //  robotsActivos.deleteNode(pointer);
        //}
        
        //println("lista sin datos: " + robotsToCharge.isEmpty());
        pointer = pointer.getNext();
      }
    }

    timer = millis();  //Asignamos el valor de millis a la variable para asi empezar un nuevo "intervalo"
  }
}


//void tiempo3(){
//  if (millis() - timer >= intervalo) {
//  Node pointer2;
//      if (!robotsToCharge.isEmpty()) {
//      pointer2 = robotsToCharge.head;
//      println("hola");

//      while (pointer2!= null) {

//        //Setear que deban ir a cargar

//        if (((((Robot)(pointer2.data)).dir[0] == 0)&&(((Robot)(pointer2.data)).dir[1] == 0))) {
//          ((Robot)(pointer2.data)).setDirection(1300, 0);
//          ((Robot)(pointer2.data)).empty = false;
//          ((Robot)(pointer2.data)).activo = false;
//          //robotsActivos.deleteNode(pointer2);
//          print("hola");
//          delay(5000);
//        }

//        //Vaya a zona de carga
//        if (((Robot)(pointer2.data)).isMoving()) {
//          ((Robot)(pointer2.data)).goDirection();
//          println("Robot");
//          println("pos x: " + ((Robot)(pointer2.data)).pos[0]);
//          println("pos y: " + ((Robot)(pointer2.data)).pos[1]);
//          //println("dir x: " + ((Robot)(pointer.data)).dir[0]);
//          //println("dir y: " + ((Robot)(pointer.data)).dir[1]);
//          println("Bateria: " + ((Robot)(pointer2.data)).battery);
//        }

//        //Si ya estan en la zona de carga deben ser cargados

//        if (((Robot)(pointer2.data)).isCharging()) {
//          ((Robot)(pointer2.data)).charge();
//          println("Esta cargando el robot: " + ((Robot)(pointer2.data)).id);
//        } else if (((Robot)(pointer2.data)).battery == 100) {
//          ((Robot)(pointer2.data)).empty = true;
//          ((Robot)(pointer2.data)).charging = false;
//          ((Robot)(pointer2.data)).activo = true;
//          ((Robot)(pointer2.data)).setDirection(0, 0);
//          robotsActivos.insertEnd(pointer2);
//          robotsToCharge.deleteNode(pointer2);
//        } else if (((((Robot)(pointer2.data)).pos[0] == 1300)&&(((Robot)(pointer2.data)).pos[1] == 0))) {
//          ((Robot)(pointer2.data)).charging = true;
//        }

//        pointer2 = pointer2.getNext();
//      }
//    }
//    timer = millis();  //Asignamos el valor de millis a la variable para asi empezar un nuevo "intervalo"
//  }
//}
