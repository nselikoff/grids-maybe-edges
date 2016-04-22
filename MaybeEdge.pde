class MaybeEdge {
  PVector start, end, head, tail;
  float tHead, tTail, tHeadPrev, tTailPrev;
  boolean tHeadOutbound, tTailOutbound, mIsVisible;
  float tailLength, speed;
  int index;

  MaybeEdge() {
    init(0);
  }

  MaybeEdge(int index) {
    init(index);
  }

  void init(int aIndex) {
    index = aIndex;
    start = new PVector();
    end = new PVector();
    head = new PVector();
    tail = new PVector();
    
    tHead = 0.0;
    tTail = 0.0;
    tailLength = 1.5;
    speed = 0.4;

    mIsVisible = true;
  }

  void setVisible(boolean visible) {
    mIsVisible = visible;
  }

  boolean isVisible() {
    return mIsVisible;
  }
  
  void setStart(float x, float y, float z) {
    start.set(x, y, z);
  }
  
  void setEnd(float x, float y, float z) {
    end.set(x, y, z);
  }
  
  void setTailLength(float aLength) {
    tailLength = aLength;
  }
  
  void setSpeed(float aSpeed) {
    speed = aSpeed;
  }

  void update() {
    if (!mIsVisible) return;

    float offsetHead = noise(frameCount * 0.1 + index) * 2 - 1;
    offsetHead *= 3;
    float offsetTail = noise(frameCount * 0.1 + index + 100) * 2 - 1;
    offsetTail *= 3;
    
    head.x = lerp(start.x, end.x, tHead) + offsetHead;
    head.y = lerp(start.y, end.y, tHead) + offsetHead;
    head.z = lerp(start.z, end.z, tHead) + offsetHead;
    tail.x = lerp(start.x, end.x, tTail) + offsetTail;
    tail.y = lerp(start.y, end.y, tTail) + offsetTail;
    tail.z = lerp(start.z, end.z, tTail) + offsetTail;
    
    tHeadPrev = tHead;
    tTailPrev = tTail;
    tHead = sin(frameCount * speed + tailLength + index * 0.5) * 0.5 + 0.5;
    tTail = sin(frameCount * speed + index * 0.5) * 0.5 + 0.5;
    tHeadOutbound = tHead > tHeadPrev;
    tTailOutbound = tTail > tTailPrev;
  }
  
  void draw() {
    if (!mIsVisible) return;

    if (tHeadOutbound != tTailOutbound) {
     if (tHeadOutbound) {
       line(head.x, head.y, head.z, start.x, start.y, start.z);
       line(start.x, start.y, start.z, tail.x, tail.y, tail.z);
     } else {
       line(head.x, head.y, head.z, end.x, end.y, end.z);
       line(end.x, end.y, end.z, tail.x, tail.y, tail.z);
     }
    } else {
      line(head.x, head.y, head.z, tail.x, tail.y, tail.z);
    }
  }
};