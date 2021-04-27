/**
 *  ButtonList
 * 
 *  Clase para implementar un array dinamico o estatico de objetos tipo Button
 */

public class ButtonList {

  Button[] array;
  int posF = 0;

  ButtonList() {
    array = new Button[10];
  }

 /**
  * Inserta un Button al arreglo
  * 
  * @param Button button boton que desea agregar al array 
  */

  void insert(Button button) {
    array[posF] = button;
    posF+=1;
  }
  
 /**
  * Comprueba si el array está vacio.
  * 
  * @return boolean true si está vacia
  */
  
  boolean isEmpty() {
    return posF==0;
  }


  /**
   * Vacia el array
   * Recorre el array y configura cada elemento como null
   */
  void makeEmpty() {
    for (int i = posF-1; i<=0; i--) {
      array[i] = null;
    }
    posF=0;
  }



  /**
   * Duplica el array si su tamaño está proximo a llenarse
   * Si el array solo tiene un espacio libre, procede a crear un nuevo array
   * con el doble del tamaño, copiando el original. 
   */
  void dupliquer() {
    if (array.length - posF <=1) {
      Button[] arrayAux = new Button[2*array.length];
      for (int i=0; i< array.length; i++) {
        arrayAux[i] = array[i];
      }
      this.array = arrayAux;     
      println("Se duplico");
    }
  }
}
