String contents [] = {
  "１チャンク露天掘り",
  "ケーキで建築",
  "ごりら",
  "はなげ",
  "きりん",
  "もんじゃ",
  "たこ焼き"
};

int rnd = int(random(1000, 5000));
int rnd2 = int(random(300, 600));
Boolean start = false;
int count = 0;
int subCount = 1;

void setup(){
  size(500, 500);
  PFont font = createFont("けいふぉんと", 20);
  textFont(font);
}

void draw(){
  if(start){
    if(count < rnd){
      if(count < rnd - rnd2){
        if(count < (rnd-rnd2)/2){
          subCount++;
        } else {
          if(subCount <= 1){
            subCount = 1;
          } else {
            subCount--;
          }
        }
        count+=subCount;
      } else {
        count++;
      }
    } else {
      start = false;
    }
  }
  background(255);
  
  strokeWeight(5);
  stroke(0);
  colorMode(HSB, 360, 100, 100);
  
  for(int i = 0; i < contents.length; i++){
    fill(360/contents.length*i, 100, 100);
    arc(width/2, height/2, width-100, height-100, radians(count + 360.0/contents.length*i), radians(count + 360.0/contents.length*(i+1)));
    
    fill(360, 0,0);
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(count + 180.0/contents.length+360.0/contents.length*i));
    text(contents[i], 10,0);
    popMatrix();
  }
  
  colorMode(RGB, 256);
  fill(0, 200, 200);
  rect(10, height-60, 110, 50);
  fill(0);
  text("スタート", 25, height-28);
  
  //text(count,0,20);
  //text(subCount,0, 40);
  //text(rnd, 0, 60);
  
  fill(255, 255, 0);
  triangle(width-60, height/2, width-20, height/2-10, width-20, height/2+10);
}

void mousePressed(){
  if(10 < mouseX && mouseX < 110 && height-60 < mouseY && mouseY < height -10){
    start = true;
  }
}
