class CellWalker {
  PVector position;
  PVector velocity;
  float telomeres;
  float lifespan;
  float life;
  
  float divisionRate;
  color col;
  float mutationRate;
  
  
  
  CellWalker(PVector p, color col_) {
    
    //Constructor - initialization
    //Define initial location
    position = p.copy();
    velocity = new PVector(0,0);
    lifespan = random(50);
    life = 0;
    telomeres = random(10);
    
    divisionRate = 0.002;
    col = col_;
    mutationRate = 0.001;
  
  }
  
  
  
  
  
  void display() {
    
    //display as a stroke - point
    float x = position.x;
    float y = position.y;
    //Draw Cell Body
    fill(155);
    ellipse(x,y,30,20);
    
    //Draw Cell nucleus
    fill(col);
    ellipse(x,y,11,8);
    
    //Draw Cell Receptors
    stroke(0);
    //receptors depend on old mouse position
    line(x-15,y,x-20,y-5);
    line(x-15,y-5,x-20,y-7);
    line(x+15,y,x+20, y-5);
   
  }
 
  
  
  void run(){
   
    step();
    display();
   
  }
 
 
 
  boolean isDead(){
    
    if (life >= lifespan){
      return true;
    } else {
      return false;
    }
    
  }
  
  
  
  CellWalker reproduce(){
   
    //add a new CellWalker to the grid
    CellWalker c = new CellWalker(position, col);
    c.setDivisionRate(divisionRate);
    c.setLifespan(lifespan);
    c.setMutationRate(mutationRate);
    c.setTelomeres(telomeres);
    telomeres--;
    return c;
   
  }
 
 
 
  void step() {
    
    float r = random(1);
    //// A 30% of moving towards a source
    if (r < 0.3) {    
       PVector velocity = PVector.sub(source,position);
      //float ydir = (source.y-position.y);
      velocity.normalize();
      position.add(velocity);
      lifespan -= 0.4;
    } else {
      velocity = new PVector(random(-2,2),random(-2,2));
      //println(xdir);
      position.add(velocity);
     life += 0.4;
    }

    position.x = constrain(position.x, 0, width-1);
    position.y = constrain(position.y, 0, height-1);
    
  }
  
  
  
  void mutate() {
    if (mutationRate > random(1)) {
      //choose to mutate the division rate, lifespan, mutation rate, or telomeres
      lifespan = random(50);
      //divisionRate = random(0.001, 0.003);
    }
  }
  
  
  
  
  
  void setDivisionRate(float divisionRate_) {
    divisionRate = divisionRate_;
  }
  
  void setLifespan(float lifespan_) {
    lifespan = lifespan_;
  }
  
  void setMutationRate(float mutationRate_) {
    mutationRate = mutationRate_;
  }
  
  void setTelomeres(float telomeres_) {
    telomeres = telomeres_;
  }
  
  
  
  
  
}
