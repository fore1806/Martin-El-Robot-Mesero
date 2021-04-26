//Booleanos de pantallas

boolean screenStart = true;
boolean screenAdmin = false;
boolean screenClient = false;
boolean screenPedidos = false;
boolean screenMesas = false;
boolean screenRobots = false;
boolean screenMenu = false;
boolean pedidoRealizado = false;
boolean screenPago = false;

//menú
boolean menuCreado = false;
LinkedList productos2 = new LinkedList<Node<Producto>>();
LinkedList pedidoEnTramite = new LinkedList<Node<Producto>>();
LinkedList productos_a_mostrar = new LinkedList<Node<Producto>>();

int k = 0;
float scroll=0;
int[] producto_categorias;
boolean realeased = false;
int ordenados = 0; //Numero de ordenados
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
Button button5;
Button button6;
Button button7;
Button button8;
Button button9;

ButtonList arrayButton = new ButtonList();

//Robots

int nRobots = 3;
LinkedList robotsList = new LinkedList<Node<Robot>>();
Queue robotsinactivos = new Queue<Node<Robot>>();
LinkedList robotsToCharge = new LinkedList<Node<Robot>>();
LinkedList robotsActivos = new LinkedList<Node<Robot>>();

//Mesas

LinkedList mesas = new LinkedList<Node<Mesa>>();

//Tiempo

int timer;  //Tiempo 
int intervalo = 20; 

int timer2;  //Tiempo 
int intervalo2 = 20; 

//Producto test

Producto pej = new Producto(2000);
Node n1 = new Node(pej);
LinkedList<Node<Producto>> llpr = new LinkedList();
Pedido p1 = new Pedido();

void setup() {
  size(1300, 650);
  startImage = loadImage("robot.png");
  addRobots(5); 
  crearMesas(6, 6);
  Mesa m = new Mesa("120-120");
  llpr.insertFront(n1);
  p1.productos = llpr;
  p1.mesaDestino = m;
  p1.HacerPedido();
}

void draw() {
  background(color1);
  push();
  rectMode(CENTER);
  fill(color5);
  rect(width/2, height/2, width-10, height-10);
  pop();
  tiempo();
  //tiempo3();
  tiempo2(p1);
  if (screenStart) {
    //print("x: "+martin.pos[0]);
    //print("y: "+martin.pos[1]);
    //martin.setDirection(50,100);
    //martin.goDirection();
    //print("x: "+martin.pos[0]);
    //print("y: "+martin.pos[1]);
    startScreen();
  } else if (screenAdmin) {
    adminScreen();
  } else if (screenClient) {
    clientScreen();
  } else if (screenPedidos) {
    pedidosScreen();
  } else if (screenMesas) {
    mesasScreen();
  } else if (screenRobots) {
    robotsScreen();
  } else if (screenMenu) {
    menuScreen();
  } else if (screenPago) {
    pagoScreen();
  }
}

void mousePressed() {
  if (screenStart) {
    if (button1.check()) {
      screenStart = !screenStart;
      screenAdmin = !screenAdmin;
      arrayButton.makeEmpty();
    } else if (button2.check()) {
      screenStart = !screenStart;
      screenClient = !screenClient;
      arrayButton.makeEmpty();
    }
  } else if (screenAdmin) {
    if (button1.check()) {
      screenAdmin = !screenAdmin;
      screenPedidos = !screenPedidos;
      arrayButton = new ButtonList();
    } else if (button2.check()) {
      screenAdmin = !screenAdmin;
      screenMesas = !screenMesas;
      arrayButton = new ButtonList();
    } else if (button3.check()) {
      screenAdmin = !screenAdmin;
      screenRobots = !screenRobots;
      arrayButton = new ButtonList();
    } else if (backButton.check()) {
      screenStart = !screenStart;
      screenAdmin = !screenAdmin;
      arrayButton = new ButtonList();
    }
  } else if (screenClient) {
    if (button5.check()) {
      screenClient = !screenClient;
      screenMenu = !screenMenu;
      arrayButton = new ButtonList();
    } else if (button6.check()) {
      pedidoRealizado=true;
    } else if (button7.check()) {
      screenClient = !screenClient;
      screenPago = !screenPago;
      arrayButton = new ButtonList();
    } else if (backButton.check()) {
      screenStart = !screenStart;
      screenClient = !screenClient;
      arrayButton = new ButtonList();
    }
  } else if (screenPago) {
    if (backButton.check()) {
      screenPago = !screenPago;
      screenClient = !screenClient;
      arrayButton = new ButtonList();
    } else if (button8.check()||button9.check()) {
      screenPago=!screenPago;
      pedidoRealizado=false;
    }
  } else if (screenMenu) {
    screenMenuButtons();
  }
}

void mouseWheel(MouseEvent event) {
  if (screenMenu) {
    scroll += event.getCount();
  }
}

void mouseRelased() {
  realeased = true;
  ;
}
