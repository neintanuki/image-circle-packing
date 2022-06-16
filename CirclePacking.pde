ArrayList<Circle> list = new ArrayList<Circle>();
PImage img;

void setup() {
  size(360, 360);
  
  // loads image
  img = loadImage("anya.jpg");
  img.loadPixels();
}

void draw() {
  background(0);
  int attempts = 0;
  
  // initial circles
  for (int i = 0; i < 10; i++) {
    addCircle();
    
    attempts++;
    if (attempts > 1000) {
      noLoop();
    }
  }
  
  // render circles
  for (Circle c : list) {
    if (c.growing) {
      if (c.onEdge()) {
        c.growing = false;
      } else {
        // check if circle is overlapping towards another circle
        for (Circle other : list) {
          if (c != other) {
            float d = dist(c.x, c.y, other.x, other.y);
            
            if (d < c.r + other.r) {
              c.growing = false;
              break;
            }
          }
        }
      }
    }
    c.show();
  }
}

void addCircle() {
  float x = random(width);
  float y = random(height);
  boolean valid = true;
  int index = int(x) + int(y) * img.width;
  color img_color = img.pixels[index];
  
  // check if position is not taken by an existing circle
  for (Circle c : list) {
    float d = dist(x, y, c.x, c.y);
    
    if (d < c.r) {
      valid = false;
      break;
    }
  }
  
  if (valid) {
    list.add(new Circle(x, y, img_color));
  }
}
