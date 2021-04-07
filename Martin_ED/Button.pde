public class Button{
  int [] size = {250,100};
  float [] pos = {0,0};
  color strokeColor = #1C1412;
  color strokeSeleccioned;
  color fillColor = #BDC3C7;
  color textColor = #1C1412;
  String bText;
  int sw = 2;
  
  Button(String bText, float x_pos, float y_pos){
    this.bText = bText;
    this.pos[0] = x_pos;
    this.pos[1] = y_pos;
  }
  
  Button(String bText, float x_pos, float y_pos, int x_dim, int y_dim){
    this.bText = bText;
    this.pos[0] = x_pos;
    this.pos[1] = y_pos;
    this.size[0] = x_dim;
    this.size[1] = y_dim;
  }
  
  Button(String bText, float x_pos, float y_pos, int x_dim, int y_dim, color strokeColor, color fillColor, color textColor){
    this.bText = bText;
    this.pos[0] = x_pos;
    this.pos[1] = y_pos;
    this.size[0] = x_dim;
    this.size[1] = y_dim;
    this.strokeColor = strokeColor;
    this.fillColor = fillColor;
    this.textColor = textColor;
  }
  
  void display(){
    push();
    fill(fillColor);
    strokeWeight(sw);
    stroke(strokeColor);
    rectMode(CENTER);
    rect(pos[0], pos[1], size[0], size[1], 6);
    textAlign(CENTER, CENTER);
    fill(textColor);
    text(bText, pos[0], pos[1]);
    pop();
  }
  
  boolean check() { 
    if ((mouseX > pos[0] - size[0]/2) && (mouseX < pos[0] + size[0]/2) && (mouseY > pos[1] - size[1]/2) && (mouseY < pos[1] + size[1]/2)) {
      return true;
    } else {
      return false;
    }
  }
  
  void seleccionador() {  //Metodo para cambiar el color del stroke, que nos indica cuando el mouse esta sobre el botón
    if (check()) {
      strokeSeleccioned = strokeColor;
      strokeColor = #3BE0F2;
      sw = 7;
    }else{
      strokeColor = strokeSeleccioned;
      sw = 2;
    }
  }
}
