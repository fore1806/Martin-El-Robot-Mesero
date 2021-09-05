/**
 *  Mesa
 * 
 *  Clase desarrollada para implementar la mesa
 */

class Mesa {
  String id;
  boolean estaOcupada;
  boolean estaSucia;
  float[] coordenadas;

  Mesa(String id) {
    this.id = id;
    String[] coordenadasTxt = split(id, '-');
    float[] x = {Float.valueOf(coordenadasTxt[0]), Float.valueOf(coordenadasTxt[1])};
    this.coordenadas = x;
  }

  /**
   * Configura el parametro estaOcupada
   * Establece estaOcupada con el valor de estaOc
   * @param estaOc Booleano que indica si está ocupada
   */

  void ocupada(boolean estaOc) {
    this.estaOcupada = estaOc;
  }

  /**
   * Configura el parametro sucia
   * Establece estaSucia con el valor de s
   * @param s Booleano que indica es está sucia la mesa
   */

  void sucia(boolean s) {
    this.estaSucia = s;
  }

  /**
   * Configura el parametro estaOcupada
   * Establece estaOcupada con el valor de estaOc
   * @param estaOc Booleano que indica si está ocupada
   */

  boolean estaOcupada() {
    return this.estaOcupada;
  }

  /**
   * Retorna si está sucia
   *
   * @return estaSucia retorna el estado de estaSucia
   */

  boolean estaSucia() {
    return this.estaSucia;
  }

  /**
   * Retorna un array con las coordenadas de la mesa
   *
   * @return coordenadas Array con las coordenadas de la mesa
   */
  float[] getCoordenadas() {
    return this.coordenadas;
  }
}
