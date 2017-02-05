/* -----------------------------------------------------------------------------
DotSystem class
Holds a 2D grid of dots, and creates patterns in them.
----------------------------------------------------------------------------- */

class DotSystem {
  Dot[][] dots;
  int dotsAcross;
  int dotsDown;
  
  /* -----------------------------------------------------------------------------
  Innit
  ----------------------------------------------------------------------------- */
  DotSystem(float gridSize) {
    createBlankGrid(gridSize);
  }
  
  void createBlankGrid(float gridSize) {
    dotsAcross = floor((width-25)/gridSize);
    dotsDown = floor((height-25)/gridSize);
    dots = new Dot[dotsAcross][dotsDown];
    
    float xPosition, yPosition;
    float xMid = float(dotsAcross-1)/2.0;
    float yMid = float(dotsDown-1)/2.0;
    
    //make grid of dots
    for(int x = 0; x < dotsAcross; x++) {
      for(int y = 0; y < dotsDown; y++) {
        xPosition = width/2 + (float(x)-xMid)*gridSize;
        yPosition = height/2 + (float(y)-yMid)*gridSize;
        Dot dot = new Dot(xPosition, yPosition, gridSize*0.5);

        dots[x][y] = dot;
      }
    }
    
  }
  
  /* -----------------------------------------------------------------------------
  Create dot patterns
  ----------------------------------------------------------------------------- */
  void setCircle() {
    for(int x = 0; x < dotsAcross; x++) {
      for(int y = 0; y < dotsDown; y++) {
        //check if dot is in a circle
        if( pow((dots[x][y].position.x-(width/2)),2) +
          pow((dots[x][y].position.y-(height/2)),2) < pow(350,2)) {
          dots[x][y].filled = true;
        }
      }
    }
  }
  
  void setMandelBrot() {
    for(int x = 0; x < dotsAcross; x++) {
      for(int y = 0; y < dotsDown; y++) {
        float zReal = 0;
        float zImaginary = 0;
        int iteration = 0;
        int maxIteration = 1000;
        
        float scaledX = (dots[x][y].position.x-width/2) * (2.0/height) - 0.5;
        float scaledY = (dots[x][y].position.y-height/2) * (2.0/height);
        
        //use escape time algorithm
        //pseudocode available on wikipedia
        while(zReal*zReal + zImaginary*zImaginary < 2*2 && iteration <= maxIteration) {
          float zRealTemp = zReal*zReal - zImaginary*zImaginary + scaledX;
          zImaginary = 2*zReal*zImaginary + scaledY;
          zReal = zRealTemp;
          iteration ++;
        }
        
        if((iteration >= 1000) ||
          (iteration >= 8 && iteration <= 11) ) {
          dots[x][y].filled = true;
        }
      }
    }
  }
  
  /* -----------------------------------------------------------------------------
  Display
  ----------------------------------------------------------------------------- */
  void display() {
    for(int x = 0; x < dotsAcross; x++) {
      for(int y = 0; y < dotsDown; y++) {
        dots[x][y].display();
      }
    }
  }
}