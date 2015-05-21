//Matthew Pritchard
//Snake
//May 14 2015

private static final int WALL = 2;
private static final int PLAYER = 3;
private static final int FOOD = 5;
private static final int OPEN_SPACE = 7;

int[][] board = new int[35][35];
int rowCounter;
int colCounter;

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
      } else if (board[row][column] == WALL * OPEN_SPACE) { // safe area 
        pixels[loc] = color(60, 80, 90);
      } else { 
        pixels[loc] = color(180, 80, 90);
      }
    }
    updatePixels();
  }
}
