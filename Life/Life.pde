//nice value 30 30 30
int scale = 10;
int rows = 100;
int cols = 100;
boolean [][] grid = new boolean[rows][cols];
boolean [][] newGrid = new boolean[rows][cols];
boolean life = false;
void setup(){
  
  size(600,600);
  for (int i = 0; i < rows ; i ++ ){
    for (int j = 0; j < cols; j++){
      grid[i][j] = false;
     
    }
  }

  
  fill(0);
}
void mouseClicked(){
  if (!life){ 
    int x = mouseX;
    int y = mouseY;
    int r = floor(x/scale);
    int c = floor(y/scale);
    grid[r][c] = !grid[r][c];
  }
}
void keyPressed(){
 if (key == ENTER){
   life = !life;
 }
 if (key == 'E' || key == 'e' && !life){
   for (int i = 0; i < rows ; i ++ ){
    for (int j = 0; j < cols; j++){
      grid[i][j] = false;  
    }
  }
 }
}
void draw(){

  for (int i = 0; i < rows ; i ++ ){
    for (int j = 0; j < cols; j++){
      fill(255,255,255);
      if (grid[i][j]){
        fill(0);
      }
      rect(i*scale,j*scale,(i+1)*scale,(j+1)*scale);
    }
  }
  if (life){
    nextGeneration();
    delay(500);    
  }
}
int  getAlive(int i,int j){
  int cont = 0;
  if (i > 0){
     if(grid[i-1][j])
       cont++;
  }
  if (i < rows - 1){
     if(grid[i+1][j])
       cont++;
  } 
  if (j > 0){
     if(grid[i][j-1])
       cont++;
  }
  if (j < cols-1){
     if(grid[i][j+1])
       cont++;
  }
  if (i > 0 && j > 0){
     if(grid[i-1][j-1])
       cont++;
  }
  if (i < rows-1 && j < cols-1){
     if(grid[i+1][j+1])
       cont++;
  }
  if (i > 0 && j < cols -1){
     if(grid[i-1][j+1])
       cont++;
  }
  if (i < rows-1 && j > 0){
     if(grid[i+1][j-1])
       cont++;
  }
  
  return cont;
}
void nextGeneration(){
  int n;
  for (int i = 0; i < rows ; i ++ ){
    for (int j = 0; j < cols; j++){
      newGrid[i][j] = grid[i][j];
      n = getAlive(i,j);
      if (grid[i][j] && (n < 2 || n > 3)){
         newGrid[i][j] = false; 
      }
      if (!grid[i][j] && n == 3){
         newGrid[i][j] = true; 
      }
    }
  }
  for (int i = 0; i < rows ; i ++ ){
    for (int j = 0; j < cols; j++){
     grid[i][j] = newGrid[i][j];
    }
  }
}
     
