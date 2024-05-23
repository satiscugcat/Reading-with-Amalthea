let walker;
const maxStepSize=10;
function setup() {
  createCanvas(640, 240); // creating canvas of size 640 x 240
  walker = new Walker(); // creating an instance/object of class Walker
  background(255);
}

function draw() {
  walker.step();
  walker.show();
}

class Walker {
  constructor() {
    this.time=0;
    this.x=width/2;
    this.y=height/2;
  }

  step() {
    
    let step = map(noise(this.time), 0, 1, 0, maxStepSize);
    this.x+=random([-1,0,1])*step;
    this.y+=random([-1,0,1])*step;
    this.time+=0.01
  }

  show() {
    strokeWeight(2);
    fill(127);
    stroke(0);
    circle(this.x, this.y, 48);
  }
}
