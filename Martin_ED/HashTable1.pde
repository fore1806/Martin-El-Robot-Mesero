public class HashTable {
  
  int tamaño;
  int [] tamañosTabla;
  int indiceTam;
  int ocupados;
  float factor;
  nodoHash [] vectorHash;
  public HashTable(){
    this.tamañosTabla = new int [] {23, 29, 37, 43, 47, 53, 59, 67, 73, 79, 83, 89, 97, 103, 107, 113, 127, 137, 149, 157, 167, 179, 197, 211, 227, 239, 251, 263, 277, 293, 311, 997};
    this.indiceTam=0;
    this.ocupados=0;
    this.factor=50.0f;
    this.tamaño=tamañosTabla[indiceTam];

  }
  
  private int hash (int k) {
    int key=0;
    key = (k & 0x7fffffff) % tamaño;
    return key;
  }
  
  public Integer buscar (int k){
    return null;
  }
  
  public void insertar (int k){
  }
  
}

class nodoHash{
 char estado;
 String nombreVar;
 String tipo;
 String ambito;
 String valor;
}
