class Obstacles {
  int[] obstacle1 = {0, 200, 500, 10};
  int[] obstacle2 = {200, 400, 500, 10};
  
  int[][] obstacles = { obstacle1, obstacle2 };
  
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
  
  boolean colliding(x, y) {
    
    
    
  }
  
  
  
}
