void checkP0() {
  if (mouseX<738&&mouseX>378) {
    if (mouseY<460&&mouseY>395) {
      image(p0hb, 0, 0, width, height);
    }
    if (mouseY<553&&mouseY>490) {
      image(p0sb, 0, 0, width, height);
    }
    if (mouseY<643&&mouseY>581) {
      image(p0eb, 0, 0, width, height);
    }
  }
}

void checkP1() {
  if (mouseX<975&&mouseX>757&&mouseY>54&&mouseY<91) {
    image(p1bb, 0, 2, width, height);
  }
}


void checkP3() {
  if (mouseY<605&&mouseY>557) {
    if (mouseX<803&&mouseX>575) {
      image(p3eb, 0, 0, width, height);
    }
  }
}

