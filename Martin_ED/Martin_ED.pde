//Booleanos de pantallas

boolean screenStart = true;
boolean screen1 = false;
boolean screen2 = false;
boolean screen3 = false;

//imagenes

PImage startImage;

//Colors

color color1 = #FFD01E; //Amarillo
color color2 = #141414; //Negro
color color3 = #B6B6BA; //Grisesito
color color4 = #C10000; //Rojito
color color5 = #00326E; //Azul oscuro
color color6 = #faf7fa; //Blanquito

//Botones
Button button1;
Button button2;
Button button3;

ButtonList arrayButton = new ButtonList();

Button [] array = new Button[3]; //Esto debe ser cambiado por una lista!,permite añadir y borrar mas facil, creo yo

void setup() {
  size(1300, 650);
  startImage = loadImage("robot.png");
  
}

void draw() {
  background(color1);
  push();
  rectMode(CENTER);
  fill(color5);
  rect(width/2, height/2, width-10,height-10);
  pop();
  //buttons();
  //buttonArray();
  if (screenStart) {
    startScreen();
  }else if(screen1){
    firstScreen();
  }else if(screen2){
    secondScreen();
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
    }
  }
}
