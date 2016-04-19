import peasy.*;
import codeanticode.syphon.*;
import de.looksgood.ani.*;
import oscP5.*;
import netP5.*;

SyphonServer server;

PeasyCam cam;

OscP5 oscP5;
NetAddress myBroadcastLocation; 

MaybeShape maybeShapes[];

float targetRotateX, targetRotateY, targetRotateZ;
float camDistance;

//int screenWidth = 1280, screenHeight = 289;
int screenWidth = 1920, screenHeight = 434;

void settings() {
  size(screenWidth, screenHeight, P3D);
  PJOGL.profile=1; // OpenGL 1.2 / 2.x context, for Syphon compatibility
}

void setup() {
  server = new SyphonServer(this, "sketch_maybe_edges");

  frameRate(60);

  oscP5 = new OscP5(this,12000);

  Ani.init(this);  

  camDistance = 1000;
  cam = new PeasyCam(this, camDistance);

  maybeShapes = new MaybeShape[5];
  maybeShapes[0] = new MaybeLineSegment(100);
  maybeShapes[1] = new MaybeTriangle(100);
  maybeShapes[2] = new MaybeSquare(100);
  maybeShapes[3] = new MaybeCube(100);
  maybeShapes[4] = new MaybeTetrahedron(100);

  targetRotateX = targetRotateY = targetRotateZ = 0;
}

void update() {

  cam.setRotations(targetRotateX, targetRotateY, targetRotateZ);

  for (int i = 0; i < maybeShapes.length; i++) {
    maybeShapes[i].update();
  }

  if (frameCount % 60 == 0) {
    println(frameRate);
  }
}

void draw() {

  update();

  //background(0);
  cam.beginHUD();
  fill(0, 8);
  noStroke();
  rect(0, 0, width, height);
  cam.endHUD();
  
  stroke(255);
  strokeWeight(1);

  for (int i = 0; i < maybeShapes.length; i++) {
    maybeShapes[i].draw();
  }

  server.sendScreen();
}

void keyPressed(KeyEvent e) {
  // randomizeRotation();
}

void randomizeRotation() {
  Ani.to(this, 2.0, "targetRotateX", random(0, PI));
  Ani.to(this, 2.0, "targetRotateY", random(0, PI));
  Ani.to(this, 2.0, "targetRotateZ", random(0, PI));
}

void resetRotation() {
  Ani.to(this, 2.0, "targetRotateX", 0);
  Ani.to(this, 2.0, "targetRotateY", 0);
  Ani.to(this, 2.0, "targetRotateZ", 0);
}

void oscEvent(OscMessage theOscMessage) {
  String addr = theOscMessage.addrPattern();
  String typetag = theOscMessage.typetag();
  float floatVal = 0;
  boolean boolVal = false;
  
  if (typetag.equals("f"))
    floatVal = theOscMessage.get(0).floatValue();
  else if (typetag.equals("b"))
    boolVal = theOscMessage.get(0).booleanValue();
  
  if (addr.equals("/FromVDMX/Slider1")) {
  }
  else if (addr.equals("/FromVDMX/Slider2")) {
    maybeShapes[0].setAlpha(map(floatVal, 0, 1, 0, 255));
  }
  else if (addr.equals("/FromVDMX/Slider3")) {
    maybeShapes[1].setAlpha(map(floatVal, 0, 1, 0, 255));
  }
  else if (addr.equals("/FromVDMX/Slider4")) {
    maybeShapes[2].setAlpha(map(floatVal, 0, 1, 0, 255));
  }
  else if (addr.equals("/FromVDMX/Slider5")) {
    maybeShapes[3].setAlpha(map(floatVal, 0, 1, 0, 255));
  }
  else if (addr.equals("/FromVDMX/Slider6")) {
    maybeShapes[4].setAlpha(map(floatVal, 0, 1, 0, 255));
  }
  else if (addr.equals("/FromVDMX/Slider7")) {
    camDistance = map(floatVal, 0, 1, 100, 1000);
    cam.setDistance(camDistance);
  }
  else if (addr.equals("/FromVDMX/Slider8")) {
  }
  else if (addr.equals("/FromVDMX/S1")) {
  }
  else if (addr.equals("/FromVDMX/M1")) {
    randomizeRotation();
  }
  else if (addr.equals("/FromVDMX/R1")) {
    resetRotation();
  }

  // theOscMessage.print();
}
