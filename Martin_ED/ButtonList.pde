public class ButtonList {

  Button[] array;
  int posF = 0;

  ButtonList() {
    array = new Button[10];
  }

  void insert(Button button) {
    array[posF] = button;
    posF+=1;
  }

  boolean isEmpty() {
    return posF==0;
  }

  void makeEmpty() {
    for (int i = posF-1; i<=0; i--) {
      array[i] = null;
    }
    posF=0;
  }
  
  void dupliquer(){
    if(array.length - posF <=1){
      Button[] arrayAux = new Button[2*array.length];
      for(int i=0; i< array.length; i++){
        arrayAux[i] = array[i]; 
      }
      this.array = arrayAux;     
      println("Se duplico");
    }
  }
  
  
}
