import peasy.*;
import codeanticode.syphon.*;

SyphonServer server;

PeasyCam cam;
MaybeEdge edges[];

//int screenWidth = 1280, screenHeight = 289;
int screenWidth = 1920, screenHeight = 434;

void settings() {
  size(screenWidth, screenHeight, P3D);
  PJOGL.profile=1; // OpenGL 1.2 / 2.x context, for Syphon compatibility
}

void setup() {
  //size(1280, 289, P3D);
  // Create syhpon server to send frames out.
  server = new SyphonServer(this, "sketch_thread_lattice");

  frameRate(60);

  cam = new PeasyCam(this, 200);

  edges = new MaybeEdge[12];

  edges[0] = new MaybeEdge(0);
  edges[0].setStart(-100, 100, 100);
  edges[0].setEnd(100, 100, 100);

  edges[1] = new MaybeEdge(1);
  edges[1].setStart(100, 100, -100);
  edges[1].setEnd(-100, 100, -100);

  edges[2] = new MaybeEdge(2);
  edges[2].setStart(100, 100, 100);
  edges[2].setEnd(100, 100, -100);

  edges[3] = new MaybeEdge(3);
  edges[3].setStart(-100, 100, -100);
  edges[3].setEnd(-100, 100, 100);

  edges[4] = new MaybeEdge(4);
  edges[4].setStart(100, -100, 100);
  edges[4].setEnd(-100, -100, 100);

  edges[5] = new MaybeEdge(5);
  edges[5].setStart(-100, -100, -100);
  edges[5].setEnd(100, -100, -100);

  edges[6] = new MaybeEdge(6);
  edges[6].setStart(100, -100, -100);
  edges[6].setEnd(100, -100, 100);

  edges[7] = new MaybeEdge(7);
  edges[7].setStart(-100, -100, 100);
  edges[7].setEnd(-100, -100, -100);

  edges[8] = new MaybeEdge(8);
  edges[8].setStart(-100, -100, -100);
  edges[8].setEnd(-100, 100, -100);

  edges[9] = new MaybeEdge(9);
  edges[9].setStart(-100, -100, 100);
  edges[9].setEnd(-100, 100, 100);

  edges[10] = new MaybeEdge(10);
  edges[10].setStart(100, -100, 100);
  edges[10].setEnd(100, 100, 100);

  edges[11] = new MaybeEdge(11);
  edges[11].setStart(100, -100, -100);
  edges[11].setEnd(100, 100, -100);
}


void draw() {

  for (int i = 0; i < edges.length; i++) {
    edges[i].update();
  }
  
  //background(0);
  cam.beginHUD();
  fill(0, 8);
  noStroke();
  rect(0, 0, width, height);
  cam.endHUD();
  
  stroke(255);
  strokeWeight(1);
  
  for (int i = 0; i < edges.length; i++) {
    edges[i].draw();
  }

  server.sendScreen();
}