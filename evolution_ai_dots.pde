int WIDTH = 700;
int HEIGHT = 700;

int stepsPerGen = 1500;

PVector goal = new PVector(WIDTH/2, 10);
Population test;
Obstacles obstacles;


void setup() {
  size(700, 700);
  //fullScreen();
  
  test = new Population(1500);
  obstacles = new Obstacles();
  
}

void draw() {
  background(255);
  
  fill(255, 0, 0);
  ellipse(goal.x, goal.y, 10, 10);
  
  obstacles.draw();
  
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
