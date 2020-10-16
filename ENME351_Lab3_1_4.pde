import processing.serial.*; // add the serial library
Serial myPort; // the serial port to monitor
void setup() {
 size(512, 512); // set the window size, size() also sets width and height variables
 // first argument = width, second argument = height
 printArray(Serial.list()); // list all available serial ports
 myPort = new Serial(this, Serial.list()[0], 9600); // define input port
 myPort.clear(); // clear the port of any initial junk
 fill(0, 0, 255); // pick the fill color (r,g,b)
}

void draw () {
 if (myPort.available () > 0) { // make sure port is open
 String inString = myPort.readStringUntil('\n'); // read input string
 if (inString != null) { // ignore null strings
 inString = trim(inString); // trim off any whitespace
 String[] xyRaw = splitTokens(inString, ","); // extract x & y into an array
 // proceed only if correct # of values extracted from the string:
if (xyRaw.length == 2) {
 int x = int(xyRaw[0]);
 int y = int(xyRaw[1]);
 x = int((float)x*((float)width/1024.0)); // note the type conversions
 y = int((float)y*((float)height/1024.0));
 //prevents circle radius from crossing window boundary
   if(x < 28){ 
      x = 28;
   }
   if(x > width - 28){
      x = width - 28;     
   }
   if(y < 13){
      y = 13;     
   }
   if(y > height - 13){
     y = height - 13;
   }
   int r = x * 255/512; //red  (xpos * maxr/max xpos)
   int g = x * 255/512; //green (xpos * maxg/max xpos)
   int b = y * 255/512; //blue (ypos * maxb/max ypos)
   fill(r,g,b);
   ellipse(x, y, 56, 26); // draw an ellipse
   }
   }
 }
} 
