const Origin = 0;
let width2, height2;
let force;
let space;
let travel;
function preload(){
  space = loadImage("assets/Space2_1.png");
  travel = loadImage("assets/SpaceTravel.png");
}

function setup() {
  createCanvas(1920, 1080);
  frameRate(60);
  noStroke();
  width2 = width / 2;
  height2 = height / 2;
  let startX = width2, startY = height2;
  let speedX = 0, speedY = speedX;
  let accX = random(-3, 3);
  let accY = random(-3, 3);
  let location = new createVector(startX, startY);
  let velocity = new createVector(speedX, speedY);
  let acceleration = new createVector(accX, accY);
  let radius = 5.0;
  setupForce(location, velocity, acceleration, radius);

}

function draw(){
  const backColor = color(0, 0, 0, 50);
  backPaint(backColor ,space);
  renderForce();

}

let backPaint = (backColor,img) => {
  background(backColor);
  image(img, Origin, Origin);
}

let setupForce = (location, velocity, acceleration, radius) => {
  force = new Force(location, velocity, acceleration, radius);
}

let renderForce = () => {
  force.stepCalc();
  let col = color(0, 255, 127, 50);
  force.drawForce(travel ,col);
}

class Force {
  constructor(location, velocity, acceleration, radius) {
    this.location = location;
    this.velocity = velocity;
    this.acceleration = acceleration;
    this.radius = radius;
  }

  stepCalc(){
    let init = 0;
    this.velocity.add(this.acceleration);
    this.location.add(this.velocity);
    this.acceleration = new createVector(init, init);

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

  drawForce(travelData, partColor){
    fill(partColor);
    circle(this.location.x, this.location.y, this.radius);
    image(travelData, this.location.x, this.location.y);
  }

}


