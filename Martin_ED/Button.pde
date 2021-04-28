/**
 *  Button
 * 
 *  Clase para implementar un botón
 */

public class Button {
  int [] size = {220, 100};
  float [] pos = {0, 0};
  color strokeColor = #1C1412;
  color strokeSeleccioned;
  color fillColor = color6;//#BDC3C7;
  color textColor = color2;
  String bText;
  int sw = 2;

  Button(String bText, float x_pos, float y_pos) {
    this.bText = bText;
    this.pos[0] = x_pos;
    this.pos[1] = y_pos;
  }

  Button(String bText, float x_pos, float y_pos, int x_dim, int y_dim) {
    this.bText = bText;
    this.pos[0] = x_pos;
    this.pos[1] = y_pos;
    this.size[0] = x_dim;
    this.size[1] = y_dim;
  }

  Button(String bText, float x_pos, float y_pos, int x_dim, int y_dim, color strokeColor, color fillColor, color textColor) {
    this.bText = bText;
    this.pos[0] = x_pos;
    this.pos[1] = y_pos;
    this.size[0] = x_dim;
    this.size[1] = y_dim;
    this.strokeColor = strokeColor;
    this.fillColor = fillColor;
    this.textColor = textColor;
  }


/**
  * Muestra el boton en pantalla.
  * Dibuja el boton en la pantalla
  *
  */
  void display() {
    push();
    fill(fillColor);
    strokeWeight(sw);
    stroke(strokeColor);
    rectMode(CENTER);
    rect(pos[0], pos[1], size[0], size[1], 6);
    textAlign(CENTER, CENTER);
    textSize(40);
    fill(textColor);
    text(bText, pos[0], pos[1]);
    pop();
  }
/**
  * Comprueba si el mouse está encima del botón
  *
  * @return Boolean true si el mouse está encima del botón
  */
  boolean check() { 
    if ((mouseX > pos[0] - size[0]/2) && (mouseX < pos[0] + size[0]/2) && (mouseY > pos[1] - size[1]/2) && (mouseY < pos[1] + size[1]/2)) {
      return true;
    } else {
      return false;
    }
  }

/**
  * Colorea los bordes del boton si el mouse está encima del boton
  * Si el mouse está encima del botón aumenta el grosor de los bordes y cambia el color
  *
  */
  void seleccionador() {  //Metodo para cambiar el color del stroke, que nos indica cuando el mouse esta sobre el botón
    if (check()) {
      strokeSeleccioned = strokeColor;
      strokeColor = color4;
      sw = 7;
    } else {
      strokeColor = strokeSeleccioned;
      sw = 2;
    }
  }
}
