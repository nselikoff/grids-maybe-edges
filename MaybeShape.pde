class MaybeShape {

  MaybeEdge edges[];

  color mColor;
  float mAlpha;

  MaybeShape() {
    mColor = color(255);
    mAlpha = 255;
  }

  void update() {
    for (int i = 0; i < edges.length; i++) {
      edges[i].update();
    }    
  }

  void draw() {
    stroke(mColor, mAlpha);
    for (int i = 0; i < edges.length; i++) {
      edges[i].draw();
    }    
  }

  void setVisible(boolean visible) {
    for (int i = 0; i < edges.length; i++) {
      edges[i].setVisible(visible);
    }
  }

  void setAlpha(float alpha) {
    mAlpha = alpha;
  }

};