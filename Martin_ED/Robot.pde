public class Robot {

  int batery;
  int [] pos = new int [2]; //x,y
  int [] dir = new int [2]; //x,y
  int disMesas;
  boolean empty = true;
  boolean arrived = false;

  Robot (int posX, int posY, int disMesas) { //El disMesas sera una constante que debe ser definida :v
    this.pos[0] = posX;
    this.pos[1] = posY;
    this.disMesas = disMesas;
  }

  void setDirection (int dirX, int dirY) {
    this.dir[0] = dirX;
    this.dir[1] = dirY;
  }

  void move(int indicador) {
    if (dir[0] == pos[0] && dir[1]==pos[1]) {//No debemos movernos
      this.arrived = true;
      this.empty = true; //Ya llego asi que es nuevamente libre
    } else if (indicador==0 && pos[0]!=dir[0]) {//Movernos en x
      if (dir[0]<pos[0])pos[0]-=disMesas;
      else pos[0]+=disMesas;
    } else if (indicador==1 && pos[1]!=dir[1]) { //Movernos en y
      if (dir[1]<pos[1])pos[1]-=disMesas;
      else pos[1]+=disMesas;
    }
  }

  void goDirection() {
    while (!hasArrived()) {
      move(0);
      move(1);
      //println("x: "+pos[0]);
      //println("y: "+pos[1]);
      //println(arrived);
    }
  }

  boolean isEmpty() {
    return empty;
  }

  boolean hasArrived() {
    return arrived;
  }
}
