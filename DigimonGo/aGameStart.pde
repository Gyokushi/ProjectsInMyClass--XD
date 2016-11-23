void gamestart() {
  player.pause();
  player1.play();

  if (baseHP<=0) {
    scenario=3;
  }
  //120,540  105*105
  if (time/(60*(60+17))>=1) {
    player1.pause();
    player2.play();
    if (time/(60*(120+31))>=1) {
      player2.pause();
      player3.play();
      if (time/(60*(360+42))>=1) {
        player3.pause();
        player4.play();
      }
    }
  }

  time2=frameCount;
  time=time2-time1;
  if (time>=36000) {
    scenario=4;
  }
  image(p[2], 0, 0, width, height);
  if (wave==23) {
    tint(255, 150);
    image(p21, 0, 0, width, height);
    player4.pause();
    player5.play();
  }
  image(myAnimation, 30, 30, 90, 90);
  noStroke();
  fill(0);
  rect(800, 320, 240, 5);
  fill(0, 255, 0);
  rect(800, 320, baseHP*240/5000, 5);
  if (drag==true) {
    image(p22, 0, 0, width, height);
    image(digimon[digidraw][0], mouseX-30, mouseY-30, 60, 60);
    if (mouseX>=0&&mouseX<width&&mouseY>=0&&mouseY<height) {
      if (cell[mouseX/cellSize][mouseY/cellSize]==1) {
        noStroke();
        fill(0, 255, 0, 100);
        rect(mouseX-mouseX%60, mouseY-mouseY%60, cellSize, cellSize);
      }
      if (cell[mouseX/cellSize][mouseY/cellSize]!=1) {
        noStroke();
        fill(255, 0, 0, 100);
        rect(mouseX-mouseX%60, mouseY-mouseY%60, cellSize, cellSize);
      }
    }
  }//drag true

    for (int i=0; i<creepX.length; i++) {
    if (creepHPi[i]>=0) {
      int v=creepRoute[i][cNode[i]];

      if (creepKind[i]!=5) {
        fill(0);
        rect(creepX[i]+10, creepY[i]-10, 40, 3);
        fill(255, 0, 0);
        rect(creepX[i]+10, creepY[i]-10, (creepHPi[i]/creepHP[creepKind[i]])*40, 3);
        image(d[creepKind[i]], creepX[i], creepY[i], 60, 60);
      } else {
        fill(0);
        rect(creepX[i]+10, creepY[i]-10, 240, 3);
        fill(255, 0, 0);
        rect(creepX[i]+10, creepY[i]-10, (creepHPi[i]/creepHP[creepKind[i]])*240, 3);
        image(d[creepKind[i]], creepX[i], creepY[i], 240, 240);
      }
      if (creepP[i]!=0) {
        if (creepKind[i]!=5) {
          image(dg[creepKind[i]], creepX[i], creepY[i], 60, 60);
        }
      }
      if (creepSpeedC[i]!=10) {
        image(frozen, creepX[i], creepY[i], 60, 60);
      }
      int a=int(creepX[i]/60)+int(creepY[i]/60)*18;//modify as former

      if (creepKind[i]!=5) {
        if (a-creepRoute[i][cNode[i]]==-1) {
          creepdx[i]=creepV[creepKind[i]]*creepSpeedC[i]/10;
          creepdy[i]=0;
          if (creepdx[i]==0) {
            creepdx[i]=1;
          }
        } else if (a-creepRoute[i][cNode[i]]==1) {
          creepdx[i]=-creepV[creepKind[i]]*creepSpeedC[i]/10;
          creepdy[i]=0;
          if (creepdx[i]==0) {
            creepdx[i]=-1;
          }
        } else if (a-creepRoute[i][cNode[i]]==18) {
          creepdx[i]=0;
          creepdy[i]=-creepV[creepKind[i]]*creepSpeedC[i]/10;
          if (creepdy[i]==0) {
            creepdy[i]=-1;
          }
        } else if (a-creepRoute[i][cNode[i]]==-18) {
          creepdx[i]=0;
          creepdy[i]=creepV[creepKind[i]]*creepSpeedC[i]/10;
          if (creepdy[i]==0) {
            creepdy[i]=1;
          }
        } else if (a-creepRoute[i][cNode[i]]==0&&a!=156) {
          if (creepdx[i]!=-creepV[creepKind[i]]&&creepdy[i]!=-creepV[creepKind[i]]) {
            cNode[i]=cNode[i]-1;
          } else if (creepX[i]==int(v%18)*60&&creepY[i]==int(v/18)*60) {
            cNode[i]=cNode[i]-1;
          }
        }
      }
      if (a==156) {//as destination
        creepdx[i]=0;
        creepdy[i]=0;
        if (creepFire[i]==0) {
          baseHP=baseHP-creepAttack[creepKind[i]];
          creepFire[i]=1;
          cRecord[i]=frameCount;
        } else if (creepFire[i]==1&&time2-cRecord[i]==creepInterval[creepKind[i]]) {
          creepFire[i]=0;
        }
        //attack base;
        // attack internal;
        //baseHP decrease;}
      }
      creepX[i]=creepX[i]+creepdx[i];
      creepY[i]=creepY[i]+creepdy[i];
    } else if (creepHPi[i]<=0) {
      gold=gold+creepGold[creepKind[i]];
      creepX[i]=creepX[creepX.length-1];
      creepY[i]=creepY[creepY.length-1];
      cNode[i]=cNode[cNode.length-1];
      creepdx[i]=creepdx[creepdx.length-1];
      creepdy[i]=creepdy[creepdy.length-1];
      creepKind[i]=creepKind[creepKind.length-1];
      creepHPi[i]=creepHPi[creepHPi.length-1];
      creepSpeedC[i]=creepSpeedC[creepSpeedC.length-1];
      creepP[i]=creepP[creepP.length-1];
      creepR[i]=creepR[creepR.length-1];
      creepFire[i]=creepFire[creepFire.length-1];
      creepRecord[i]=creepRecord[creepRecord.length-1];
      cRecord[i]=cRecord[cRecord.length-1];
      for (int j=0; j<100; j++) {
        creepRoute[i][j]=creepRoute[creepX.length-1][j];
      }
      cRecord=shorten(cRecord);
      creepX=shorten(creepX);
      creepY=shorten(creepY);
      cNode=shorten(cNode);
      creepdx=shorten(creepdx);
      creepdy=shorten(creepdy);
      creepKind=shorten(creepKind);
      creepHPi=shorten(creepHPi);
      creepSpeedC=shorten(creepSpeedC);
      creepP=shorten(creepP);
      creepR=shorten(creepR);
      creepRecord=shorten(creepRecord);
      creepFire=shorten(creepFire);
    }
  }


  for (int i=0; i<digiX.length; i++) {
    if (digiCan[i]==1) {
      image(p22, 0, 0, width, height);
      if (digiAR[digiLev[i]]>120) {
        digiAR[digiLev[i]]=120;
      }
      if (mouseX<digiX[i]*60&&mouseY<digiY[i]*60+digiAR[digiLev[i]]&&mouseY>digiY[i]*60+60-digiAR[digiLev[i]]) {
        fill(0, 255, 255, 50);
        rect(0, digiY[i]*60+60-digiAR[digiLev[i]], digiX[i]*60, digiAR[digiLev[i]]*2-60);
      } else if (mouseX>digiX[i]*60&&mouseY<digiY[i]*60+digiAR[digiLev[i]]&&mouseY>digiY[i]*60+60-digiAR[digiLev[i]]) {
        fill(0, 255, 255, 50);
        rect(digiX[i]*60+60, digiY[i]*60+60-digiAR[digiLev[i]], width-digiX[i]*60-60, digiAR[digiLev[i]]*2-60);
      } else if (mouseY<digiY[i]*60&&mouseX>digiX[i]*60+60-digiAR[digiLev[i]]&&mouseX<digiX[i]*60+digiAR[digiLev[i]]) {
        fill(0, 255, 255, 50);
        rect(digiX[i]*60+60-digiAR[digiLev[i]], 0, digiAR[digiLev[i]]*2-60, digiY[i]*60);
      } else if (mouseY>digiY[i]*60&&mouseX>digiX[i]*60-digiAR[digiLev[i]]&&mouseX<digiX[i]*60+60+digiAR[digiLev[i]]) {
        fill(0, 255, 255, 50);
        rect(digiX[i]*60+60-digiAR[digiLev[i]], digiY[i]*60+60, digiAR[digiLev[i]]*2-60, height-digiY[i]*60-60);
      }
    }
    int num=0; 
    image(digimon[digiKind[i]][digiLev[i]], digiX[i]*60, digiY[i]*60, 60, 60);
    if (view==true) {
      if (int(RmouseX/cellSize)==digiX[i]&&int(RmouseY/cellSize)==digiY[i]) {
        fill(255, 255, 0, 100);
        ellipse(digiX[i]*60+30, digiY[i]*60+30, digiAR[digiLev[i]], digiAR[digiLev[i]]);
        image(LUP, digiX[i]*60-20, (digiY[i]+1)*60);
        image(DEL, (digiX[i]+1)*60-20, (digiY[i]+1)*60);
        textSize(14);
        fill(0);
        text("Level:"+(digiLev[i]+1), digiX[i]*60, digiY[i]*60);
        text("Attack"+digiAttack[(digiKind[i])][(digiLev[i])], digiX[i]*60, digiY[i]*60+16);
        if (digiLev[i]<3) {
          text("-"+int(digiGold[digiKind[i]][digiLev[i]+1]-digiGold[digiKind[i]][digiLev[i]])+"gold  "+"+"+int(digiGold[(digiKind[i])][(digiLev[i])]*0.4)+"gold", digiX[i]*60-30, (digiY[i]+1)*60);
        } else {
          text("  "+"-"+int(digiGold[digiKind[i]][digiLev[i]]*0.4), digiX[i]*60-30, 60*(digiY[i]+1));
        }
      }
    }

    for (int j=0; j<creepX.length; j++) {

      if (dist(digiX[i]*60, digiY[i]*60, creepX[j], creepY[j])<digiAR[digiLev[i]]&&digiFire[i]==0) {
        if (digiKind[i]==0) {
          digiFire[i]=1;
          creepHPi[j]=creepHPi[j]-digiAttack[0][digiLev[i]];
          image(fire, creepX[j]+25, creepY[j]+25, 10, 10);
          digiRecord[i]=frameCount;
        } else if (digiKind[i]==1&&digiInterval[1][digiKind[i]]>num) {
          if (creepSpeedC[j]==10) {
            creepSpeedC[j]=digiAttack[1][digiLev[i]];
            creepRecord[j]=i;
            num++;
          }
        } else if (digiKind[i]==2) {
          for (int x=0; x<creepX.length; x++) {
            if (dist(digiX[i]*60, digiY[i]*60, creepX[x], creepY[x])<digiAR[digiLev[i]]) {
              creepHPi[x]=creepHPi[x]-digiAttack[2][digiLev[i]];
              if (creepKind[x]!=5) {
                image(db[creepKind[x]], creepX[x], creepY[x], 60, 60);
              }
            }
            digiRecord[i]=frameCount;
          }
          digiFire[i]=1;
        } else if (digiKind[i]==3) {
          creepP[j]=digiAttack[3][digiLev[i]];

          digiRecord[i]=frameCount;
          creepR[j]=frameCount;
          digiFire[i]=1;
        }
      } else if (digiFire[i]==1) {
        if ((time-digiRecord[i])>digiInterval[digiKind[i]][digiLev[i]]) {
          digiFire[i]=0;
        }
      } else if (i==creepRecord[j]&&dist(digiX[i]*60, digiY[i]*60, creepX[j], creepY[j])>digiAR[digiLev[i]]) {
        creepSpeedC[j]=10;
      } 
      if (creepP[j]!=0) {

        if ((time-creepR[j])%60==0) {
          if ((time-creepR[j])%180==0) {
            creepP[j]=0;
          }
          creepHPi[j]=creepHPi[j]-creepP[j];
        }
      }
    }
  }




  ///////////////////////////////

  if ((time2-time3)<60*(14+wave)-90) {
    if (wave==1&&time%150==0) {
      addCreep(0);
    }
    if (wave>=2&&wave<=3&&time%120==0) {
      float x=random(0, 1);
      creepHP[0]=80;
      if (x<0.1+wave/10) {
        addCreep(1);
      } else {
        addCreep(0);
      }
    }
    if (wave>3&&wave<=6&&time%150==0) {
      creepHP[0]=120;
      creepHP[1]=150;
      float x=random(0, 1);
      if (x<0.1+wave/30) {
        addCreep(2);
      } else if (x>0.7) {
        addCreep(0);
      } else {
        addCreep(1);
      }
    }
    if (wave==7) {
      creepHP[0]=180;
      creepHP[1]=200;
      if (time%80==0) {
        float x=random(0, 1);
        if (x<0.2) {
          addCreep(2);
        } else if (x>0.7) {
          addCreep(1);
        } else {
          addCreep(0);
        }
      }
    }
    if (wave>=8&&wave<=10) {
      creepHP[2]=400;
      creepHP[0]=230;
      creepHP[1]=280;
      if (time%80==0) {
        float x=random(0, 1);
        if (x>0.9-(wave-7)/20) {
          addCreep(3);
        } else if (x<0.3-(wave-7)/20) {
          addCreep(0);
        } else if (x<0.4) {
          addCreep(2);
        } else {
          addCreep(1);
        }
      }
    }

    if (wave>10&&wave<14) {
      creepHP[0]=280;
      creepHP[1]=350;
      creepHP[2]=500;
      if (time%70==0) {
        float x=random(0, 1);
        if (x>0.9-(wave-10)/20) {
          addCreep(3);
        } else if (x>0.7-(wave-10)/20) {
          addCreep(0);
        } else if (x>0.4-(wave-10)/10) {
          addCreep(2);
        } else {
          addCreep(1);
        }
      }
    }

    if (wave==14) {
      if (time%50==0) {
        float x=random(0, 1);
        if (x>0.85) {
          addCreep(3);
        } else if (x>0.5) {
          addCreep(0);
        } else if (x>0.35) {
          addCreep(2);
        } else {
          addCreep(1);
        }
      }
    }

    if (wave>14&&wave<18) {
      creepHP[0]=530;
      creepHP[1]=470;
      creepHP[2]=690;
      creepHP[3]=1000;
      if (time%70==0) {
        float x=random(0, 1);
        if (x>0.95-(wave-14)/40) {
          addCreep(4);
        } else if (x>0.9-(wave-14)/20) {
          addCreep(3);
        } else if (x>0.5) {
          addCreep(1);
        } else if (x>0.3) {
          addCreep(2);
        } else {
          addCreep(0);
        }
      }
    }

    if (wave>=18&&wave<=20) {
      float x=random(0, 1);
      if (time%60==0) {
        if (x>0.85-(wave-14)/40) {
          addCreep(4);
        } else if (x>0.6-(wave-14)/20) {
          addCreep(3);
        } else if (x>0.4) {
          addCreep(1);
        } else if (x>0.3) {
          addCreep(2);
        } else {
          addCreep(0);
        }
      }
    }

    if (wave==21) {
      float x=random(0, 1);
      if (time%60==0) {
        if (x>0.85-(wave-14)/40) {
          addCreep(4);
        } else if (x>0.6-(wave-14)/20) {
          addCreep(3);
        } else if (x>0.4) {
          addCreep(1);
        } else if (x>0.3) {
          addCreep(2);
        } else {
          addCreep(0);
        }
      }
    }

    if (wave==22) {
      creepX=append(creepX, 60);
      creepY=append(creepY, 60);
      cNode=append(cNode, 0);
      creepdx=append(creepdx, 0.15);
      creepdy=append(creepdy, 0.1);
      creepKind=append(creepKind, 5);
      creepHPi=append(creepHPi, creepHP[creepKind[creepKind.length-1]]);
      creepSpeedC=append(creepSpeedC, 10);
      creepP=append(creepP, 0);
      creepR=append(creepR, 0);
      creepRecord=append(creepRecord, 0);
      creepFire=append(creepFire, 0);
      cRecord=append(cRecord, 0);
      for (int i=0; i<4; i++) {
        digiAR[i]=240;
      }
      wave=wave+1;
    }
  } else if ((time2-time3)<60*(14+wave)&&(time2-time3)>60*(14+wave)-120) {
  } else if ((time2-time3)==60*(14+wave)) {
    time3=frameCount;
    if (wave!=23) {
      wave=wave+1;
    }
  }

  float kx=random(0, 2);
  float ky=random(0, 2);

  image(bar, 710+kx, 538+ky, 120, 100);
  textSize(18);
  fill(0);
  text(int(time*100/36000)+"%", 745+kx, 588+ky);
  fill(255, 255, 0);
  textSize(30);
  text("Gold:"+gold, 100, 30);
  fill(255, 0, 0);
  if (wave<22) {
    text("wave"+wave, 969, 40);
  } else if (wave==23) {
    text("wave"+22, 969, 40);
  }


  for (int i=0; i<5; i++) {
    image(pB[i], 120*(i+1), 540);
  }

  if (mouseY>540&&mouseY<540+105&&mouseX<720&&mouseX>120&&(mouseX-120)%120<105) {
    image(ex[int((mouseX-120)/120)], 814, 500);
  }
}

