//Booleanos de pantallas

boolean screenStart = true;
boolean screen1 = false;
boolean screen2 = false;
boolean screen3 = false;

//Botones
Button button1;
Button button2;
Button button3;

Button [] array = new Button[3]; //Esto debe ser cambiado por una lista!,permite añadir y borrar mas facil, creo yo

void setup() {
  size(1000, 840);
}

void draw() {
  background(0);
  buttons();
  buttonArray();
  if (screenStart) {
    startScreen();
  }else if(screen1){
    firstScreen();
  }else if(screen2){
    secondScreen();
  }else if(screen3){
    thirdScreen();
  }
}

void mousePressed() {
  if(screenStart){
    if(button1.check()){
      screenStart = !screenStart;
      screen1 = !screen1;
    }else if(button2.check()){
      screenStart = !screenStart;
      screen2 = !screen2;
    }else if(button3.check()){
      screenStart = !screenStart;
      screen3 = !screen3;
    }
  }
}
