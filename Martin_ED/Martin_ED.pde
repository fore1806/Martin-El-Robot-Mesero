//Booleanos de pantallas

boolean screenStart = true;
boolean screenAdmin = false;
boolean screenClient = false;
boolean screenId = false;
boolean screenPedidos = false;
boolean screenMesas = false;
boolean screenRobots = false;
boolean screenMenu = false;
boolean pedidoRealizado = false;
boolean screenPago = false;
boolean screenRestaurant = false;
boolean screenFiltro1 = false;
boolean screenFiltro2 = false;

//HashTable Clienet

HashTableIntF clientes = new HashTableIntF();


//menú
boolean menuCreado = false;
LinkedList productos2 = new LinkedList<Node<Producto>>();
LinkedList pedidoEnTramite = new LinkedList<Node<Producto>>();
LinkedList productos_a_mostrar = new LinkedList<Node<Producto>>();
//BinarySearchTree treeproductos = new BinarySearchTree();
ArbolAVL treeproductos = new ArbolAVL();
LinkedList listaDePedidos = new LinkedList<Node<Pedido>>();

Button finalizarpedido;
Button filtro1;
Button filtro2;

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
Button button10;

ButtonList arrayButton = new ButtonList();
//Node ptr = new Node(buttondinamic);
//Robots

int nRobots = 3;
LinkedList robotsList = new LinkedList<Node<Robot>>();
Queue robotsinactivos = new Queue<Node<Robot>>();
LinkedList robotsToCharge = new LinkedList<Node<Robot>>();
LinkedList robotsActivos = new LinkedList<Node<Robot>>();

//Mesas

LinkedList mesas = new LinkedList<Node<Mesa>>();

int mesasHorizontales = 50;
int mesasVerticales = 25;

float disMesasX = 980/mesasHorizontales;
float disMesasY = 550/mesasVerticales;

//Tiempo

int timer;  //Tiempo 
int intervalo = 600; 

int timer2;  //Tiempo 
int intervalo2 = 20; 

String cedulaStr = "";
boolean oprimido = false;
long cedula;

void setup() {
  background(color1);
  size(1300, 650);
  startImage = loadImage("robot.png");
  addRobots(5); 
  crearMesas(mesasHorizontales, mesasVerticales);
  
  
}

void draw() {
  //background(color1);
  push();
  rectMode(CENTER);
  fill(color5);
  rect(width/2, height/2, width-10, height-10);
  pop();
  tiempo();
  //tiempo3();
  tiempo2();

  if (screenStart) {
    startScreen();
  } else if (screenAdmin) {
    adminScreen();
  } else if (screenClient) {
    clientScreen();
  }else if (screenId){
    idScreen(); 
  }
  else if (screenPedidos) {
    pedidosScreen();
  } else if (screenMesas) {
    mesasScreen();
  } else if (screenRobots) {
    robotsScreen();
  } else if (screenMenu) {
    menuScreen();
  } else if(screenFiltro1){
    screenFiltro1();
  }else if(screenFiltro2){
    screenFiltro2();
  }else if (screenPago) {
    pagoScreen();
  } else if (screenRestaurant){
    restaurantScreen();
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
      //screenClient = !screenClient; 
      screenId = !screenId;
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
  } else if (screenId){
      if (backButton.check()) {
      screenId= !screenId;
      screenStart = !screenStart;
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
    } else if (button8.check()) {
      screenClient = !screenClient;
      screenRestaurant = !screenRestaurant;
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
      if (finalizarpedido.check()){
        realizarPedido();
      }else if(filtro1.check()){
      screenFiltro1=!screenFiltro1;
      screenMenu=!screenMenu;
      
    }else if(filtro2.check()){
      screenFiltro2=!screenFiltro2;
      screenMenu=!screenMenu;
    }
      
  }
  else if(screenFiltro1){
    if(backButton.check()){
    screenFiltro1=!screenFiltro1;
    screenMenu=!screenMenu;
  }
  }
  else if(screenFiltro2){
    if(backButton.check()){
    screenFiltro2=!screenFiltro2;
    screenMenu=!screenMenu;
    }
  }
  else if(screenRestaurant){
    if (backButton.check()) {
      screenRestaurant = !screenRestaurant;
      screenClient = !screenClient;
      arrayButton = new ButtonList();
    }
  }
}

void mouseWheel(MouseEvent event) {
  if (screenMenu || screenFiltro1 || screenFiltro2) {
    scroll += event.getCount();
  }
}

void mouseRelased() {
  realeased = true;
}
