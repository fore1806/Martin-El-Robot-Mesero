class Producto {
  String categoria;
  String nombre;
  String descripcion;
  int costo;
  int cantidad=0;
  int tiempo_preparacion;
  PImage image;
  
  Producto(String categoria, String nombre, String descripcion, int costo, PImage image, int tiempo_preparacion){
    this.categoria = categoria;
    this.nombre = nombre;
    this.descripcion = descripcion;
    this.costo = costo;
    this.image = image;
    this.tiempo_preparacion = tiempo_preparacion;
  }
  Producto( ){
    
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
    rect(xTextos,y + (2*width)/7,width/11,width/11);
    textAlign(CENTER,CENTER);
    fill(0);
    text(cantidad, xTextos ,y + (2*width)/7);
    
    pop();
    
  }
  
  int getTiempoDePreparacion(){
    return this.tiempo_preparacion;
  }
  
}
