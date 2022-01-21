import java.awt.Robot;

boolean wkey, akey, skey, dkey;
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, upX, upY, upZ;
float leftRightHeadAngle, upDownHeadAngle;
float rotx, roty;

//color pallette
color black= #000000;
color white= #FFFFFF;
color dullBlue= #7092BE;

Robot rbt;

PImage map;
int gridSize;


//textures
PImage mossyStone;
PImage oak;

void setup () {
  size (displayWidth, displayHeight, P3D);
  textureMode (NORMAL);
  wkey= akey= skey=dkey= false;
  eyeX= width/2;
  eyeY= 8.5*height/10;
  eyeZ= height;
  focusX= width/2;
  focusY= height/2;
  focusZ=10;
  upX= 0;
  upY=1;
  upZ=0;
  leftRightHeadAngle=radians (270);

  //map
  map=loadImage ("MicrosoftTeams-image (1).png");
  gridSize=100;
  mossyStone= loadImage ("MicrosoftTeams-image (1) copy.png");
  oak= loadImage ("MicrosoftTeams-image (1) copy 2.png");
  textureMode (NORMAL);

  // noCursor ();
  try {
    rbt= new Robot ();
  }
  catch (Exception e ) {
    e.printStackTrace();
  }
}


void draw () {
  background (0);
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, upX, upY, upZ);
  pointLight (255, 255, 255, eyeX, eyeY, eyeZ);
  drawFloor();
  //drawFloors();
  drawFocalPoint ();
  controlCamera();
  drawMap ();
}


void drawFloor () {
  background (0);
  stroke (255);
  for (int x= -2000; x<= 2000; x= x+100) {
    //line (x, height, -2000, x, height, 2000);
    //line (-2000, height, x, 2000, height, x);
    //line (x, height-gridSize*3, -2000, x, height-gridSize*3, 2000);
    //line (-2000, height-gridSize*3, x, 2000, height-gridSize*3, x);
 
   
    //texturedCube(x*gridSize-2000, height-gridSize*6, x*gridSize-2000, oak, gridSize*6);
    //}
  }
}
//for (int x= -2000; x <= 2000; x= x+100) {
//  line (x, height, -2000, x, height, 2000);
//  line (-2000, height, x, 2000, height, x);



//void drawFloors () {
//  background (0);
//  stroke (255);
//  for (int x= 2000; x>= 6000; x= x+100) {
//    line (x, height-gridSize*3, -2000, x, height-gridSize*3, 6000);
//    line (2000, height-gridSize*3, x, 6000, height-gridSize*3, x);



//    //for (int x= -2000; x <= 2000; x= x+100) {
//    //  line (x, height, -2000, x, height, 2000);
//    //  line (-2000, height, x, 2000, height, x);
//  }
//}

void drawFocalPoint () {
  pushMatrix ();
  translate (focusX, focusY, focusZ);
  sphere(5);
  popMatrix();
}

void controlCamera () {
  //camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, upX, upY, upZ);
  if (wkey) {
    eyeX= eyeX+ cos(leftRightHeadAngle) *10;
    eyeZ= eyeZ +sin (leftRightHeadAngle) *10;
  }
  if (skey) {
    eyeX= eyeX-cos(leftRightHeadAngle) *10;
    eyeZ= eyeZ-  sin (leftRightHeadAngle) *10;
  }
  if (akey) {

    eyeX= eyeX+ cos(leftRightHeadAngle + PI/2) *10;
    eyeZ= eyeZ-10 + sin (leftRightHeadAngle+ PI/2) *10;
  }
  if (dkey) {

    eyeX= eyeX+ cos(leftRightHeadAngle - PI/2) *10;
    eyeZ= eyeZ-10 + sin (leftRightHeadAngle- PI/2) *10;
  }
  leftRightHeadAngle = leftRightHeadAngle + (mouseX - pmouseX) * 0.01;
  upDownHeadAngle= upDownHeadAngle + (mouseY- pmouseY) *0.01;
  if (upDownHeadAngle > PI/2.5) upDownHeadAngle= PI/2.5;
  if (upDownHeadAngle < -PI/2.5) upDownHeadAngle= -PI/2.5;

  focusX= eyeX+ cos(leftRightHeadAngle)*300;
  focusZ = eyeZ+ sin (leftRightHeadAngle) *300;
  focusY= eyeY + tan(upDownHeadAngle) *300;


  if (mouseX > width-2) rbt.mouseMove (3, mouseY);
  else if (mouseX < 2) rbt.mouseMove (width-3, mouseY);
}


void drawMap () {
  for (int x= 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get (x, y);
      if (c== dullBlue ) {
        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, mossyStone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, mossyStone, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, mossyStone, gridSize);
      } else if (c== black) {
        texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, oak, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, oak, gridSize);
        texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, oak, gridSize);
    }
     
     //floor
         texturedCube(x*gridSize-2000, height-gridSize*-0.01, y*gridSize-2000, oak, gridSize);
         texturedCube(x*gridSize-2000, height-gridSize*4, y*gridSize-2000, oak, gridSize);
      //  texturedCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, oak, gridSize);
      //  texturedCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, oak, gridSize);
      //  texturedCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, oak, gridSize);
        //pushMatrix ();
        //fill (c);
        //stroke (100);
        //translate ( x*gridSize-2000, height/2, y*gridSize-2000);
        //box (gridSize, height, gridSize);
        //popMatrix () ;
      
    }
  }
}








void keyPressed () {

  if (key == 'W' || key == 'w') wkey= true;
  if (key == 'A' || key == 'a') akey= true;
  if (key == 'D' || key =='d') dkey= true;
  if (key == 'S' || key =='s') skey= true;
}



void keyReleased() {
  if (key == 'W' || key == 'w') wkey= false;
  if (key == 'A' || key == 'a') akey= false;
  if (key == 'D' || key =='d') dkey= false;
  if (key == 'S' || key =='s') skey= false;
}
