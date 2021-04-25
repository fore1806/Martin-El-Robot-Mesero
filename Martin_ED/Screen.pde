

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
  if(robotsList.isEmpty()){
  for(int i = 0; i<nRobots; i++){
    robotsList.insertEnd(new Node(new Robot(0,0,(20 + (int) (Math.random()*81)))));
  }
  }
  ((Robot)(robotsList.head.data)).setDirection(250,300);
  
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
    button1 = new Button("PEDIDOS", (width/2)-180, (height/2)-220, 320, 100 );
    button2 = new Button("MESAS", (width/2)-180, (height/2)-40, 320, 100 );
    button3 = new Button("ROBOTS", (width/2)-180, (height/2)+140, 320, 100 );
    backButton = new Button ("BACK", (width/2)-520, height-80);
    arrayButton.insert(button1);
    arrayButton.insert(button2);
    arrayButton.insert(button3);
    arrayButton.insert(backButton);
  }
  showCheckButton(arrayButton);
}

void pedidosScreen() {
  background(color2);
  if (arrayButton.isEmpty()) {
    button4 = new Button ("botón de prueba", 450, 450);
    arrayButton.insert(button4);
  }
  showCheckButton(arrayButton);
}

void mesasScreen() {
  background(color3);
}

void robotsScreen() {
  background(color4);
}

void clientScreen() {
  background(0, 0, 0);
  menuScreen();
}

void menuScreen() {
  int buttonX = width/3;
  int buttonY = height/4;
  background(#00326E);
  //producto_categorias = new int[1];
  if(!menuCreado){
  producto_categorias = crearMenu(menuCreado);
  println(producto_categorias);
  }
  
  if(arrayButton.isEmpty()){
    Node puntero_categoria = productos2.head;
    for(int i=0; i < producto_categorias.length; i++){
      //println(((Producto)(puntero_categoria.data)).nombre);
      Button buttondinamic = new Button (((Producto)(puntero_categoria.data)).categoria, buttonX*((i%2) + 1) , buttonY* ((i%3) + 0.7),width/4 ,height/6);
      arrayButton.insert(buttondinamic);
      for(int j = 0; j<producto_categorias[i]; j++){
        puntero_categoria = puntero_categoria.next;
      }
    }
  }
  
  showCheckButton(arrayButton);
}

int[] crearMenu(boolean menu_creado) {
  int [] categorias = new int[1];
  if (!menu_creado) {
    /////////////////////////////////////////////////////////////////////
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
        println(tiempo_preparacion);
        //                       Producto(categoria,       nombre,       descripcion,             costo,         image   , tiempo preparacion){
        Producto ptr = new Producto(nombre_categoria, nombre_producto, descripcion_producto, precio_producto, imagen, tiempo_preparacion );
        Node puntero_producto = new Node(ptr);
        productos2.insertEnd(puntero_producto);
      }
      categorias[i]=numeros_categoria;  //la almacenamos en el array
      renglon +=  1;  //Obtenemos el proximo renglon, donde estará la proxima categoria
    }
   // DEBUG imprimimos el arreglo
   // for (int i=0; i<categorias.length; i++) {
    //  print("[" + categorias[i] + "]");
    //} 
    //println();

    Node puntero_impresion = productos2.head;
    
    while(puntero_impresion!= null){
      println(((Producto)(puntero_impresion.data)).nombre); 
      puntero_impresion = puntero_impresion.getNext();
    }

    ///////////////////////////////////////
    menuCreado = true;
  } else {
    push();
    textSize(20); 
    Node puntero_grafico = productos2.head;
    for(int j=0; j<k; j++){
      puntero_grafico = puntero_grafico.next;
    }
    ((Producto)puntero_grafico.data).displayProducto(50, height/2);
    //println(ptr.nombre + "  " + k);
    delay(100);

    k++;
    k %= productos2.elements;
    pop();
  }

  return categorias;
}

void screenClienteButtons(){
  int botones_categorias = arrayButton.posF;
  for(int i=0; i<botones_categorias; i++){
    if(arrayButton.array[i].check()){
    //print(arrayButton.array[i].bText);
    Node puntero = productos2.head;
    int elementos_anteriores = 0;
    for(int k=0; k<i; k++){
      elementos_anteriores += producto_categorias[k];
    }
    println(elementos_anteriores);
     for(int j=0; j<(elementos_anteriores);j++){ //Llego al primer producto de la categoria
       println(((Producto)(puntero.data)).nombre);
       puntero = puntero.next;
     }
      
     // println(i + " " + producto_categorias[i] );
    
    }
    
  }

}




void thirdScreen() {
  background(0, 0, 255);
}
