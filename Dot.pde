/* -----------------------------------------------------------------------------
Dot class
Dot is a circle, either filled and no stroke or vice versa
----------------------------------------------------------------------------- */

class Dot {
  PVector position;
  float size;
  boolean filled;
  
  Dot(float x, float y, float size) {
    position = new PVector(x, y);
    this.size = size;
    filled = false;
  }
  
  void display() {
    if(filled) {
      fill(0);
      noStroke();
    } else {
      noFill();
      stroke(0);
      strokeWeight(1.3);
    }
    ellipseMode(CENTER);
    ellipse(position.x, position.y, size, size);
  }
}