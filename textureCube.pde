void texturedCube (float x, float y, float z, PImage texture, float size ) {

  pushMatrix ();
  translate (x, y, z);
  scale (size);
  

  noStroke ();

  beginShape (QUADS);
  texture (texture);

  //top
  //x, y, z, texturex, texturey
  vertex(0, 0, 0, 0, 0 );
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);




  //bottom
  vertex(0, 1, 0, 0, 0 );
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);



  //front 1
  vertex (0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);



  //back
  vertex (0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);


  //left
  vertex (0, 0, 0, 0, 0);
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);
  //right
  vertex (1, 0, 0, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(1, 1, 0, 0, 1);
  endShape();
  popMatrix ();
}


void texturedCube (float x, float y, float z, PImage top, PImage side, PImage bottom, float size ) {

  pushMatrix ();
  translate (x, y, z);
  scale (size);
  rotateX(rotx);
  rotateY(roty);

  noStroke ();

  beginShape (QUADS);
  texture (top);

  //top
  //x, y, z, texturex, texturey
  vertex(0, 0, 0, 0, 0 );
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);
  endShape ();

  beginShape(QUADS);
  texture(bottom);


  //bottom
  vertex(0, 1, 0, 0, 0 );
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  endShape ();
  beginShape (QUADS);
  texture (side);


  //front
  vertex (0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);



  //back
  vertex (0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);


  //left
  vertex (0, 0, 0, 0, 0);
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);
  //right
  vertex (1, 0, 0, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(1, 1, 0, 0, 1);
  endShape();
  popMatrix ();
}


//void mouseDragged () {

//  rotx= rotx+ (pmouseY - mouseY ) *0.01;
//  roty= roty+ (pmouseX-mouseX) * -0.01;
//}
