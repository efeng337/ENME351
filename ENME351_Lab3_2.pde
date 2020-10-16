import processing.serial.*; // add the serial library
Serial myPort; // the serial port to monitor
int x = 100; //starting maze position x
int y = 604; //starting maze position y
PImage background; //maze background
void setup() {
 size(600, 604); // set the window size, size() also sets width and height variables
 // first argument = width, second argument = height
 printArray(Serial.list()); // list all available serial ports
 myPort = new Serial(this, Serial.list()[0], 9600); // define input port
 myPort.clear(); // clear the port of any initial junk
 background = loadImage("maze.jpg"); //maze background file
 background(background);
 fill(255,0,0);
}

void draw () {
   if (myPort.available () > 0) { // make sure port is open
   String inString = myPort.readStringUntil('\n'); // read input string
   if (inString != null) { // ignore null strings
   inString = trim(inString); // trim off any whitespace
   String[] xyRaw = splitTokens(inString, ","); // extract left,right,up, and down into an array
   // proceed only if correct # of values extracted from the string:
   if (xyRaw.length == 4) {
   int left = int(xyRaw[0]);
   int right = int(xyRaw[1]);
   int up = int(xyRaw[2]);
   int down = int(xyRaw[3]);
   //push button logic is inverted due to pull up resistor (push == 0, not pushed == 1)
   if(left == 0){
     x--;
   }
   if(right == 0){
     x++;
   }
   if(up == 0){
     y++;
   }
   if(down == 0){
     y--;
   }
   //ensures circle radius doesn't cross window boundary
   if(x < 6){
      x = 6;
   }
   if(x > width - 6){
      x = width - 6;     
   }
   if(y < 6){
      y = 0;     
   }
   if(y > height - 6){
     y = height - 6;
   }
   ellipse(x, y, 12, 12); // draws a circle
   }
  }
 }
}
