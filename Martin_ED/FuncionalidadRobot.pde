//Tiempo

void tiempo() {
  if (millis() - timer >= intervalo) {

    Node pointer = robotsList.head;
    while (pointer!= null) {
      if(!((Robot)(pointer.data)).hasArrived()){
        ((Robot)(pointer.data)).goDirection();
        println("pos x:" + ((Robot)(pointer.data)).pos[0]);
        println("pos y:" + ((Robot)(pointer.data)).pos[1]);
      }
      pointer = pointer.getNext();
    }
    timer = millis();  //Asignamos el valor de millis a la variable para asi empezar un nuevo "intervalo"
  }
}
