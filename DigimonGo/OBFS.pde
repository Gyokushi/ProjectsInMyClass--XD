void OBFS() {
  int l=0;
  int k=0;

  for (int s=0; s<visited.length; s++) {
    visited[s]=false;
  }
  temp_vertices.clear();
  temp_vertices.append(19);
  visited[19]=true;

  while (visited[156]==false) {
    l=temp_vertices.size();
    if (l>0) {
      k=temp_vertices.get(0);
      if (cell[k%18+1][int(k/18)]==1&&visited[k+1]==false) {
        temp_vertices.append(k+1);
        visited[k+1]=true;
      }
      if (cell[k%18][int(k/18)+1]==1&&visited[k+18]==false) {
        temp_vertices.append(k+18);
        visited[k+18]=true;
      }
      if (cell[k%18][int(k/18)-1]==1&&visited[k-18]==false) {
        temp_vertices.append(k-18);
        visited[k-18]=true;
      }
      if (cell[k%18-1][int(k/18)]==1&&visited[k-1]==false) {
        temp_vertices.append(k-1);
        visited[k-1]=true;
      }
      temp_vertices.remove(0);
    } else if (l==0) {
      findRoute=false;
      break;
    }
  }
}

