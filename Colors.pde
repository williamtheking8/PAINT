
PImage Orange;
boolean OrangeOn;



color sky   = #15C2FF;
color grass  = #27B92D;
color deep =  #0215D8;
color sun = #F0A605;
color night = #26065A;
color cloud = #E1E1E8;

// Variable for select
color selectedColor;

float sliderX, thick, OrangeSize;

PFont New;
  
void setup() {
  Orange = loadImage("Orange.png");
  OrangeOn = false;
  New = loadFont("BookmanOldStyle-48.vlw");
  
  
  size(900, 900);
  strokeWeight(10);
  stroke(150);
  selectedColor = grass;
  sliderX = 450;
  thick = 10;
  background(0);
}
void draw() {


  thick = map(sliderX, 300, 600, 0, 50);

  strokeWeight(10);
  
  
 
  
  
// Tool Bar
  stroke(selectedColor);
  fill(255);
  rect(0, 675, 900, 225);
  
   // Orange Button
  tactileR(800,800,100,100);
  if (OrangeOn == true) {
    stroke(255,0,0);
    fill(255,255,0);
  }
  rect(800,800,100,100);
  image(Orange,800,800,100,100);

  // COLORS -------------------------------------------------------------------
  tactileC(110, 790, 30);
  fill(sun);
  circle(110, 790, 60);


  tactileC(110, 860, 30);
  fill(sky);
  circle(110, 860, 60);

  tactileC(180, 860, 30);
  fill(deep);
  circle(180, 860, 60);

  tactileC(40, 790, 30);
  fill(grass);
  circle(40, 790, 60);

  tactileC(40, 860, 30);
  fill(cloud);
  circle(40, 860, 60);

  tactileC(40, 720, 30);
  fill(night);
  circle(40, 720, 60);
    // COLORS END -------------------------------------------------------------
  
  //SLIDER
  line(300, 720, 600, 720);
  tactileC(sliderX, 720, 50);
  fill(255);
  circle(sliderX, 720, 50);
  
  //INDICATOR LINE
  strokeWeight(thick);
  stroke(selectedColor);
  line(300,820,600,820);
  
  // NEW
  fill(255);
  stroke(0);
  strokeWeight(5);
  tactileR(700,700,125,75);
  rect(700,700,125,75);
  fill(0);
  
  textFont(New);
  textSize(40);
  text("NEW",718,750);
}



void mouseDragged() { // #####################################################
  if (OrangeOn == false){
    
    if(mouseY > 675) {
    noStroke();
    } else {
    
      stroke(selectedColor);
      strokeWeight(thick);
    }
    line(pmouseX, pmouseY,mouseX,mouseY);
    
  } else if(mouseY < 675) {
    image(Orange,mouseX-40,mouseY-50,sliderX/5,sliderX/5);
  }

  controlSlider();
  
}          // ################################################################









void tactileR(int x, int y, int w, int h) { // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    fill(255,255,0);
    
  }
  
} // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

void tactileC(float x, int y, int r) {   ////////////////////////////////////////
  if (dist(x, y, mouseX, mouseY) < r) {
    stroke(50, 100, 125);
  } else stroke(0);
} ///////// END OF TACTILE /////////////////////////////////////////////////////


void mousePressed(){  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++
  if (OrangeOn == false){
    stroke(selectedColor);
    line(mouseX,mouseY,mouseX,mouseY);
    
    
  }else  {
    image(Orange,mouseX-40,mouseY-50,sliderX/5,sliderX/5);
    
    
  }
  
  
  
  
  
}
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



void mouseReleased() { // - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (mouseX > 800 && mouseX < 900 && mouseY > 800 && mouseY < 900) {
    OrangeOn = !OrangeOn;
    
  }
  
  if (mouseX > 700 && mouseX < 825 && mouseY > 700 && mouseY < 775) {
    background(0);
    
  }
  
  
  if (dist(110, 790, mouseX, mouseY) < 30) {
    selectedColor = sun;
  }

  if (dist(110, 860, mouseX, mouseY) < 30) {
    selectedColor = sky;
  }
  if (dist(180, 860, mouseX, mouseY) < 30) {
    selectedColor = deep;
  }
  if (dist(40, 790, mouseX, mouseY) < 30) {
    selectedColor = grass;
  }
  if (dist(40, 860, mouseX, mouseY) < 30) {
    selectedColor = cloud;
  }
  if (dist(40, 720, mouseX, mouseY) < 30) {
    selectedColor = night;
  }
  controlSlider();
  
} // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


void controlSlider() {    // ***************************************************
  if (mouseX > 300 && mouseX < 600 && mouseY < 745 && mouseY > 695 ) {
    sliderX = mouseX;
  }
} // ****************************************************************************
