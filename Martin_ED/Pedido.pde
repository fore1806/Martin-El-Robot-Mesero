class Producto {
  String categoria;
  String nombre;
  String descripcion;
  int costo;
  PImage image;
  
  Producto(String categoria, String nombre, String descripcion, int costo, PImage image){
    this.categoria = categoria;
    this.nombre = nombre;
    this.descripcion = descripcion;
    this.costo = costo;
    this.image = image;
    
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
    textSize(50);
    text("$" + costo, xTextos, y + width/6);
    rectMode(CENTER);  
    rect(xTextos,y + (2*width)/7,width/11,width/11);
    
    pop();
    
  }
  
  
}
