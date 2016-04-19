class MaybeSquare extends MaybeShape {

  MaybeSquare(float radius) {

    super();
    
    edges = new MaybeEdge[4];

    edges[0] = new MaybeEdge(0);
    edges[0].setStart(-radius, radius, 0);
    edges[0].setEnd(radius, radius, 0);

    edges[1] = new MaybeEdge(1);
    edges[1].setStart(radius, -radius, 0);
    edges[1].setEnd(-radius, -radius, 0);

    edges[2] = new MaybeEdge(2);
    edges[2].setStart(-radius, -radius, 0);
    edges[2].setEnd(-radius, radius, 0);

    edges[3] = new MaybeEdge(3);
    edges[3].setStart(radius, -radius, 0);
    edges[3].setEnd(radius, radius, 0);

  }
};