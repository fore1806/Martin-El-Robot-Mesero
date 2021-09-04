public class Cliente {
  
  int hashKey;
  int nVisitas = 0;
  long CC;
  
  public Cliente (int hashKey, long CC) {
    this.nVisitas = 0;
    this.hashKey = hashKey;
    this.CC = CC;
  }
  
  void nuevaVisita () {
    this.nVisitas += 1;
  }
}
