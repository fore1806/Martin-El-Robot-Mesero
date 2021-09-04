public class HashTable {
  
  private final int sizeH=23;
  
  public HashTable (){
  }
  
  private int hash (int k) {
    int key=0;
    key = (k & 0x7fffffff) % sizeH;
    return key;
  }
  
  public Integer buscar (int k){
    return null;
  }
  
  public void insertar (int k){
  }
  
}
