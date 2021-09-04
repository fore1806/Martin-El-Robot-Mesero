public class HashTableIntF {

  int m;
  int n = 0;
  int power;
  int p;
  int a;
  int b;
  float factor;
  float maxFactor;
  LinkedList[] table;

  public HashTableIntF () {
    this.power = 10;
    this.p = (10^power)+19;
    this.m = 150000;
    this.a = floor(random(1, p-1));
    this.b = floor(random(0, p-1));
    this.factor = n/m;
    this.maxFactor = 0.9;
    this.table = new LinkedList[m];
  }

  public HashTableIntF (int power, int m, float maxFactor) {
    this.power = power;
    this.p = (10^power)+19;
    this.m = m;
    this.a = floor(random(1, p-1));
    this.b = floor(random(0, p-1));
    this.factor = n/m;
    this.maxFactor = maxFactor;
    this.table = new LinkedList[m];
  }

  int hFunction (long CC) {
    return (int)((((this.a*CC)+this.b)%this.p)%this.m);
  }

  Node find (long CC) {
    Node founded = null;
    println("hashCode " + hFunction(CC));
    if (this.table[hFunction(CC)]==null) {
      this.table[hFunction(CC)]= new LinkedList();
    } else if (!this.table[hFunction(CC)].isEmpty()) {
      Node pointer = this.table[hFunction(CC)].getHead();
      while (pointer!= null) {
        if (((Cliente)(pointer.data)).CC == CC) {
          founded = pointer;
          break;
        }
        pointer = pointer.getNext();
      }
    }
    return founded;
  }

  void update (long CC) {
    Node nToUpdate = find(CC);
    if (nToUpdate == null) {
      nToUpdate = new Node(new Cliente(hFunction(CC), CC));
      this.table[hFunction(CC)].pushBack(nToUpdate);
      this.n += 1;
      this.factor = ((float)n)/((float)m);
    }
    ((Cliente)(nToUpdate.data)).nuevaVisita();
    println("Para el cliente " + CC + " Visitas= " + ((Cliente)(nToUpdate.data)).nVisitas);

    if (factor > maxFactor) {
      reHash();
    }
  }

  void reHash() {
    this.m = 2*m;
    LinkedList[] tableReHash = new LinkedList[m];
    factor = n/m;

    for (int i = 0; i<(m/2); i++) {
      if ((this.table[i]!=null) && (!this.table[i].isEmpty())) {
        Node pointer = this.table[i].getHead();
        while (pointer!= null) {
          if (tableReHash[hFunction(((Cliente)(pointer.data)).CC)]==null) {
            tableReHash[hFunction(((Cliente)(pointer.data)).CC)]= new LinkedList();
          }
          tableReHash[hFunction(((Cliente)(pointer.data)).CC)].pushBack(new Node(new Cliente(hFunction(((Cliente)(pointer.data)).CC), (((Cliente)(pointer.data)).CC))));
            pointer = pointer.getNext();
        }
      }
    }
    
    this.table = tableReHash;
  }
}
