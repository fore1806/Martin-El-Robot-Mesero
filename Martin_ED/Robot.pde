/**
 *  Robot
 * 
 *  Clase encargada de manejar todo el funcionamiento de los robots 
 */

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
  boolean activo = false;
  int id;
  Pedido pedidoAct;


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

  /**
   * Método encargado de definir la dirección a la que debe
   * dirigirse el robot.
   *
   * @param dirX entero que define la dirección en x del Robot.
   * @param dirY entero que define la dirección en y del Robot.
   */

  void setDirection (int dirX, int dirY) {
    this.dir[0] = dirX;
    this.dir[1] = dirY;
  }

  /**
   * Método encargado de mover al robot verificando si debe moverse
   * a la derecha, izquierda, arriba o abajo en la pantalla.
   *
   * @param indicador entero que define si el Robot debe moverse en
   * el eje horizontal o vertical
   */

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

  /**
   * Método encargado de definir el movimiento en L del robot moviendolo primero
   * horizontalmente y posteriormente verticalmente a la vez que descarga el robot
   * si se cumple con las condiciones necesarias.
   */

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

  /**
   * Función que retorna un booleano que permite conocer si el robot esta libre para atender un pedido.
   *
   * @return un booleano que indica si el robot esta libre para atender un pedido.
   */

  boolean isEmpty() {
    return empty;
  }

  /**
   * Función que retorna un booleano que permite conocer si el robot esta en movimiento.
   *
   * @return un booleano que indica si el robot esta en movimiento.
   */

  boolean isMoving() {
    return !(pos[0]==dir[0] && pos[1]==dir[1]);
  }

  /**
   * Función que retorna un booleano que permite conocer si el robot se esta cargando.
   *
   * @return un booleano que indica si el robot se esta cargando.
   */

  boolean isCharging() {
    return charging;
  }

  /**
   * Función que retorna un booleano que permite conocer si el robot esta entregando un pedido.
   *
   * @return un booleano que indica si el robot esta entregando un pedido.
   */

  boolean isInTheTable() {
    return estaenlamesa;
  }

  /**
   * Método encargado de cargar el robot.
   */

  void charge() {
    if (battery<100 && charging) {
      this.battery+=1;
    }
  }

  /**
   * Método encargado de descargar el robot.
   */

  void discharge() {
    if (battery>0 && !charging) {
      this.battery-=1;
    }
  }
}
