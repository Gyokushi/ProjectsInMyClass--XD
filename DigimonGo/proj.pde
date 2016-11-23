import gifAnimation.*;
Gif myAnimation;
import ddf.minim.*;  //import the Minim library

//create Minim variable
Minim minim;

//create AudioPlayer variable
AudioPlayer player;
AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;
AudioPlayer player5;
AudioPlayer player6;
AudioPlayer player7;
//002,003,004,005,006,007;

PImage p[]=new PImage[5];//bg
PImage enter,p22;//game start use
PImage p0eb, p0hb, p0sb, p1bb, p21,p3eb;//page button
PImage pB[]=new PImage[5];//digimon button
int scenario;//all
PImage digimon[][]=new PImage[5][4];
PImage d[]=new PImage[6];
PImage LUP,DEL;
PImage dg[]=new PImage[5];
PImage db[]=new PImage[5];
PImage frozen;
PImage fire;
PImage bar;
PImage ex[]=new PImage[5];

int wave;
int gold;
int cell[][]=new int[18][11];
int cellSize=60;
int interval;
int time;
int time1;
int time2;
int time3;
int timeBar;
int RmouseX,RmouseY;
//how to store a route?

int cNode[]={};
int creepKind[]={};
float[] creepHP={60,100,330,800,1680,10000};
float creepHPi[]={};
int[] creepGold={12,14,25,40,83,0};
float creepX[]={};
float creepY[]={};
float creepdx[]={};
float creepdy[]={};
int creepRoute[][]=new int[100][100];
float[] creepV={0.8,1,1.5,1.2,1.2,0.6};
int[] creepSpeedC={};
int[] creepP={};
int[] creepR={};
int[] creepRecord={};
int[] creepAttack={20,40,60,80,100,400};
int[] creepInterval={120,60,100,100,150};
int baseHP;
int[] cRecord={};

int digidraw;
int[] digiAR={90,150,150,210};
int digiLev[]={};
int digiKind[]={};
int digiX[]={};
int digiY[]={};
int digiGold[][]=new int[5][4];
int digiAttack[][]=new int[5][4];
int digiInterval[][]=new int[5][4];
int digiRecord[]={};
int digiCan[]={};



//n dimention array?
boolean pause;
int digiFire[]={};//can attack
boolean drag;
boolean view;
boolean findRoute;
int creepFire[]={};
boolean emerge;

//BFS NEED;

boolean visited[]=new boolean[198];
IntList temp_vertices=new IntList();
int parent[]=new int[198];






  

  

