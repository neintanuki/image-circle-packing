class Circle {
  float x, y, r;
  boolean growing = true;
  color c;
  
  Circle(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.r = 1;
    this.c = c;
  }
  
  void grow() {
    if (growing) {
      r += 0.5;
    }
  }
  
  boolean onEdge() {
    // returns true if circle grows outside the window
    return x + r > width || x - r < 0 || y + r > height || y - r < 0;
  }
  
  void show() {
    fill(this.c);
    noStroke();
    
    this.grow();
    ellipse(this.x, this.y, r * 2, r * 2);
  }
}
