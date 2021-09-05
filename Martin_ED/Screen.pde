void showCheckButton(ButtonList array) {
  for (int i = 0; i<array.posF; i++) {
    array.array[i].seleccionador();
    array.array[i].display();
  }
}
void startScreen() {
  push();
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
      robotsList.pushBack(new Robot(300-5*disMesasX, 50, (20 + (int) (Math.random()*81)), disMesasX, disMesasY));
    }
  }
  //((Robot)(robotsList.head.data)).setDirection(250, 300);  Esto hace algo?????
  pop();
}

void adminScreen() {
  push();
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
  pop();
}

void pedidosScreen() {
  push();
  background(color5);
  if (arrayButton.isEmpty()) {
    button4 = new Button ("botón de prueba", 450, 450);
    arrayButton.insert(button4);
  }
  showCheckButton(arrayButton);
  pop();
}

void mesasScreen() {
  push();
  background(color5);
  pop();
}

void robotsScreen() {
  push();
  background(color5);
  pop();
}

void clientScreen() {
  push();
  background(color5);
  if (arrayButton.isEmpty()) {
    button5 = new Button ("Menu", 450, (height/2)-200, 320, 100);
    button6 = new Button ("Realizar Pedido", 450, (height/2), 320, 100);
    button7 = new Button ("Pagar", 450, (height/2)+200, 320, 100);
    button8 = new Button ("Restaurante", 850, (height/2)-200, 320, 100);
    backButton = new Button ("Back", (width/2)-520, height-80);
    arrayButton.insert(button5);
    arrayButton.insert(button6);
    arrayButton.insert(button7);
    arrayButton.insert(button8);
    arrayButton.insert(backButton);
  }
  showCheckButton(arrayButton);
  pop();
}

void pagoScreen() {
  push();
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
  pop();
}


/**
 * Este metodo muestra las categorias disponibles y elige si mostrar productos o categorias
 * Creará el menú en caso de que no esté importado, si la lista productos_a_mostrar
 * tiene productoslos muestra, en caso contrario genera los botones con las categorias 
 */

void menuScreen() {
  push();
  int buttonX = width/3;
  int buttonY = height/4;
  finalizarpedido = new Button("Realizar pedido", width/2, height-80, 400, 110);
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

  if (ordenados>0 && productos_a_mostrar.isEmpty()) {
    finalizarpedido.seleccionador();
    finalizarpedido.display();
    //println("Hay pedido chicos, repito, hay foto" +  ordenados);
  }


  backButton.seleccionador();
  backButton.display();
  pop();

  //
}


/**
 * Crea un LinkedList con los productos del archivo de texto.
 * Solo se ejecutará una vez en todo el tiempo de ejecución
 *
 * @return array con los productos por categoria, en el orden de las categorias segun el .txt
 * @param menu_creado Booleano que indica si ya se creo el menú anteriormente
 */

int[] crearMenu(boolean menu_creado) {
  int [] categorias = new int[1];
  if (!menu_creado) {
    int to = millis();

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
        productos2.pushBack(ptr);
      }
      categorias[i]=numeros_categoria;  //la almacenamos en el array
      renglon +=  1;  //Obtenemos el proximo renglon, donde estará la proxima categoria
    }
    menuCreado = true;
    int tf = millis()-to;
    //println(tf);
  } 
  return categorias;
}



/**
 * Insertar los productos a mostrar segun categoria.
 * Insertará los objetos tipo producto en la lista productos_a_mostrar
 */
void screenMenuButtons() {  //Detectamos que botone de cateogira fue presionado
  push();

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
          productos_a_mostrar.pushBack(puntero);
          puntero = puntero.next;
        }
      }
    }
  }
  pop();
}


void thirdScreen() {
  background(0, 0, 255);
}


/**
 * Establece en 0 la cantidad detodos los productos
 * todos los objetos de la lista productos2 serán modificados con el parametro cantidad = 0
 */

void reiniciarProductos() {
  Node ptr = new Node();
  ptr = productos2.head;

  while (ptr!=null) {
    ((Producto)(ptr.data)).cantidad=0;
    ptr = ptr.next;
  }
}



/**
 * Inseta en pedidoEnTramite todos los productos que tengan cantidad diferente de 0
 */

void duplicarPedidos() {
  Node ptr = productos2.head;
  while (ptr!=null) {
    if (((Producto)(ptr.data)).cantidad!=0) {
      Producto puntero = new Producto();
      puntero = ((Producto)(ptr.data)).clone();
      pedidoEnTramite.pushBack(puntero);
    }
    ptr = ptr.next;
  }
  /* ptr = pedidoEnTramite.head;
   while(ptr!=null){
   print (((Producto)(ptr.data)).nombre   + "  " + ((Producto)(ptr.data)).cantidad);
   ptr = ptr.next;
   }*/
}


