final float Origin = 0;
float width2, height2;
Force force;
PImage space;
PImage travel;
void setup(){
  size(1920, 1080);
  frameRate(60);
  noStroke();
  space = loadImage("assets/Space2_1.png");
  travel = loadImage("assets/SpaceTravel.png");
  width2 = width / 2;
  height2 = height / 2;
  float startX = width2, startY = height2;
  float speedX = 0, speedY = speedX;
  float accX = random(-3, 3);
  float accY = random(-3, 3);
  PVector location = new PVector(startX, startY);
  PVector velocity = new PVector(speedX, speedY);
  PVector acceleration = new PVector(accX, accY);
  float radius = 5.0;
  setupForce(location, velocity, acceleration, radius);

}

void draw(){
  color backColor = color(0, 0, 0, 50);
  backPaint(backColor ,space);
  renderForce();

  saveFrame("frameData/######.png");
}

void backPaint(color backColor){
  background(backColor);
}

void backPaint(color backColor,PImage img){
  background(backColor);
  image(img, Origin, Origin);
}

void setupForce(PVector location, PVector velocity, PVector acceleration, float radius){
  force = new Force(location, velocity, acceleration, radius);
}

void renderForce(){
  force.stepCalc();
  color col = color(0, 255, 127, 50);
  force.drawForce(travel ,col);
}


