public class ArbolAVL{
  private Node<Producto> root;
  private int contadorAVL;
  
  public ArbolAVL(){
    root = null;
    contadorAVL= 0;
  }
  public int getFE(Node<Producto> p){
     if(p==null){
       return -1;
     }else{
       return p.fe;
     }
  }
  public Node<Producto> leftRotation(Node<Producto> pr){
    Node<Producto> aux = pr.left;
    pr.left = aux.right;
    aux.right = pr;
    pr.fe = Math.max(getFE(pr.left),getFE(pr.right)) + 1;
    aux.fe = Math.max(getFE(aux.left),getFE(aux.right)) + 1;
    return aux;
  }
  public Node<Producto> rightRotation(Node<Producto> pr){
    Node<Producto> aux = pr.right;
    pr.right = aux.left;
    aux.left = pr;
    pr.fe = Math.max(getFE(pr.left),getFE(pr.right)) + 1;
    aux.fe = Math.max(getFE(aux.left),getFE(aux.right)) + 1;
    return aux;
  }
  public Node<Producto> doubleLeftRotation(Node<Producto> pr){
    Node<Producto> aux;
    pr.left = rightRotation(pr.left);
    aux = leftRotation(pr);
    return aux;
  }
  public Node<Producto> doubleRightRotation(Node<Producto> pr){
    Node<Producto> aux;
    pr.right = leftRotation(pr.right);
    aux = rightRotation(pr);
    return aux;
  }
  public void insert(Producto p){
    Node<Producto> x = new Node<Producto>(p);
    if(root == null){
      root = x;
    }else{
      root = insertAVL(x,root);
    }
  } 
  public Node<Producto> insertAVL(Node<Producto> newN, Node<Producto> subT){
    Node<Producto> newF = subT;
    if(newN.data.costo<subT.data.costo){
      if(subT.left == null){
        subT.left = newN;
      }else{
        subT.left = insertAVL(newN, subT.left);
        if((getFE(subT.left)-getFE(subT.right))==2){
          if(newN.data.costo<subT.left.data.costo){
             newF = leftRotation(subT); 
          }else{
             newF = doubleLeftRotation(subT);
          }
        }    
      }
    }
    else if(newN.data.costo>subT.data.costo){
      if(subT.right == null){
        subT.right = newN;
      }else{
        subT.right = insertAVL(newN, subT.right);
        if((getFE(subT.right)-getFE(subT.left))==2){
          if(newN.data.costo>subT.right.data.costo){
             newF = rightRotation(subT); 
          }else{
             newF = doubleRightRotation(subT);
          }
        }    
      }
    }else{
      
    }
    if((subT.left==null)&&(subT.right != null)){
      subT.fe = subT.right.fe + 1;
    }else if((subT.right==null)&&(subT.left != null)){
      subT.fe = subT.left.fe + 1;
    }else{
      subT.fe = Math.max(getFE(subT.left),getFE(subT.right))+1;
    }
    
    return newF;
  }
  public void traverseAVL() {
        //System.out.print("The tree is:");
        if(root != null) {
            traverse(root);
        }else {
            System.out.print(" " + "Empty");
        }
        System.out.println();
    }

    private void traverse(Node<Producto> ptr) {
        if(ptr.left != null){
            traverse(ptr.left);
        }
        (ptr.data).displayProducto(50, 350+(550*contadorAVL) + (int)scroll*20);
        contadorAVL+=1;
        if(ptr.right != null) {
            traverse(ptr.right);
        }
    }

    public void invtraverseAVL() {
        //System.out.print("The tree is:");
        if(root != null) {
            invtraverse(root);
        }else {
            System.out.print(" " + "Empty");
        }
        System.out.println();
    }

    private void invtraverse(Node<Producto> ptr) {
        if(ptr.right != null){
            invtraverse(ptr.right);
        }
        (ptr.data).displayProducto(50, 350+(550*contadorAVL) + (int)scroll*20);
        contadorAVL+=1;
        if(ptr.left != null) {
            invtraverse(ptr.left);
        }
    }
}
