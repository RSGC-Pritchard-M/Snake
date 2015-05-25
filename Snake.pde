//Matthew Pritchard
//Snake
//May 14 2015

private static final int WALL = 2;
private static final int PLAYER = 3;
private static final int FOOD = 5;
private static final int OPEN_SPACE = 7;
private static final int PLAYER_WIDTH = 1;
private static final int PLAYER_HEIGHT = 1;
private static final int MOVING_UP = 10;
private static final int MOVING_DOWN = 11;
private static final int MOVING_LEFT = 12;
private static final int MOVING_RIGHT = 13;
int[][] board = new int[35][35];
int rowCounter;
int colCounter;
int playerX = 1, playerY = 33;
int currentDirection = MOVING_UP;
//float foodX = random(1,35), foodY = random(1,35);
int foodX = 20, foodY = 20;


void setup() {
  size(700, 700);
  background(360);


  // set color mode
  colorMode(HSB, 360, 100, 100);

  //open space
  rowCounter = 0; // start
  while (rowCounter < 35) { // end 
    colCounter = 0;//start
    while (colCounter < 35) {//end
      board[rowCounter][colCounter] = OPEN_SPACE;
      colCounter += 1;
    }
    rowCounter += 1;
  }


  //Walls at top

  rowCounter = 0;//start
  while (rowCounter < 1) {//end
    colCounter = 0;//start
    while (colCounter < 35) {//end
      board[rowCounter][colCounter] = WALL * OPEN_SPACE;
      colCounter += 1;
    }
    rowCounter += 1;
  }

  //Walls bottom

  rowCounter = 34;//start
  while (rowCounter < 35) {//end
    colCounter = 0;//start
    while (colCounter < 35) {//end
      board[rowCounter][colCounter] = WALL * OPEN_SPACE;
      colCounter += 1;
    }
    rowCounter += 1;
  }

  //Walls Left

  rowCounter = 0;//start
  while (rowCounter < 35) {//end
    colCounter = 0;//start
    while (colCounter < 1) {//end
      board[rowCounter][colCounter] = WALL * OPEN_SPACE;
      colCounter += 1;
    }
    rowCounter += 1;
  }

  //Walls Right

  rowCounter = 0;//start
  while (rowCounter < 35) {//end
    colCounter = 34;//start
    while (colCounter < 35) {//end
      board[rowCounter][colCounter] = WALL * OPEN_SPACE;
      colCounter += 1;
    }
    rowCounter += 1;
  }

  //Player
  rowCounter = playerY;//start
  while (rowCounter < playerY + PLAYER_HEIGHT) {//end
    colCounter = playerX;//start
    while (colCounter < playerX + PLAYER_WIDTH) {//end
      board[rowCounter][colCounter] = PLAYER * OPEN_SPACE;
      colCounter += 1;
    }
    rowCounter += 1;
  }
  //food
  rowCounter = foodY;//start
  while (rowCounter == foodY) {//end
    colCounter = foodX;//start
    while (colCounter == foodY) {//end
      board[rowCounter][colCounter] = FOOD * OPEN_SPACE;
      colCounter += 1;
    }
    rowCounter += 1;
  }
}


void draw() {
  background(360);


  //draws board
  loadPixels();  
  // Loop through every pixel column
  for (int column = 0; column < width / 20; column++) {
    // Loop through every pixel row
    for (int row = 0; row < height / 20; row++) {

      // Use the formula to find the 1D location

      int loc = column + row * width;

      // Draw the board 
      if (board[row][column] == OPEN_SPACE) { // open space
        pixels[loc] = color(0, 80, 90);//red
      } else if (board[row][column] == WALL * OPEN_SPACE) { // wall
        pixels[loc] = color(60, 80, 90);
      } else if (board[row][column] == PLAYER * OPEN_SPACE) { // player
        pixels[loc] = color(90, 80, 90);
      } else if (board[row][column] == FOOD * OPEN_SPACE) { // food
        pixels[loc] = color(220, 80, 90);
      } else { 
        pixels[loc] = color(180, 80, 90);
      }
    }
    updatePixels();
  }

  if (currentDirection == MOVING_UP) {
    //playerY - 1= playerY;
    int row = playerY;//start
    int col = playerX;
    while (col < playerX + PLAYER_WIDTH) {//end
      board[row][col] = board[row][col] * PLAYER;
      col += 1;
    }
  }
    // while (playerY < 1) {
    //   playerY = playerY --;
    // }
    
  
  if (currentDirection == MOVING_DOWN) {
    int row = playerY;//start
    int col = playerX;
    while (col < playerX + PLAYER_WIDTH) {//end
      board[row][col] = board[row][col] * PLAYER;
      col += 1;
    }
  }
  if (currentDirection == MOVING_LEFT) {
    int row = playerY;//start
    int col = playerX;
    while (row < playerY + PLAYER_HEIGHT) {//end
      board[row][col] = board[row][col] * PLAYER;
      row += 1;
    }
  }
  if (currentDirection == MOVING_RIGHT) {
    int row = playerY;//start
    int col = playerX;
    while (row < playerY + PLAYER_HEIGHT) {//end
      board[row][col] = board[row][col] * PLAYER;
      row += 1;
    }
  }
  //checking for colisions
  int col = 0;
  while (col < 35) {
    int row =0;
    while (row < 35) {
      if (board[row][col] % WALL == 0 && board[row][col] % PLAYER == 0) {
        println("row is: " + row);
        println("col is: " + col);
        noLoop();
      }
      row += 1;
    }
    col +=1;
  }
}



