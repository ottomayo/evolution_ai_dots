int WIDTH = 700;
int HEIGHT = 700;

Population test;


void setup() {
  size(700, 700);
  //fullScreen();
  test = new Population(1000);
  
}


PVector goal = new PVector(WIDTH/2, 10);


void draw() {
  background(255);
  
  fill(255, 0, 0);
  ellipse(goal.x, goal.y, 10, 10);
  
  fill(0,0,255);
  
  rect(0, 200, 500, 10);
  rect(200, 400, 500, 10);
  
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
