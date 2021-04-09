

void buttons(){
  button1 = new Button("boton 1", width/1.5, height/4);
  button2 = new Button("boton 2", width/1.5, height/2 );
  button3 = new Button("boton 3", width/1.5, height*3/4);
}

void buttonArray(){
  array[0] = button1;
  array[1] = button2;
  array[2] = button3;
}

void showCheckButton(int posI, int posF){
  for(int i = posI; i<=posF; i++){
    array[i].seleccionador();
    array[i].display();
  }
}
void startScreen(){
  //background(0);
  button1 = new Button("boton 1", width/1.5, height/4);
  button2 = new Button("boton 2", width/1.5, height/2 );
  button3 = new Button("boton 3", width/1.5, height*3/4);
  buttonArray();
  showCheckButton(0,2);
  textAlign(CENTER, CENTER);
  fill(200);
  textSize(30);
  text("Martin El Robot Mesero",250, 200); 
}

void firstScreen(){
  background(255,0,0);
}

void secondScreen(){
  background(0,255,0);
}

void thirdScreen(){
  background(0,0,255);
}
