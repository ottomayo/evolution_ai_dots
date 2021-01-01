class Population {
  Dot[] dots;
  float fitnessSum;
  
  int gen = 1;
  
  Population(int size) {
    dots = new Dot[size];
    
    for(int i = 0; i < size; i++) {
      dots[i] = new Dot();
    }
  }
  
  
  // --------------------------------------------------------------------------
  
  void show() {
    for(int i = 0; i < dots.length; i++) {
      dots[i].show();
    }
    
    // Write the generation number in the corner
    text("Generation: ", 20, height - 20);
    text(gen, 90, height - 20);
  }
  
  
  // -------------------------------------------------------------------------------
  
  void update() {
    for(int i = 0; i < dots.length; i++) {
      dots[i].update();
    }
    println(gen);
  }
  
  
  // -------------------------------------------------------------------------------
  
  void calculateFitness() {
    for(int i = 0; i < dots.length; i++) {
      dots[i].calculateFitness();
      
    }
  }
  
  
  // -------------------------------------------------------------------------------
  
  boolean allDotsDead() {
    for(int i = 0; i < dots.length; i++) {
      if(!dots[i].dead && !dots[i].reachedGoal) {
        return false;
      }
    }
    
    return true;
    
  }
  
  
  // -------------------------------------------------------------------------------
  
  void naturalSelection() {
    Dot[] newDots = new Dot[dots.length];
    calculateFitnessSum();
    
    for(int i = 0; i < newDots.length; i++) {
      
      // Select parent based on fitness
      Dot parent = selectParent();
      
      // Get baby from them
      newDots[i] = parent.getBaby();
      
    }
    
    dots = newDots.clone();
    
    gen ++;
    
  }
  
  
  // -------------------------------------------------------------------------------
  
  void calculateFitnessSum() {
    fitnessSum = 0;
    for(int i = 0; i < dots.length; i++) {
      fitnessSum += dots[i].fitness;      
    }
  }
  
  
  // -------------------------------------------------------------------------------
  
  Dot selectParent() {
    float rand = random(fitnessSum);
    
    float runningSum = 0;
    
    for(int i = 0; i < dots.length; i++) {
      runningSum += dots[i].fitness;
      if(runningSum > rand) {
        return dots[i];
      }
    }
    
    // Should never get to this point
    println("Should never get to this point");
    return null;
  }
  
  
  // -------------------------------------------------------------------------------

  void mutateBabies() {
    for(int i = 0; i < dots.length; i++) {
      dots[i].brain.mutate();
    }
  }
  
  
}
