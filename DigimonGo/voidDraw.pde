void draw() {
  println(mouseX,mouseY);
  if (scenario==0) {
    image(p[scenario], 0, 0, width, height);
    checkP0();
    player.play();
    time1=frameCount;
  }
  if (scenario==1) {
    image(p[scenario], 0, 0, width, height);
    checkP1();
    time1=frameCount;
    player.play();
  }
  if (scenario==2) {
    image(p[scenario], 0, 0, width, height);
    gamestart();
  }
  if (scenario==3) {
    image(p[scenario], 0, 0, width, height);
    checkP3();
    player1.pause();
    player2.pause();
    player3.pause();
    player4.pause();
    player5.pause();
    player6.play();
  }
  if (scenario==4) {
    image(p[scenario], 0, 0, width, height);
    player5.pause();
    player7.play();
  }
}

