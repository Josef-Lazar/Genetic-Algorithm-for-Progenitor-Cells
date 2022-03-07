class Tumor {
  
  ArrayList<CellWalker> cellWalkers;
  PVector origin;
  
  Tumor(PVector position) {
    
    origin = position.copy();
    cellWalkers = new ArrayList<CellWalker>();
    
  }
  
  
  
  boolean isPSDead() {
    
    if (cellWalkers.size() < 1) {
      return true;
    } else {
      return false;
    }
    
  }
  
  
  
  void run() {
    
    if (cellWalkers.size() > 0) {
      for (int c = cellWalkers.size() - 1; c >= 0; c--) {
        cellWalkers.get(c).run();
        if (cellWalkers.get(c).telomeres > 0 && random(1) < cellWalkers.get(c).divisionRate) {
          cellWalkers.add(cellWalkers.get(c).reproduce());
        }
        if (cellWalkers.get(c).isDead()) {
          cellWalkers.remove(c);
        }
      }
    }
    
  }
  
  
  
  
  
}
