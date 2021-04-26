//Tiempo

void tiempo() {
  if (millis() - timer >= intervalo) {

    Node pointer = robotsList.head;
    while (pointer!= null) {
      if(((Robot)(pointer.data)).isMoving()){
        ((Robot)(pointer.data)).goDirection();
        //println("Robot");
        //println("pos x: " + ((Robot)(pointer.data)).pos[0]);
        //println("pos y: " + ((Robot)(pointer.data)).pos[1]);
        //println("dir x: " + ((Robot)(pointer.data)).dir[0]);
        //println("dir y: " + ((Robot)(pointer.data)).dir[1]);
        //println("Bateria: " + ((Robot)(pointer.data)).battery);
        //println("Se mueve?: " + ((Robot)(pointer.data)).isMoving());
      }
      pointer = pointer.getNext();
    }
    
    timer = millis();  //Asignamos el valor de millis a la variable para asi empezar un nuevo "intervalo"
  }
}