void keyPressed()

{
  //    if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      //Keeps player on screen
      if (playerX < 0) {


        // add at left
        // println("moving down");
        int row = playerY;//start
        int col = playerX - 1;
        while (row < playerY + PLAYER_HEIGHT) {//end
          board[row][col] = board[row][col] * PLAYER;
          row += 1;
        }
        // clear on right
        row = playerY;//start
        col = playerX + PLAYER_WIDTH -1;
        while (row < playerY + PLAYER_HEIGHT) {//end
          board[row][col] = board[row][col] / PLAYER;
          row += 1; 
          if (keyCode == LEFT) {
            currentDirection = MOVING_LEFT;
            println("left");
          }
        }
      }
      //After updating board chage poition
      playerX -= 1;
    } else if (keyCode == RIGHT)
    {
      //Keeps player on screen
      if (playerX < 332) {

        // add at right
        // println("moving down");
        int row = playerY;//start
        int col = playerX + PLAYER_WIDTH;
        while (row < playerY + PLAYER_HEIGHT) {//end
          board[row][col] = board[row][col] * PLAYER;
          row += 1;
        }
        // clear on left
        row = playerY;//start
        col = playerX;
        while (row < playerY + PLAYER_HEIGHT) {//end
          board[row][col] = board[row][col] / PLAYER;
          row += 1;
          if (keyCode == RIGHT) {
            currentDirection = MOVING_RIGHT;
            println("Right");
          }
        }

        // Update players position after array
        playerX += 1;
      }
    } else if (keyCode == UP)
    {  

      //Keeps player on screen
      if (playerY > 0) {

        // add at top
        // println("moving down");
        int row = playerY - 1;//start
        int col = playerX;
        while (col < playerX + PLAYER_WIDTH) {//end
          board[row][col] = board[row][col] * PLAYER;
          col += 1;
        }
        // clear at bottom
        row = playerY + PLAYER_HEIGHT - 1;//start
        col = playerX;
        while (col < playerX + PLAYER_WIDTH) {//end
          board[row][col] = board[row][col] / PLAYER;
          col += 1;
          if (keyCode == UP) {
            currentDirection = MOVING_UP;
            println("Up");
          }
        }
        //Update after board
        playerY -= 1;
      }
    } else if (keyCode == DOWN)
    {

      if (playerY < 182) {

        // add at bottom
        // println("moving down");
        int row = playerY + PLAYER_HEIGHT;//start
        int col = playerX;
        while (col < playerX + PLAYER_WIDTH) {//end
          board[row][col] = board[row][col] * PLAYER;
          col += 1;
        }
        // clear at top
        row = playerY;//start
        col = playerX;
        while (col < playerX + PLAYER_WIDTH) {//end
          board[row][col] = board[row][col] / PLAYER;
          col += 1;
          if (keyCode == DOWN) {
            currentDirection = MOVING_DOWN;
            println("Down");
          }
        }
        //Update after board refreshed
        playerY += 1;
      }
    }
  }

  if (currentDirection == MOVING_UP) {
    println("ChangeUP");
  }
  if (currentDirection == MOVING_DOWN) {
    println("ChangeDOWN");
  }
  if (currentDirection == MOVING_LEFT) {
    println("ChangeLEFT");
  }
  if (currentDirection == MOVING_RIGHT) {
    println("ChangeRIGHT");
  }
  println("Vertical position is: " + playerY);
}
