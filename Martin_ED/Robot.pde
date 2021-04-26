public class Robot {

  int battery;
  int [] pos = new int [2]; //x,y
  int [] dir = {-100, -100}; //x,y
  int disMesas = 1; //Cambiar esta a lo que se decida
  int dischargeM = 120;
  int dischargeC = 0;
  boolean empty = true;
  boolean charging = false;
  boolean estaenlamesa = false;
  int id;
  

  Robot (int posX, int posY, int battery, int idR) { //El disMesas sera una constante que debe ser definida :v
    this.pos[0] = posX;
    this.pos[1] = posY;
    this.battery = battery;
    this.dir[0] = pos[0];
    this.dir[1] = pos[1];
    this.id = idR;
  }

  Robot (int posX, int posY, int battery) { //El disMesas sera una constante que debe ser definida :v
  this.pos[0] = posX;
  this.pos[1] = posY;
  this.battery = battery;
  this.dir[0] = pos[0];
  this.dir[1] = pos[1];
  }

  void setDirection (int dirX, int dirY) {
    this.dir[0] = dirX;
    this.dir[1] = dirY;
  }

  void move(int indicador) {
    if (!isMoving()) {//No debemos movernos
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
    if (isMoving()) {
      if (pos[0]!=dir[0]) {
        move(0);
      } else if (pos[1]!=dir[1]) {
        move(1);
      }

      if (dischargeC == dischargeM) {
        discharge();
        this.dischargeC = 0;
      } else {
        this.dischargeC += 1;
      }
    }
  }

  boolean isEmpty() {
    return empty;
  }

  boolean isMoving() {
    return !(pos[0]==dir[0] && pos[1]==dir[1]);
  }

  boolean isCharging() {
    return charging;
  }

  void charge() {
    if (battery<100 && charging) {
      this.battery+=1;
    }
  }

  void discharge() {
    if (battery>0 && !charging) {
      this.battery-=1;
    }
  }

  void connect() {
    charging = true;
  }

  void disconnect() {
    charging = false;
  }
}
