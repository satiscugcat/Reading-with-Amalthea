// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

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
    const xChoice = floor(random(4));
    const yChoice=floor(random(4));

    switch (xChoice) {
        case 0:
            this.x--;
            break;
        case 1:
            break;
        case 2:
        case 3:
            this.x++;
            break;

        default:
            break;
    }

    switch (yChoice) {
        case 0:
            this.y--;
            break;
        case 1:
            break;
        case 2:
        case 3:
            this.y++;
            break;

        default:
            break;
    }
    

 }  
}