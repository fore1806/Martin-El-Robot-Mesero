

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
  background(0, 255, 0);
}

void thirdScreen() {
  background(0, 0, 255);
}
