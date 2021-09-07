public class BinarySearchTree {
    private Node<Producto> root;
    int contadorBST = 0;
    public BinarySearchTree() {
        root = null;
    }
    public void insertBST(Producto pr) {
        root = insert(pr,root);
        
    }
    private Node<Producto> insert(Producto pr, Node<Producto> p) {
        if (p == null) {
            p = new Node<Producto>(pr);
        }else if (pr.costo < (Integer) p.data.costo) {
            p.left = insert(pr, p.left);
        }else {
            p.right = insert(pr, p.right);
        }
        return p;
    }
    public void removeBST(int num){
        root = remove(num,root);
    }
    private Node<Producto> remove(int num, Node<Producto> p){
        if(p != null) {
            if (num < (Integer) p.data.costo) {
                p.left = remove(num, p.left);
            } else {
                if (num > (Integer) p.data.costo) {
                    p.right = remove(num, p.right);
                } else {
                    if (p.left == null && p.right == null) {
                        p = null;
                    } else {
                        if (p.left == null) {
                            p = p.right;
                        } else {
                            if (p.right == null) {
                                p = p.left;
                            } else {
                                Node<Producto> t = findMin(p.right);
                                p.data = t.data;
                                p.right = remove((Integer) p.data.costo, p.right);
                            }
                        }
                    }
                }
            }
        }
        else {
            System.out.println("Item not in tree and not removed");
        }
        return p;
    }

    private Node<Producto> findMin(Node<Producto> p) {
        if(p != null) {
            while (p.left != null) {
                p = p.left;
            }
        }
        return p;
    }

    public void traverseBST() {
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
        (ptr.data).displayProducto(50, 350+(550*contadorBST) + (int)scroll*20);
        contadorBST+=1;
        if(ptr.right != null) {
            traverse(ptr.right);
        }
    }

    public void invtraverseBST() {
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
        (ptr.data).displayProducto(50, 350+(550*contadorBST) + (int)scroll*20);
        contadorBST+=1;
        if(ptr.left != null) {
            invtraverse(ptr.left);
        }
    }
}
