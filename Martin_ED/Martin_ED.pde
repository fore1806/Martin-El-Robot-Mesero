//Booleanos de pantallas

boolean screenStart = true;
boolean screenAdmin = false;
boolean screenClient = false;
boolean screenPedidos = false;
boolean screenMesas = false;
boolean screenRobots = false;

//menú
boolean menuCreado = false;
ArrayList<Producto> productos = new ArrayList<Producto>();
int k = 0;
int scroll=0;
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
Button backButton;
Button button1;
Button button2;
Button button3;
Button button4;

ButtonList arrayButton = new ButtonList();

//Robot martin = new Robot(0,0,25);

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
  
  if (screenStart) {
    //print("x: "+martin.pos[0]);
    //print("y: "+martin.pos[1]);
    //martin.setDirection(50,100);
    //martin.goDirection();
    //print("x: "+martin.pos[0]);
    //print("y: "+martin.pos[1]);
    startScreen();
  }else if(screenAdmin){
    adminScreen();
  }else if(screenClient){
    clientScreen();
  }else if(screenPedidos){
    pedidosScreen();
  }else if(screenMesas){
    mesasScreen();
  }else if(screenRobots){
    robotsScreen();
  }
}

void mousePressed() {
  scroll += 20;
  scroll%=height*2;
  if(screenStart){
    if(button1.check()){
      screenStart = !screenStart;
      screenAdmin = !screenAdmin;
      arrayButton.makeEmpty();
    }else if(button2.check()){
      screenStart = !screenStart;
      screenClient = !screenClient;
      arrayButton.makeEmpty();
    }
  }else if(screenAdmin){
    if(button1.check()){
      screenAdmin = !screenAdmin;
      screenPedidos = !screenPedidos;
      arrayButton = new ButtonList();
    } else if(button2.check()){
      screenAdmin = !screenAdmin;
      screenMesas = !screenMesas;
      arrayButton = new ButtonList();
    } else if(button3.check()){
      screenAdmin = !screenAdmin;
      screenRobots = !screenRobots;
      arrayButton = new ButtonList();
    } else if(backButton.check()){
      screenStart = !screenStart;
      screenAdmin = !screenAdmin;
      arrayButton = new ButtonList();
    }
  }
}
