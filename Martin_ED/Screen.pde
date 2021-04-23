

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
  button1 = new Button("ADMIN", (width/2)-390, (height/2)-50 );
  button2 = new Button("CLIENTE", (width/2)+390, (height/2)-50 );
  if (arrayButton.isEmpty()) {
    arrayButton.insert(button1);
    arrayButton.insert(button2);
  }
  showCheckButton(arrayButton);
  textAlign(CENTER, CENTER);
  textSize(80);
  fill(color6);
  text("Martin El Robot Mesero", width/2, 100);
}

void firstScreen() {
  background(255, 0, 0);
}

void secondScreen() {
  background(0, 255, 0);
}

void thirdScreen() {
  background(0, 0, 255);
}
