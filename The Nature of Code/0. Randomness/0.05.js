

let walker;

function setup() {
  createCanvas(640, 240);
  walker = new Walker();
  background(255);
}

function draw() {
  walker.step();
  walker.show();
}

class Walker {
  constructor() {
    this.x = width / 2;
    this.y = height / 2;
  }

  show() {
    stroke(0);
    point(this.x, this.y);
  }

  step() {
    const xChoice = floor(random(3));
    const yChoice=floor(random(3));
    const stepSize = 0.5*randomGaussian()+1;

    switch (xChoice) {
        case 0:
            this.x-=stepSize;
            break;
        case 1:
            break;
        case 2:
            this.x+=stepSize;
            break;
    }

    switch (yChoice) {
        case 0:
            this.y-=stepSize;
            break;
        case 1:
            
            break;
        case 2:
            this.y+=stepSize;
            break;

    }
    

 }  
}