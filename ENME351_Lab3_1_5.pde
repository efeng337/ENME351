import processing.serial.*; // add the serial library
Serial myPort; // the serial port to monitor
int time = 0;
void setup() {
 size(512, 512); // set the window size, size() also sets width and height variables
 // first argument = width, second argument = height
 printArray(Serial.list()); // list all available serial ports
 myPort = new Serial(this, Serial.list()[0], 9600); // define input port
 myPort.clear(); // clear the port of any initial junk
 fill(0, 0, 255); // pick the fill color (r,g,b)
 background(150);
}

void draw () {
  
 if(time <= 512){
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

   ellipse(time,y,6,6);
   time+=5; //1 per 10 msec
   delay(50);
   myPort.clear();
   }
  }
 }
 } else{
   background(150);
   time = 0;
 }
} 
