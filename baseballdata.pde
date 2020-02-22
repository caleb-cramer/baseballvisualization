//Ryan Brown & Caleb Cramer

// to interact, use arrows to move between the teams
// when each team is selected, it is highlighted in its primary team color!
float myInt = 0.0;

//team color
// 0 = angels
//29 = nationals
int[] teamColors = {#BA0021, #A71930, #13274F, #DF4601, #BD3039, #0E3386, #27251F, #C6011F, #E31937, #33006F, #0C2340, #EB6E1F, #004687, #005A9C, #00A3E0, #0A2351, #002B5C, #002D72, #0C2340, #003831, #E81828, #FDB827, #C41E3A, #2F241D, #FD5A1E, #0C2C56, #8FBCE6, #003278, #134A8E, #AB0003}; 

//table full of wins and losses
  Table winsTable;
  Table lossesTable;
  
  //this holds the last vertex to connect to current vertex
  float lastPercentage = 0;
  
  int teamRow = 0;

void processData(){
  strokeWeight(1);
  beginShape(LINES);
  //iterates through rows {TEAMS}
  for(int j = 0; j < winsTable.getRowCount(); j++){
    stroke(0 + (j*8.5));
    //iterates through columns {GAMES}
    for (int i = 0; i < winsTable.getColumnCount(); i++){
      //previous vertex
      vertex((i-1)*(myInt), (width-80)*(1-lastPercentage)+10);
      //calculate current win %
      float currPercentage = winsTable.getInt(j,i)/(float) (winsTable.getInt(j,i) + lossesTable.getInt(j,i));
      //new vertex based on current win %
      vertex(i*(myInt), (width-80)*(1-currPercentage)+10);
      //switch last and curr
      lastPercentage = currPercentage;
    }
  }
  endShape();
  
}

void setup(){
  size(880,820);
  //background(#22BC00);
  background(#6db9d2);
  myInt = (float) (width-120) / 163;
  winsTable = loadTable("wins.csv");
  lossesTable = loadTable("losses.csv");
  
  processData();
}

void draw() {
 //teamSelect(); 
}


void teamSelect() {
  //background(#22BC00);
  background(#6db9d2);
  processData();
  
  stroke(teamColors[teamRow]);
  strokeWeight(4);
  beginShape(LINES);
  for (int i = 0; i < winsTable.getColumnCount(); i++){
      //previous vertex
      vertex((i-1)*(myInt), (width-80)*(1-lastPercentage)+10);
      //calculate current win %
      float currPercentage = winsTable.getInt(teamRow,i)/(float) (winsTable.getInt(teamRow,i) + lossesTable.getInt(teamRow,i));
      //new vertex based on current win %
      vertex(i*(myInt), (width-80)*(1-currPercentage)+10);
      //switch last and curr
      lastPercentage = currPercentage;
    }
    endShape();
    //iterate through 1 team loss and wins to calculate percentage 
    
  //set text attributes
  textSize(40);
  textAlign(CENTER, RIGHT);
  fill(0);
  // set text in bottom left corner matching current selected team
  text(winsTable.getString(teamRow,0),(width - 50), height - 10);
  //textAlign(LEFT);
}

// rotate through teams by using UP and DOWN arrows 
void keyPressed() {
  if ( keyCode == UP) {
    if ( teamRow == 0){
      teamRow = 29;
    } else {
     teamRow--; 
    }
    
  }
  if (keyCode == DOWN) {
   if ( teamRow == 29){
      teamRow = 0;
    } else {
     teamRow++; 
    }
  }
  
  teamSelect();
}
