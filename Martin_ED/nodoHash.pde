class nodoHash {
  int llave;
  int cedula;
  int visitas;
  
  public nodoHash (int llave, int cedula, int visitas) {
    this.llave=llave;
    this.cedula=cedula;
    this.visitas=visitas;
  }
  
  void aumentavisita (int visitas) {
    visitas += visitas;
  }
}
