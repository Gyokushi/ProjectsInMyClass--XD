void BFS() {
  int l=0;
  int k=0;
  if (cell[1][1]==2) {
    findRoute=false;
  }
  for (int i=0; i<creepX.length; i++) {
    for (int s=0; s<visited.length; s++) {
      visited[s]=false;
    }
    temp_vertices.clear();
    temp_vertices.append((int(creepX[i]/60)+int(creepY[i]/60)*18));
    visited[int(creepX[i]/60)+int(creepY[i]/60)*18]=true;
    while (visited[156]==false) {
      l=temp_vertices.size();
      if (l>0) {
        k=temp_vertices.get(0);
        if (cell[k%18+1][int(k/18)]==1&&visited[k+1]==false) {
          temp_vertices.append(k+1);
          visited[k+1]=true;
          parent[k+1]=k;
        }
        if (cell[k%18][int(k/18)+1]==1&&visited[k+18]==false) {
          temp_vertices.append(k+18);
          visited[k+18]=true;
          parent[k+18]=k;
        }
        if (cell[k%18][int(k/18)-1]==1&&visited[k-18]==false) {
          temp_vertices.append(k-18);
          visited[k-18]=true;
          parent[k-18]=k;
        }
        if (cell[k%18-1][int(k/18)]==1&&visited[k-1]==false) {
          temp_vertices.append(k-1);
          visited[k-1]=true;
          parent[k-1]=k;
        }
        temp_vertices.remove(0);
      } else if (l==0) {
        findRoute=false;
        break;
      }
    }

    if (visited[156]==true) {


      creepRoute[i][0]=156;
      creepRoute[i][1]=155;
      cNode[i]=0;
      for (int j=1; j<100; j++) {
        creepRoute[i][j]=parent[creepRoute[i][j-1]];
        cNode[i]=cNode[i]+1;
        if (creepRoute[i][j]==int(creepX[i]/60)+int(creepY[i]/60)*18) {
          break;
        }
      }
    }
  }
}

