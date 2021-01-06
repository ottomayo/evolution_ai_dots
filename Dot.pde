class Dot {
  PVector pos;
  PVector vel;
  PVector acc;
  Brain brain;
  
  boolean dead = false;
  float fitness = 0;
  
  boolean reachedGoal = false;
  boolean isBest = false;
  
  Dot() {
    brain = new Brain(stepsPerGen);
    
    pos = new PVector(width/2, height - 10);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    
  }
  
  // -------------------------------------------------------------------------

  void show() {
    if(isBest) {
      
      fill(0, 255, 0);
      stroke(0,0,0);
      ellipse(pos.x, pos.y, 8, 8);
      
    } else {
      
      fill(0);
      stroke(0);
      ellipse(pos.x, pos.y, 4, 4);
    }
  }
  
  
  // ------------------------------------------------------------------------
  
  void move() {
    
    // TODO: the generations are ending before all the dots die!!!!!!!!!!!!!!!!!!!!!
    
    if(brain.directions.length > brain.step) {
      acc = brain.directions[brain.step];
      brain.step += 1;
    } else {
      dead = true;
    }
    
    vel.add(acc);
    vel.limit(5);
    
    pos.add(vel);
    
  }
  
  
  // -------------------------------------------------------------------------
  
  void update() {
    if(!dead && !reachedGoal) {
      move();
      if(pos.x < 2 || pos.x > width - 2 || pos.y < 2 || pos.y > height - 2) {
        // If dot hits border kill it
        dead = true;
      } else if(dist(pos.x, pos.y, goal.x, goal.y) < 5) {
        // If reached goal
        reachedGoal = true;
        
      } else if(obstacles.colliding(pos.x, pos.y)) {
        // If hit obstacle
        dead = true;
      }
    }
  }
  
  
  // ---------------------------------------------------------------------------
  
  void calculateFitness() {
    if(reachedGoal) {
      fitness = 1.0 / 16.0 + 10000.0 / (float)(brain.step * brain.step);
      
    } else {
      float distanceToGoal = dist(pos.x, pos.y, goal.x, goal.y);
      fitness = 1.0 / (distanceToGoal * distanceToGoal);
    }
  }
  
  
  // ----------------------------------------------------------------------------
  
  Dot getBaby() {
    Dot baby = new Dot();
    baby.brain = brain.clone();
    
    return baby;

  }
  
  
}
