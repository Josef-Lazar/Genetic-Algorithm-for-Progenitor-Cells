class StemCell extends CellWalker {
  
  float symprob;
  
  StemCell(PVector p, color col) {
    
    super(p, col);
    symprob = 0.1; 
    lifespan = 255;
    telomeres = 255;
    
  }
  
  
  
  
  
  CellWalker reproduce() {
    
    if (random(1) < symprob) {
      CellWalker sc = new StemCell(position, col);
      sc.setDivisionRate(divisionRate);
      sc.setLifespan(lifespan);
      sc.setMutationRate(mutationRate);
      sc.setTelomeres(telomeres);
      telomeres--;
      return sc;
    }
    else {
      CellWalker cw = new CellWalker(position, col);
      cw.setDivisionRate(divisionRate);
      cw.setLifespan(lifespan);
      cw.setMutationRate(mutationRate);
      cw.setTelomeres(telomeres);
      telomeres--;
      return cw;
    }
    
  }
  
  
  
  
  
}
