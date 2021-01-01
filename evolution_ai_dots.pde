Population test;
PVector goal = new PVector(300, 10);


void setup() {
  size(700, 700);
  test = new Population(1000);
  
}


void draw() {
  background(255);
  
  fill(255, 0, 0);
  ellipse(goal.x, goal.y, 10, 10);
  
  if(test.allDotsDead()) {
    
    // Genetic algorithm
    
    test.calculateFitness();
    test.naturalSelection();
    test.mutateBabies();
    
  } else {
    
    test.update();
    test.show();
    
  }
}
