int WIDTH = 700;
int HEIGHT = 700;

PVector goal = new PVector(WIDTH/2, 10);
Population test;
Obstacles obs;


void setup() {
  size(700, 700);
  //fullScreen();
  
  test = new Population(1000);
  obs = new Obstacles();
  
}

void draw() {
  background(255);
  
  fill(255, 0, 0);
  ellipse(goal.x, goal.y, 10, 10);
  
  obs.draw();
  
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
