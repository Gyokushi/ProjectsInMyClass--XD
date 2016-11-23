void setup()
{ 
  minim = new Minim(this);

  player = minim.loadFile("00.mp3");
  player1=minim.loadFile("01.mp3");
  player2=minim.loadFile("02.mp3");
  player3=minim.loadFile("03.mp3");
  player4=minim.loadFile("04.mp3");
  player5=minim.loadFile("05.mp3");
  player6=minim.loadFile("06.mp3");
  player7=minim.loadFile("07.mp3");
  
  time3=frameCount;
  wave=1;
  bar=loadImage("bar.png");
  baseHP=5000;
  gold=400;
  for(int i=1;i<4;i++){
  digiGold[0][0]=40;digiAttack[0][0]=15;digiInterval[0][0]=10;
  digiGold[1][0]=60;digiAttack[1][0]=8;digiInterval[1][0]=2;
  digiGold[2][0]=120;digiAttack[2][0]=27;digiInterval[2][0]=90;
  digiGold[3][0]=80;digiAttack[3][0]=10;digiInterval[3][0]=60;
  digiGold[4][0]=150;digiAttack[4][0]=40;digiInterval[4][0]=900;
  digiGold[0][i]=int(digiGold[0][i-1]*(17-i)*0.1);digiAttack[0][i]=digiAttack[0][i-1]+8;digiInterval[0][i]=digiInterval[0][i-1]-2;
  digiGold[1][i]=int(digiGold[1][i-1]*(17-i)*0.1);digiAttack[1][i]=digiAttack[1][i-1]-2;digiAttack[1][3]=4;digiInterval[1][1]=2;digiInterval[1][2]=2;digiInterval[1][3]=3;
  digiGold[2][i]=int(digiGold[2][i-1]*(17-i)*0.1);digiAttack[2][i]=digiAttack[2][i-1]+10;digiInterval[2][i]=digiInterval[2][i-1]-6;
  digiGold[3][i]=int(digiGold[3][i-1]*(17-i)*0.1);digiAttack[3][i]=digiAttack[3][i-1]+4;digiInterval[3][i]=digiInterval[3][i-1]-5;
  digiGold[4][i]=int(digiGold[4][i-1]*(17-i)*0.1);digiAttack[4][i]=digiAttack[4][i-1]+40;digiInterval[4][i]=digiInterval[4][i-1]-120;
  }
 
 
  emerge=true;
  view=false;
    myAnimation = new Gif(this, "1111.gif");
myAnimation.play();
  size(1080, 660);
  frozen=loadImage("frozen.png");
  fire=loadImage("fire.png");
  for (int i=0; i<5; i++) {
    p[i]=loadImage("p"+i+".jpg");
    pB[i]=loadImage(i+".png");
    dg[i]=loadImage("dg"+i+".png");
    db[i]=loadImage("db"+i+".png");
    ex[i]=loadImage("ex"+i+".jpg");
  }
  for(int i=0;i<6;i++){
  d[i]=loadImage("d"+i+".png");
  }
  DEL=loadImage("DEL.png");
  LUP=loadImage("LUP.png");
  p0eb=loadImage("p0eb.png");
  p0hb=loadImage("p0hb.png");
  p0sb=loadImage("p0sb.png");
  p1bb=loadImage("p1bb.png"); 
  p3eb=loadImage("p3eb.png");
  p22=loadImage("p22.png");
  p21=loadImage("p21.jpg");
  enter=loadImage("1111.gif");
  image(p[0], 0, 0, width, height);
  scenario=0;
  //game start setup:
  //prepare cell available:
  for (int x=0; x<18; x++) {
    for (int y=0; y<11; y++) {
      cell[x][y]=0;
    }
  }
  for (int x=1; x<12; x++) {
    for (int y=1; y<9; y++) {
      cell[x][y]=1;
    }
  }
  for (int x=12; x<17; x++) {
    for (int y=1; y<5; y++) {
      cell[x][y]=1;
    }
  }
  cell[12][8]=1;
  //put digimon image

  for (int x=0; x<5; x++) {
    for (int y=0; y<4; y++) {
      digimon[x][y]=loadImage(x+"t"+y+".png");
    }
  }
  digidraw=0;
  findRoute=true;
  
  
  
}

