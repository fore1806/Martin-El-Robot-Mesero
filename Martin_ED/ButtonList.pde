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
}