void idScreen() {

  push();
  //background(color5);
  text("Ingrese su cedula:", (width/2)-180, height/12);
  text("C.C. " + cedulaStr, (2.8*width/4), height/2.5);
  if (arrayButton.isEmpty()) {
    int desplazamientoX = 190;
    button1 = new Button("1", (width/2)-240-desplazamientoX, height/2-150, 100, 100 );
    button2 = new Button("2", (width/2)-120-desplazamientoX, (height/2)-150, 100, 100 );
    button3 = new Button("3", (width/2)-desplazamientoX, (height/2)-150, 100, 100 );
    button4 = new Button("4", (width/2)-240-desplazamientoX, (height/2)-30, 100, 100 );
    button5 = new Button("5", (width/2)-120-desplazamientoX, height/2-30, 100, 100 );
    button6 = new Button("6", (width/2)-desplazamientoX, (height/2)-30, 100, 100 );
    button7 = new Button("7", (width/2)-240-desplazamientoX, (height/2)+90, 100, 100 );
    button8 = new Button("8", (width/2)-120-desplazamientoX, (height/2)+90, 100, 100 );
    button9 = new Button("9", (width/2)-desplazamientoX, (height/2)+90, 100, 100 );
    button10 = new Button("0", (width/2)-120-desplazamientoX, (height/2)+210, 100, 100 );
    backButton = new Button ("Back", (width/2)-520, height-80);

    arrayButton.insert(button1);
    arrayButton.insert(button2);
    arrayButton.insert(button3);
    arrayButton.insert(button4);
    arrayButton.insert(button5);
    arrayButton.insert(button6);
    arrayButton.insert(button7);
    arrayButton.insert(button8);
    arrayButton.insert(button9);
    arrayButton.insert(button10);

    arrayButton.dupliquer();

    Button buttonEnter = new Button("Borrar", (width)-390, height-80);
    Button buttonErase = new Button("Enter", (width)-140, height-80);
    ;

    arrayButton.insert(buttonEnter);
    arrayButton.insert(buttonErase);
    arrayButton.insert(backButton);
  }

  showCheckButton(arrayButton);
  Button ptr;
  for (int i=0; i<20; i++) {
    ptr = arrayButton.array[i];
    if (ptr != null && ptr.check() && mousePressed && oprimido == false) {
      oprimido = true;
      if (i<=9) {
        cedulaStr += ptr.bText;
      } else if (i==10) { 
        cedulaStr = "";
      } else if (i==11 && cedulaStr != "") {  //Boton Enter
        screenClient = !screenClient; 
        screenId = !screenId;
        arrayButton.makeEmpty();
        cedula = Long.parseLong(cedulaStr);
        //arrayButton = new ButtonList();

        /*
        for(int j = 0; j<= 150000; j++){
         //clientes.update(cedula);
         clientes.update((long)random(0,5));
         }
         println("Factor :" + clientes.factor + " n: " + clientes.n + "Memory " + (Runtime.getRuntime().totalMemory())/1024);
         */
        long tiempo_inicial = millis();
        println("Memoria antes de cargar " +((Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory())/1024.0)/1024.0);
        String[] linesData = loadStrings("./dataset/cedulas.txt"); //Cargamos el archivo
        long tiempo_de_carga = millis()-tiempo_inicial;
        println("Memoria despues de cargar " +((Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory())/1024.0)/1024.0);

        long tiempo_de_ejecucion_inicial = millis();
        for (int j = 0; j<linesData.length; j++) {
          clientes.update(Long.parseLong(linesData[j])); 
          //println(j);
        }
        long tiempo_de_ejecucion = millis()- tiempo_de_ejecucion_inicial;
        println("Tiempo de carga del archivo " + tiempo_de_carga);
        println("Tiempo de ejecucion " + tiempo_de_ejecucion);
        println("Memoria despeus de hashear " +((Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory())/1024.0)/1024.0);
        println("Factor :" + clientes.factor);
      }
    } 


    if (!mousePressed) {
      //println("falseado" + millis());
      oprimido = false;
    }
  }
  
  pop();
}

void restaurantScreen() {
  
  push();

  if (!mesas.isEmpty()) {

    Node pointer = mesas.head;

    //Mostrar Mesas
    while (pointer!= null) {

      push();
      fill(color1);
      rectMode(CENTER);
      rect(((Mesa)(pointer.data)).getCoordenadas()[0], ((Mesa)(pointer.data)).getCoordenadas()[1], 6, 6);
      pointer = pointer.getNext();
      pop();
    }
  }

  if (!listaDePedidos.isEmpty()) {

    Node pointer = listaDePedidos.head;

    //Mostrar Mesas Ocupadas
    while (pointer!= null) {

      push();
      //fill(#61CE62);
      fill(color4);
      rectMode(CENTER);
      //Pedido pedidillo = ((Pedido)(pointer.data));
      //Mesa mesilla = ((Mesa)(pedidillo.mesaDestino));
      rect(((Mesa)(((Pedido)(pointer.data)).mesaDestino)).getCoordenadas()[0], ((Mesa)(((Pedido)(pointer.data)).mesaDestino)).getCoordenadas()[1], 6, 6);
      pointer = pointer.getNext();
      pop();
    }
  }

  if (!robotsActivos.isEmpty()) {

    Node pointer = robotsActivos.head;

    //Mostrar Robots
    while (pointer!= null) {

      push();
      strokeWeight(2);
      stroke(color4);
      fill(color3);
      ellipse(((Robot)(pointer.data)).pos[0], ((Robot)(pointer.data)).pos[1], 10, 10);
      pointer = pointer.getNext();
      pop();
    }
  }

  strokeWeight(2);
  stroke(#1C1412);
  fill(color6);
  rectMode(CENTER);
  rect((width/2)-520, 80, 220, 100, 6);
  fill(15);
  textAlign(CENTER, CENTER);
  textSize(40);
  fill(color2);
  text("Cocina", (width/2)-520, 80);
  arrayButton = new ButtonList();
  backButton = new Button ("Back", (width/2)-520, height-80);
  arrayButton.insert(backButton);
  showCheckButton(arrayButton);
  
  pop();
}
