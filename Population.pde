class Population {
  Dot[] dots;
  float fitnessSum;
  
  int gen = 1;
  int bestDot = 0;
  
  Population(int size) {
    dots = new Dot[size];
    
    for(int i = 0; i < size; i++) {
      dots[i] = new Dot();
    }
  }
  
  
  // --------------------------------------------------------------------------
  
  void show() {
    for(int i = 1; i < dots.length; i++) {
      dots[i].show();
    }
    dots[0].show();
    
    // Write the generation number in the corner
    fill(0);
    stroke(0);
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
    
    setBestDot();
    newDots[0] = dots[bestDot].getBaby();
    
    newDots[0].isBest = true;
    
    for(int i = 1; i < newDots.length; i++) {
      
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
    for(int i = 1; i < dots.length; i++) {
      dots[i].brain.mutate();
    }
  }
  
  
  // ---------------------------------------------------------------------------------
  
  void setBestDot() {
    float max = 0;
    int maxIndex = 0;
    for(int i = 0; i < dots.length; i++) {
      if(dots[i].fitness > max) {
        max = dots[i].fitness;
        maxIndex = i;
      }
    }
    
    bestDot = maxIndex;
    
    
  }
  
  
}
