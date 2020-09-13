class Force {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float radius;
  Force(PVector location, PVector velocity, PVector acceleration,float radius) {
    this.location = location;
    this.velocity = velocity;
    this.acceleration = acceleration;
    this.radius = radius;
  }

  void stepCalc(){
    float init = 0;
    this.velocity.add(this.acceleration);
    this.location.add(this.velocity);
    this.acceleration = new PVector(init, init);

    if(this.location.x < init){
      this.location.x = width;
    }

    if(this.location.x > width){
      this.location.x = init;
    }

    if(this.location.y < init){
      this.location.y = height;
    }

    if(this.location.y > height){
      this.location.y = init;
    }
  }

  void drawForce(PImage travelData, color partColor){
    fill(partColor);
    circle(this.location.x, this.location.y, this.radius);
    image(travelData, this.location.x, this.location.y);
  }

}
