class MaybeTriangle extends MaybeShape {

  MaybeTriangle(float radius) {

    super();

    edges = new MaybeEdge[3];

    edges[0] = new MaybeEdge(0);
    edges[0].setStart(-radius, radius, -radius);
    edges[0].setEnd(radius, radius, radius);

    edges[1] = new MaybeEdge(1);
    edges[1].setStart(radius, radius, radius);
    edges[1].setEnd(-radius, -radius, radius);

    edges[2] = new MaybeEdge(2);
    edges[2].setStart(-radius, -radius, radius);
    edges[2].setEnd(-radius, radius, -radius);

  }
};