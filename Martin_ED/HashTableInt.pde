public class HashTableInt {
  int p;
  int b;
  int a;
  int m; //m
  float factor;
  int potencia;
  private nodoHash [] vectorHash;
  
  public HashTableInt(){
    this.potencia=10;
    this.factor=90.0f;
    this.m=150000;
    this.p = 10^potencia + 19;
    this.a = floor(random (1, p-1));
    this.b = floor(random (0, p-1));
    this.vectorHash= new nodoHash [m];
  }
  
  private int hash (int k) {
    int key;
    key = ((a*k+b & 0x7fffffff) % p) % m;
    return key;
  }
  
  public Integer buscar (int k){
    return null;
  }
  
  public void insertar (int k){
    int [] 
  }
}
