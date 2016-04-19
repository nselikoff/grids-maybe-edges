class MaybeLineSegment extends MaybeShape {

  MaybeLineSegment(float radius) {

    super();

    edges = new MaybeEdge[1];

    edges[0] = new MaybeEdge(0);
    edges[0].setStart(-radius, 0, 0);
    edges[0].setEnd(radius, 0, 0);
  }
};