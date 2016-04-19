class MaybeCube extends MaybeShape {

  MaybeCube(float radius) {

    super();

    edges = new MaybeEdge[12];

    edges[0] = new MaybeEdge(0);
    edges[0].setStart(-radius, radius, radius);
    edges[0].setEnd(radius, radius, radius);

    edges[1] = new MaybeEdge(1);
    edges[1].setStart(radius, radius, -radius);
    edges[1].setEnd(-radius, radius, -radius);

    edges[2] = new MaybeEdge(2);
    edges[2].setStart(radius, radius, radius);
    edges[2].setEnd(radius, radius, -radius);

    edges[3] = new MaybeEdge(3);
    edges[3].setStart(-radius, radius, -radius);
    edges[3].setEnd(-radius, radius, radius);

    edges[4] = new MaybeEdge(4);
    edges[4].setStart(radius, -radius, radius);
    edges[4].setEnd(-radius, -radius, radius);

    edges[5] = new MaybeEdge(5);
    edges[5].setStart(-radius, -radius, -radius);
    edges[5].setEnd(radius, -radius, -radius);

    edges[6] = new MaybeEdge(6);
    edges[6].setStart(radius, -radius, -radius);
    edges[6].setEnd(radius, -radius, radius);

    edges[7] = new MaybeEdge(7);
    edges[7].setStart(-radius, -radius, radius);
    edges[7].setEnd(-radius, -radius, -radius);

    edges[8] = new MaybeEdge(8);
    edges[8].setStart(-radius, -radius, -radius);
    edges[8].setEnd(-radius, radius, -radius);

    edges[9] = new MaybeEdge(9);
    edges[9].setStart(-radius, -radius, radius);
    edges[9].setEnd(-radius, radius, radius);

    edges[10] = new MaybeEdge(10);
    edges[10].setStart(radius, -radius, radius);
    edges[10].setEnd(radius, radius, radius);

    edges[11] = new MaybeEdge(11);
    edges[11].setStart(radius, -radius, -radius);
    edges[11].setEnd(radius, radius, -radius);

  }

};