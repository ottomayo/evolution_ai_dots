class Obstacles {
  
  // Every array within the obstacles array
  // should contain four integers and 
  // represent one obstacle. The numbers
  // represent { x, y, width, height }.
  
  int[][] obstacles = {
    
    // Four wall maze
    {0,   200, 500, 10}, 
    {200, 300, 500, 10},
    {0,   400, 500, 10},
    {200, 500, 500, 10},
    
    //{0,   600, 110, 10},
    //{100, 400, 10,  200},
    //{200, 400, 10,  200},
    //{200, 600, 500, 10},
    //{0,   300, 510, 10},
    //{500, 100, 10,  200},
    //{600, 100, 10,  200},
    //{600, 300, 500, 10},
    
    //{250, 670, 200, 10},
    //{250, 30,  200, 10},
    //{0,   350, 300, 10},
    //{400, 350, 300, 10}
    
  };
  
  Obstacles() {
    // Contructor method
    // So far nothing needed here
  }
  
  
  // ------------------------------------------------------------------------------------------------------
  
  void draw() {
    for(int i = 0; i < obstacles.length; i++) {
      fill(0,255,0);
      rect(obstacles[i][0], obstacles[i][1], obstacles[i][2], obstacles[i][3]);
      
    }
  }
  
  
  // -----------------------------------------------------------------------------------------------------
  
  boolean colliding(float x, float y) {
    boolean dead = false;
    
    for(int i = 0; i < obstacles.length; i++) {
      
      if(x > obstacles[i][0] && x < obstacles[i][0] + obstacles[i][2] && y > obstacles[i][1] && y < obstacles[i][1] + obstacles[i][3]) {
        
        // If hit obstacle
        dead = true;
        
      }
    }
    
    return dead;
  }
  
  
  
}
