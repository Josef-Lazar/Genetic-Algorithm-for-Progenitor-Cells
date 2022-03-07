/**
 * Josef Lazar
 * 11/22/2021
 * CMSC 210
 * Genetic_Algorithm_for_Progenitor_Cells
 * Collaboration Statement: I used my Life_Death_and_Turmors homework code as a template.
 */




Tumor c;
PVector source;
 

void setup() {
  
  size(640,360);
  background(155);
  c = new Tumor(new PVector(width, height));
  source = new PVector(40,60);
  
  int stemCells = 10; //set this variable to how many stem cells the tumor should start with
  for (int i = 0; i < stemCells; i++) {
    c.cellWalkers.add(new StemCell(new PVector(width, height), colorSpectrum(i * 23)));
    
    //choose to set the division rate, lifespan, mutation rate, or telomeres of the cells
    c.cellWalkers.get(i).setLifespan(100 + i*25);
    //c.cellWalkers.get(i).setDivisionRate(0.003 - 0.0002 * i);
  }
  
}



void draw() {
  
  if (frameCount < 1000) {
    // Run the walker object
    background(255);
    c.run();
    //draw source
    fill(150,0,0); 
    ellipse(source.x,source.y,40,40);
  }
    
}



color colorSpectrum(int position) {
  
  int r;
  int g;
  int b;
  
  if (position < 128) {
    r = (int)map(position, 0, 128, 255, 0);
  } else {
    r = (int)map(position, 128, 255, 0, 255);
  }
  
  if (position < 85) {
    g = (int)map(position, 0, 85, 85, 255);
  } else if (position < 213) {
    g = (int)map(position, 85, 213, 255, 0);
  } else {
    g = (int)map(position, 213, 255, 0, 85);
  }
  
  if (position < 43) {
    b = (int)map(position, 0, 43, 85, 0);
  } else if (position < 170) {
    b = (int)map(position, 43, 170, 0, 255);
  } else {
    b = (int)map(position, 170, 255, 255, 85);
  }
  
  return color(r, g, b);
  
}
