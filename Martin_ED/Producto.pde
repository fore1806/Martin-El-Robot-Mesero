class Producto {
  String categoria;
  String nombre;
  String descripcion;
  int costo;
  int cantidad=0;
  int tiempo_preparacion;
  PImage image;
  int x=0;
  int y=0;
  //String bText, float x_pos, float y_pos
  Button buttonadd = new Button("+",x,y);
  boolean addOprimido=false;
  Button buttonremove = new Button("-",x,y);
  boolean removeOprimido=false;
  
  Producto(String categoria, String nombre, String descripcion, int costo, PImage image, int tiempo_preparacion){
    this.categoria = categoria;
    this.nombre = nombre;
    this.descripcion = descripcion;
    this.costo = costo;
    this.image = image;
    this.tiempo_preparacion = tiempo_preparacion;
  }
  Producto(int tiempop){
    this.tiempo_preparacion = tiempop;
  }
  
  Producto(){
  }
  
  void displayProducto(int x, int y){
    int xTextos =(width - (x + width/3))/2 + (x + width/3);
    y -= width/6;
    
    push();
    
    
    textAlign(LEFT,BOTTOM);
    image.resize(width/3, width/3);
    image(image,x,y);
    textSize(40);
    text(categoria, x, y- height/30);
    textAlign(CENTER,TOP);
    textSize(50);
    text(nombre, xTextos, y);
    textSize(20);
    text(descripcion, xTextos, y + width/10);
    text("Tiempo de preparacion: " + tiempo_preparacion, xTextos, y + width/8);
    textSize(50);
    text("$" + costo, xTextos, y + width/6);
    rectMode(CENTER);  
    rect(xTextos,y + (2*width)/7,width/11,width/11,5);
    textAlign(CENTER,CENTER);
    fill(0);
    text(cantidad, xTextos ,y + (2*width)/7); 
    buttonadd.pos[0]=xTextos + (1.2*width)/11;
    buttonadd.pos[1]=y +  width/3 - width/22  -4;
    buttonremove.pos[0]=xTextos - (1.2*width)/11;
    buttonremove.pos[1]=y +  width/3 - width/22  -4;
    //buttonadd.pos[1]=y + (16*(width))/66)  -4;
    buttonadd.size[0]= width/11;
    buttonadd.size[1]= width/11;
    buttonremove.size[0]= width/11;
    buttonremove.size[1]= width/11;
    pop();
    
    if(buttonadd.check() && mousePressed && addOprimido  == false){
      addOprimido = true;
      cantidad++;
    }
    if(buttonremove.check() && mousePressed && removeOprimido  == false  && cantidad>0){
      removeOprimido = true;
      cantidad--;
    }
    
    if(!mousePressed){
      removeOprimido = false;
      addOprimido = false;
    }
    
    buttonadd.display();
    buttonremove.display();
    buttonremove.seleccionador();
    buttonadd.seleccionador();
  }
  
  int getTiempoDePreparacion(){
    return this.tiempo_preparacion;
  }
  
}
