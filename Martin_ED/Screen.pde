

//void buttons() {
//  button1 = new Button("boton 1", width/1.5, height/4);
//  button2 = new Button("boton 2", width/1.5, height/2 );
//}

//void buttonArray() {
//  array[0] = button1;
//  array[1] = button2;
//}

void showCheckButton(ButtonList array) {
  for (int i = 0; i<array.posF; i++) {
    array.array[i].seleccionador();
    array.array[i].display();
  }
}
void startScreen() {
  image(startImage, width/8, 180, 3*width/4, height-180);
  if (arrayButton.isEmpty()) {
    button1 = new Button("ADMIN", (width/2)-390, (height/2)-50 );
    button2 = new Button("CLIENTE", (width/2)+390, (height/2)-50 );
    arrayButton.insert(button1);
    arrayButton.insert(button2);
  }
  showCheckButton(arrayButton);
  textAlign(CENTER, CENTER);
  textSize(80);
  fill(color6);
  text("Martin El Robot Mesero", width/2, 100);
  if (robotsList.isEmpty()) {
    for (int i = 0; i<nRobots; i++) {
      robotsList.insertEnd(new Node(new Robot(0, 0, (20 + (int) (Math.random()*81)))));
    }
  }
  ((Robot)(robotsList.head.data)).setDirection(250, 300);

  //println("bateria: " + ((Robot)(robotsList.head.data)).battery);
  //println("pos y: " + ((Robot)(robotsList.head.data)).dir[1]);
  //((Robot)(robotsList.head.next.next.data)).setDirection(420,280);
  //Node pointer = robotsList.head;

  //  while(pointer!= null){
  //  println(((Robot)(pointer.data)).battery); 
  //   pointer = pointer.getNext();
  //  }
}

void adminScreen() {
  if (arrayButton.isEmpty()) {
    button1 = new Button("Pedidos", (width/2)-180, (height/2)-220, 320, 100 );
    button2 = new Button("Mesas", (width/2)-180, (height/2)-40, 320, 100 );
    button3 = new Button("Robots", (width/2)-180, (height/2)+140, 320, 100 );
    backButton = new Button ("Back", (width/2)-520, height-80);
    arrayButton.insert(button1);
    arrayButton.insert(button2);
    arrayButton.insert(button3);
    arrayButton.insert(backButton);
  }
  showCheckButton(arrayButton);
}

void pedidosScreen() {
  background(color5);
  if (arrayButton.isEmpty()) {
    button4 = new Button ("botón de prueba", 450, 450);
    arrayButton.insert(button4);
  }
  showCheckButton(arrayButton);
}

void mesasScreen() {
  background(color5);
}

void robotsScreen() {
  background(color5);
}

void clientScreen() {
  background(color5);
  if (arrayButton.isEmpty()) {
    button5 = new Button ("Menu", 450, (height/2)-200, 320, 100);
    button6 = new Button ("Realizar Pedido", 450, (height/2), 320, 100);
    button7 = new Button ("Pagar", 450, (height/2)+200,320, 100);
    backButton = new Button ("Back", (width/2)-520, height-80);
    arrayButton.insert(button5);
    arrayButton.insert(button6);
    arrayButton.insert(button7);
    arrayButton.insert(backButton);
  }
  showCheckButton(arrayButton);
}

void pagoScreen() {
  background(245, 200, 66);
  textSize(40);
  fill(color2);
  text("VALOR A PAGAR:", (width/2)-180, height/3);
  if (arrayButton.isEmpty()) {
    button8 = new Button("Pago en efectivo", (width/2)-180, height/2, 320, 100 );
    button9 = new Button("Pago con tarjeta", (width/2)-180, (height/2)+150, 320, 100 );
    backButton = new Button ("Back", (width/2)-520, height-80);
    arrayButton.insert(button8);
    arrayButton.insert(button9);
    arrayButton.insert(backButton);
  }
  showCheckButton(arrayButton);
}

