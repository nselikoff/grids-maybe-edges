class MaybeTetrahedron extends MaybeShape {

  MaybeTetrahedron(float radius) {

    super();

    edges = new MaybeEdge[6];

    edges[0] = new MaybeEdge(0);
    edges[0].setStart(-radius, radius, -radius);
    edges[0].setEnd(radius, radius, radius);

    edges[1] = new MaybeEdge(1);
    edges[1].setStart(radius, radius, radius);
    edges[1].setEnd(-radius, -radius, radius);

    edges[2] = new MaybeEdge(2);
    edges[2].setStart(-radius, -radius, radius);
    edges[2].setEnd(radius, -radius, -radius);

    edges[3] = new MaybeEdge(3);
    edges[3].setStart(radius, -radius, -radius);
    edges[3].setEnd(-radius, radius, -radius);

    edges[4] = new MaybeEdge(4);
    edges[4].setStart(-radius, radius, -radius);
    edges[4].setEnd(-radius, -radius, radius);

    edges[5] = new MaybeEdge(5);
    edges[5].setStart(radius, -radius, -radius);
    edges[5].setEnd(radius, radius, radius);

  }
};
