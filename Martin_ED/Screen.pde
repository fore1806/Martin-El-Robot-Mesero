

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
  background(0, 0, 0);
  crearMenu(menuCreado);
}

void crearMenu(boolean menu_creado) {
  if (!menu_creado) {
    /////////////////////////////////////////////////////////////////////
    String[] lines = loadStrings("./menu/menu.txt"); //Cargamos el archivo
    String cantidad_categorias = split(lines[1], " ")[0]; //Obtenemos el primer elemento de la segunda linea (cantidad de categorias)
    int[] categorias = new int[Integer.valueOf(cantidad_categorias)]; //Creamos un arrray con la cantidad de categorias, cada elemento tiene la cantidad de productos de cada uno
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
        //                       Producto(categoria,       nombre,       descripcion,             costo,         image){
        Producto ptr = new Producto(nombre_categoria, nombre_producto, descripcion_producto, precio_producto, imagen );
        Node puntero_producto = new Node(ptr);
        productos2.insertEnd(puntero_producto);
        productos.add((Producto)ptr);
      }



      categorias[i]=numeros_categoria;  //la almacenamos en el array
      renglon +=  1;  //Obtenemos el proximo renglon, donde estará la proxima categoria
    }
    // DEBUG imprimimos el arreglo
    for (int i=0; i<categorias.length; i++) {
     // print("[" + categorias[i] + "]");
    } 
    println();

    Node puntero_impresion = productos2.head;
    
    while(puntero_impresion!= null){
    println(((Producto)(puntero_impresion.data)).nombre); 
//println(puntero_impresion.getNext());
     puntero_impresion = puntero_impresion.getNext();
    }

    ///////////////////////////////////////
    menuCreado = true;
  } else {
    push();
    textSize(20);
    Producto ptr = new Producto(); 
    /*ptr = ()productos2.head.data;
    for(int j=0; j<k; j++){
    ptr= productos2.
    }
    ptr.displayProducto(50, height/2);*/
    //println(ptr.nombre + "  " + k);
    delay(100);

    k++;
    k %= productos.size();
    pop();
  }
}


void thirdScreen() {
  background(0, 0, 255);
}