void menuScreen() {
  int buttonX = width/3;
  int buttonY = height/4;
  Button finalizarpedido = new Button("Realizar pedido", width/2, height-80,400,110);
  
  if (!menuCreado) { //Si no hay menú importado, crea el menú
    producto_categorias = crearMenu(menuCreado); //Almacenamos los productos por categorias
  }

  if (productos_a_mostrar.isEmpty()) { //Si no hay productos a mostrar mostramos el menu categorias
    duplicarPedidos();
    backButton = new Button("Back", (width/2)-520, height-80);
    background(color5);
    showCheckButton(arrayButton);
    if (arrayButton.isEmpty()) {
      Node puntero_categoria = productos2.head;
      for (int i=0; i < producto_categorias.length; i++) {

        Button buttondinamic = new Button (((Producto)(puntero_categoria.data)).categoria, buttonX*((i%2) + 1), buttonY* ((i%3) + 0.7), width/4, height/6);
        arrayButton.insert(buttondinamic);
        for (int j = 0; j<producto_categorias[i]; j++) {
          puntero_categoria = puntero_categoria.next;
        }
      }
    }
    if (backButton.check() && mousePressed) {
      ordenados = 0;
      reiniciarProductos();
      pedidoEnTramite = new LinkedList<Node<Producto>>();
      screenClient = !screenClient;
      screenMenu = !screenMenu;
      arrayButton = new ButtonList();
    }
  } else { //Si ya hay menú
    background(color5);
    Node put = new Node();
    put = (productos_a_mostrar.head);
    //((Producto)(put.data)).displayProducto(100,100);
    //Mostramos productos:
    //println(productos_a_mostrar.elements);
    for (int i=0; i<productos_a_mostrar.elements; i++) {
      ((Producto)(put.data)).displayProducto(50, 350+(550*i) + (int)scroll*20);
      put = put.next;
    }
    if (scroll>0) {
      scroll = 0;
    }
    if (scroll<-(22*productos_a_mostrar.elements)) {
      scroll = -22*productos_a_mostrar.elements;
    }

    //((Producto)(productos_a_mostrar.head)).displayProducto(500,500);
    if (backButton.check() && mousePressed) {
      productos_a_mostrar = new LinkedList();     
    }
    backButton = new Button("Back", /*(width/2)-520*/ 1180, height-80);
  }

 if(ordenados>0 && productos_a_mostrar.isEmpty()){
   finalizarpedido.seleccionador();
   finalizarpedido.display();
   //println("Hay pedido chicos, repito, hay foto" +  ordenados); 
  }


  backButton.seleccionador();
  backButton.display();

  //
}

