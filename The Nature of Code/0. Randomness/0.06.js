

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
    let step = 10;
    let stepx = quadraticRandom(step);
    let stepy = quadraticRandom(step);
    this.x += stepx;
    this.y += stepy;
  }  
}

function quadraticRandom(step) {
    while(true){
        let r1= random(step);
        let sign=random([-1,1]);
        let probability=r1*r1/100;
        let r2 = random(step);

        if(r2<probability){
            return sign*r1;
        }
    }
}
