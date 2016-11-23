void addCreep(int k){
      creepX=append(creepX, 60);
      creepY=append(creepY, 60);
      cNode=append(cNode, 0);
      creepdx=append(creepdx, 0);
      creepdy=append(creepdy, 0);
      creepKind=append(creepKind, k);
      creepHPi=append(creepHPi, creepHP[creepKind[creepKind.length-1]]);
      creepSpeedC=append(creepSpeedC, 10);
      creepP=append(creepP, 0);
      creepR=append(creepR, 0);
      creepRecord=append(creepRecord,0);
      creepFire=append(creepFire,0);
      cRecord=append(cRecord,0);
      BFS();
}