int[] crearMenu(boolean menu_creado) {
  int [] categorias = new int[1];
  if (!menu_creado) {

    String[] lines = loadStrings("./menu/menu.txt"); //Cargamos el archivo
    String cantidad_categorias = split(lines[1], " ")[0]; //Obtenemos el primer elemento de la segunda linea (cantidad de categorias)
    categorias = new int[Integer.valueOf(cantidad_categorias)]; //Creamos un arrray con la cantidad de categorias, cada elemento tiene la cantidad de productos de cada uno
    int renglon = 2; //Iniciamos el analisis en el renglon 2 (Primera categoria

    for (int i=0; i<categorias.length; i++) {
      String categoria = lines[renglon];  //obtenemos el renglon
      categoria = categoria.replace("\t", ""); //quitamos la tabulacion
      //println(categoria.substring(2));
      String nombre_categoria = categoria.substring(2); //Obtenemos el nombre de la categoria
      int numeros_categoria = Integer.valueOf(split(categoria, " ")[0]);  //obtenemos la cantidad de productos de esa categoria  
      for (int j=0; j<numeros_categoria; j++) {
        renglon++;
        String nombre_producto = lines[renglon];
        nombre_producto = nombre_producto.replace("\t", ""); //quitamos la tabulacion
        //println(nombre_producto);
        renglon++;
        String descripcion_producto = lines[renglon];
        descripcion_producto = descripcion_producto.replace("\t", ""); //quitamos la tabulacion
        //println(descripcion_producto);
        renglon++;
        String str_precio_producto = lines[renglon];
        str_precio_producto = str_precio_producto.replace("\t", "");  //quitamos la tabulacion   
        str_precio_producto = split(str_precio_producto, " ")[0]; 
        int precio_producto = Integer.valueOf(str_precio_producto);
        //println(precio_producto);
        String nimagen_producto = lines[renglon];
        nimagen_producto = split(nimagen_producto, " ")[1];    
        //println("./menu/" + nimagen_producto);
        PImage imagen = loadImage("./menu/" + nimagen_producto);
        renglon++;
        String str_tiempo_preparacion = lines[renglon];
        str_tiempo_preparacion = str_tiempo_preparacion.replace("\t", "");
        int tiempo_preparacion = Integer.valueOf(str_tiempo_preparacion);
        //println(tiempo_preparacion);
        //                       Producto(categoria,       nombre,       descripcion,             costo,         image   , tiempo preparacion){
        Producto ptr = new Producto(nombre_categoria, nombre_producto, descripcion_producto, precio_producto, imagen, tiempo_preparacion );
        Node puntero_producto = new Node(ptr);
        productos2.insertEnd(puntero_producto);
      }
      categorias[i]=numeros_categoria;  //la almacenamos en el array
      renglon +=  1;  //Obtenemos el proximo renglon, donde estará la proxima categoria
    }
    menuCreado = true;
  } 
  return categorias;
}

void screenMenuButtons() {  //Detectamos que botone de cateogira fue presionado

  //println("Lista de productos: " + arrayButton.posF);
  if (productos_a_mostrar.isEmpty()) { 
    scroll=0;
    int botones_categorias = arrayButton.posF; //La cantidad de botones de categoria que hay
    for (int i=0; i<botones_categorias; i++) { //Revisamos cada boton de categoria   
      if (arrayButton.array[i].check()) {      //Si está oprimido
        productos_a_mostrar = new LinkedList();//Vaciamos la lista
        Node puntero = productos2.head;        //Creamos un puntero
        int elementos_anteriores = 0;          //Iniciamos un contador
        for (int k=0; k<i; k++) {
          elementos_anteriores += producto_categorias[k]; //Sumamos todos los productos de categoria para llegar a la que queremos
        }
        for (int j=0; j<(elementos_anteriores); j++) { //Llego al primer producto de la categoria
          puntero = puntero.next;                      //Recorremos
        }

        //Aqui obtenemos los que queremos
        for (int l= elementos_anteriores; l<(elementos_anteriores+producto_categorias[i]); l++) {
          productos_a_mostrar.insertEnd(puntero);
          puntero = puntero.next;
        }

      }
    }
  }
}


void thirdScreen() {
  background(0, 0, 255);
}

void reiniciarProductos(){
  Node ptr = new Node();
  ptr = productos2.head;
  
  while(ptr!=null){
    ((Producto)(ptr.data)).cantidad=0;
    ptr = ptr.next;
  }
}

void duplicarPedidos(){
  Node ptr = productos2.head;
  while(ptr!=null){
    if(((Producto)(ptr.data)).cantidad!=0){
      Producto puntero = new Producto();
      puntero = ((Producto)(ptr.data)).clone();
      Node nodo = new Node(puntero);
      pedidoEnTramite.insertEnd(nodo);
    }
    ptr = ptr.next;
  }
 /* ptr = pedidoEnTramite.head;
  while(ptr!=null){
    print (((Producto)(ptr.data)).nombre   + "  " + ((Producto)(ptr.data)).cantidad);
    ptr = ptr.next;
  }*/
}
