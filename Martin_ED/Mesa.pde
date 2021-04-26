class Mesa {
  String id;
  boolean estaOcupada;
  boolean estaSucia;
  int[] coordenadas;

  Mesa(String id) {
    this.id = id;
    String[] coordenadasTxt = split(id, '-');
    int[] x = {Integer.valueOf(coordenadasTxt[0]), Integer.valueOf(coordenadasTxt[1])};
    this.coordenadas = x;
  }

  void ocupada(boolean estaOc) {
    this.estaOcupada = estaOc;
  }
  void sucia(boolean s) {
    this.estaSucia = s;
  }

  boolean estaOcupada() {
    return this.estaOcupada;
  }

  boolean estaSucia() {
    return this.estaSucia;
  }

  int[] getCoordenadas() {
    return this.coordenadas;
  }
}
