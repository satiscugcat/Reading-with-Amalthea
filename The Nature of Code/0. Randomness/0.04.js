let pb;

function setup(){
    createCanvas(640, 240);
    background(255);
    pb=new paintBrush();

    slider = createSlider(0, 100);
    slider.position(10, 10);
    slider.size(80);
}


function draw(){
    pb.setPos();
    pb.show();
}


class paintBrush{
    constructor(){
        this.x=width/2;
        this.y=height/2;
    }

    show(){
        noStroke();
        fill(floor(random(256)),floor(random(256)),floor(random(256)),50); // I'll let the colour generation remain a challenge
        circle(this.x, this.y, 16);
    }

    setPos(){
        const radius = Math.abs(randomGaussian(0,slider.value()));
        const angle = random(0,2*Math.PI);

        this.x=width/2+radius*Math.cos(angle);
        this.y=height/2+radius*Math.sin(angle);
    }
}