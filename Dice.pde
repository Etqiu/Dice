Die mark;
int sum;
float spin=0;
float speed=PI/15; 
int high=0;
void setup()
{

  size(800, 800);
}
void draw()
{
  background(255);
  translate(25, 0);
  sum=0;
  int printColumm;
  float rotation = 0;

  for (printColumm= 0; printColumm<800; printColumm+=50) {
    translate(printColumm, 0);
    for (int printRow=75; printRow<800; printRow+=50) {
      translate(0, printRow);
      rotate(spin);
      mark = new Die(0, 0);
      mark.roll();
      mark.show();
      rotate(-spin);
      translate(0, -printRow);
    }
    rotation+=spin;
    translate(-printColumm, 0);
  }
    if (mousePressed == false){
      if((rotation%(PI/2))==0){
      textSize(20);
      text(sum, 420, 20);
        endLoop();
        if (sum>high) {
        high=sum;
        }
      }
    }
  spin+=speed;
  if(spin>=(PI/2)){
    spin =0;
  }
  textSize(20);
  text("sum of dice: ", 300, 20);
  text("highest score: "+high, 300, 40);
}
void mousePressed()
{
  loop();
}
void endLoop() {
  noLoop();
}
class Die //models one single dice cube
{
  int myX, myY, random, rectX, rectY;

  Die(int x, int y) //constructor
  {
    random = (int)(Math.random()*6+1);
    myX = x;
    myY = y;
    rectX= x-25;
    rectY= y-25;
  }
  void roll()
  {
    random = (int)(Math.random()*6+1);
    //System.out.println(random);
    sum+=random;
  }
  void show()
  {
    strokeWeight(1.5);
    fill(0);
    if (random == 1) {
      fill(250, 200, 200);
      rect(rectX, rectY, 50, 50, 5);
      fill(0);
      ellipse(myX, myY, 10, 10);
    }
    if (random ==2) {
      fill(240, 200, 210);
      rect(rectX, rectY, 50, 50, 5);
      fill(0);
      ellipse(myX-10, myY-10, 10, 10);
      ellipse(myX+10, myY+10, 10, 10);
    }
    if (random ==3) {
      fill(230, 200, 220);
      rect(rectX, rectY, 50, 50, 5);
      fill(0);
      ellipse(myX-13, myY-13, 10, 10);
      ellipse(myX, myY, 10, 10);
      ellipse(myX+13, myY+13, 10, 10);
    }
    if (random==4) {
      fill(220, 200, 230);
      rect(rectX, rectY, 50, 50, 5);
      fill(0);
      ellipse(myX-10, myY-10, 10, 10);
      ellipse(myX+10, myY-10, 10, 10);
      ellipse(myX-10, myY+10, 10, 10);
      ellipse(myX+10, myY+10, 10, 10);
    }
    if (random ==5) {
      fill(210, 200, 240);
      rect(rectX, rectY, 50, 50, 5);
      fill(0);
      ellipse(myX-10, myY-10, 10, 10);
      ellipse(myX+10, myY-10, 10, 10);
      ellipse(myX-10, myY+10, 10, 10);
      ellipse(myX+10, myY+10, 10, 10);
      ellipse(myX, myY, 10, 10);
    }
    if (random==6) {
      fill(200, 200, 250);
      rect(rectX, rectY, 50, 50, 5);
      fill(0);
      ellipse(myX-10, myY-10, 8, 8);
      ellipse(myX-10, myY, 8, 8);
      ellipse(myX+10, myY-10, 8, 8);
      ellipse(myX+10, myY, 8, 8);
      ellipse(myX-10, myY+10, 8, 8);
      ellipse(myX+10, myY+10, 8, 8);
    }
  }
}
