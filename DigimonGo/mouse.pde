

void mouseReleased() {
  if (drag==true) {
    if (mouseX<width&&mouseX>0&&mouseY<height&&mouseY>0) {
      if (cell[mouseX/cellSize][mouseY/cellSize]==1&&gold-digiGold[digidraw][0]>=0) {
        cell[mouseX/cellSize][mouseY/cellSize]=2;
        OBFS();
        BFS();
        if (findRoute==true) {
          digiLev=append(digiLev, 0);
          digiKind=append(digiKind, digidraw);
          digiX=append(digiX, mouseX/cellSize);
          digiY=append(digiY, mouseY/cellSize);
          digiFire=append(digiFire, 0);
          digiRecord=append(digiRecord, 0);
          gold=gold-digiGold[digiKind[digiKind.length-1]][0];
          digiCan=append(digiCan, 0);
        }
        if (findRoute==false) {
          cell[mouseX/cellSize][mouseY/cellSize]=1;
          findRoute=true;
        }
      }
    }
    drag=false;
  }
}



void mousePressed() {

  if (mouseButton==LEFT) {
    if (scenario==0) {
      if (mouseX<738&&mouseX>378) {
        if (mouseY<460&&mouseY>395) {
          image(p[1], 0, 0, width, height);
          scenario=1;
        }
        if (mouseY<553&&mouseY>490) {
          image(p[2], 0, 0, width, height);
          scenario=2;
        }
        if (mouseY<643&&mouseY>581) {
          exit();
        }
      }
    }
    if (scenario==1) {
      if (mouseX<975&&mouseX>757&&mouseY>54&&mouseY<91) {
        scenario=0;
      }
    }

    if (scenario==3) {
      if (mouseY<605&&mouseY>557) {
        if (mouseX<803 &&mouseX>575) {
          exit();
        }
      }
    }



    if (scenario==2) {

      if (view==true) {
        for (int i=0; i<digiX.length; i++) {
          if (mouseX>(digiX[i]*60-20)&&mouseX<(digiX[i]*60+20)&&digiX[i]*60<RmouseX&&digiX[i]*60+60>RmouseX) {
            if (mouseY>(digiY[i]*60+60)&&mouseY<(digiY[i]*60+100)) {
              if (digiLev[i]<3) {//add gold check
                if (gold-(digiGold[digiKind[i]][digiLev[i]+1]-digiGold[digiKind[i]][digiLev[i]])>=0) {
                  digiLev[i]=digiLev[i]+1;
                  gold=gold-(digiGold[digiKind[i]][digiLev[i]]-digiGold[digiKind[i]][digiLev[i]-1]);
                  digiFire[i]=1;
                }
              }
            }
          }

          if (mouseX>(digiX[i]*60+40)&&mouseX<(digiX[i]*60+80)&&digiX[i]*60<RmouseX&&digiX[i]*60+60>RmouseX) {//change to remove   (digiX[i]+1)*60-20, (digiY[i]+1)*60
            if (mouseY>(digiY[i]*60+60)&&mouseY<(digiY[i]*60+100)) {
              cell[digiX[i]][digiY[i]]=1;
              gold=gold+digiGold[digiKind[i]][digiLev[i]];
              digiLev[i]=digiLev[(digiLev.length-1)];
              digiKind[i]=digiKind[(digiKind.length-1)];
              digiX[i]=digiX[(digiX.length-1)];
              digiY[i]=digiY[(digiY.length-1)];
              digiFire[i]=digiFire[digiFire.length-1];
              digiLev=shorten(digiLev);
              digiFire=shorten(digiFire);
              digiKind=shorten(digiKind);
              digiX=shorten(digiX);
              digiY=shorten(digiY);
              digiCan=shorten(digiCan);
            }
          }
        }
        view=false;
      }

      for (int i=0; i<digiKind.length; i++) {
        if (int(mouseX/60)==digiX[i]&&int(mouseY/60)==digiY[i]&&digiFire[i]==0&&digiKind[i]==4) {
          digiCan[i]=1;
        } else if (digiCan[i]==1) {
          if (mouseX<digiX[i]*60&&mouseY<digiY[i]*60+digiAR[digiLev[i]]&&mouseY>digiY[i]*60+60-digiAR[digiLev[i]]) {
            for (int j=0; j<creepX.length; j++) {
              if (creepX[j]<=digiX[i]*60&&creepY[j]<=digiY[i]*60+digiAR[digiLev[i]]&&creepY[j]>digiY[i]*60-digiAR[digiLev[i]]) {
                creepHPi[j]=creepHPi[j]-digiAttack[4][digiLev[i]];
                if (creepKind[i]!=5) {
                  image(db[creepKind[j]], creepX[j], creepY[j], 60, 60);
                }
              }
            }
            digiCan[i]=0;
            digiFire[i]=1;
            digiRecord[i]=frameCount;
          } else if (mouseX>digiX[i]*60&&mouseY<digiY[i]*60+digiAR[digiLev[i]]&&mouseY>digiY[i]*60+60-digiAR[digiLev[i]]) {
            for (int j=0; j<creepX.length; j++) {
              if (creepX[j]>=digiX[i]*60&&creepY[j]<=digiY[i]*60+digiAR[digiLev[i]]&&creepY[j]>(digiY[i]*60-digiAR[digiLev[i]])) {
                creepHPi[j]=creepHPi[j]-digiAttack[4][digiLev[i]];
                
              }
            }
            digiCan[i]=0;
            digiFire[i]=1;
            digiRecord[i]=frameCount;
          } else if (mouseY<digiY[i]*60&&mouseX>digiX[i]*60+60-digiAR[digiLev[i]]&&mouseX<digiX[i]*60+digiAR[digiLev[i]]) {
            for (int j=0; j<creepX.length; j++) {
              if (creepY[j]<=digiY[i]*60&&creepX[j]>digiX[i]*60-digiAR[digiLev[i]]&&creepX[j]<=digiX[i]*60+digiAR[digiLev[i]]) {
                creepHPi[j]=creepHPi[j]-digiAttack[4][digiLev[i]];
                image(db[creepKind[j]], creepX[j], creepY[j], 60, 60);
              }
            }
            digiCan[i]=0;
            digiFire[i]=1;
            digiRecord[i]=frameCount;
          } else if (mouseY>digiY[i]*60&&mouseX>digiX[i]*60-digiAR[digiLev[i]]&&mouseX<digiX[i]*60+digiAR[digiLev[i]]) {
            for (int j=0; j<creepX.length; j++) {
              if (creepY[j]>=digiY[i]*60&&creepX[j]>digiX[i]*60-digiAR[digiLev[i]]&&creepX[j]<=digiX[i]*60+digiAR[digiLev[i]]) {
                creepHPi[j]=creepHPi[j]-digiAttack[4][digiLev[i]];
                image(db[creepKind[j]], creepX[j], creepY[j], 60, 60);
              }
            }
            digiCan[i]=0;
            digiFire[i]=1;
            digiRecord[i]=frameCount;
          } else {
            digiCan[i]=0;
            digiFire[i]=0;
          }
        }
      }
    }
  }


  if (mouseButton==RIGHT) {
    if (cell[mouseX/cellSize][mouseY/cellSize]==2) {
      view=true;
      RmouseX=mouseX;
      RmouseY=mouseY;//record
    } else {
      view=false;
    }
  }
}




void mouseDragged() {
  if (mouseY>=540&&mouseY<=645&&drag==false) {
    for (int i=0; i<5; i++) {
      if (mouseX>120*(i+1)&&mouseX<120*(i+1)+105) {
        drag=true;
        digidraw=i;
      }
    }
  }
}

void stop()
{
  //close the player
  player.close();


  //stop Minim
  minim.stop();
}

