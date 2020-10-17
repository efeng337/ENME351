import processing.serial.*; // add the serial library
Serial myPort; // define a serial port object to monitor

// Define initial "time" coordinates of cursor location 
int x = 0;

// Data table and filename specifications
Table table;
String title = month()+"."+day()+"-"+hour()+"h"+minute()+"m-"+second()+"s"+".csv";

void setup() {
  size(1200, 612); // set the window size
  println(Serial.list()); // list all available serial ports
  myPort = new Serial(this, Serial.list()[0], 9600); // define input port
  myPort.clear(); // clear the port of any initial junk
 
 table = new Table(); // Create a table to save data as a csv file
  
 table.addColumn("id");
 table.addColumn("R");
 table.addColumn("C");

}

void draw () {
  
while (myPort.available () > 0) { // make sure port is open
  String inString = myPort.readStringUntil('\n'); // read input string
 textSize(32); //oscilloscope grid lines and labels
 text("5V", 0, 160);
 text("4V", 0, 240);
 text("3V", 0, 300);
 text("2V", 0, 380);
 text("1V", 0, 460);
 text("0V", 0, 530);
 line(0, 38, 1200, 38);
 line(0, 123, 1200, 123);
 line(0, 208, 1200, 208);
 line(0, 331, 1200, 331);
 line(0, 454, 1200, 454);
 line(0, 550, 1200, 550);
 fill(255, 0, 0);    //legend for Vout
 ellipse(200, 10, 10, 10); 
 text("Vout", 250, 30);
if (inString != null) { // ignore null strings
inString = trim(inString); // trim off any whitespace
String[] xyzaRaw = splitTokens(inString, "\t"); // extract x into an array
// proceed only if correct # of values extracted from the string:

if (xyzaRaw.length == 1) {
  
  int a = int(xyzaRaw[0]);
  
    a = int((float)a*(512.0/1024.0)); // note the type conversions

 TableRow newRow = table.addRow();
 newRow.setInt("id", table.lastRowIndex());
 newRow.setFloat("R", a);
    
  fill(255, 0, 0);    
  ellipse(x, 550-a, 10, 10); 
  println(a);

  x = x + 2;
 
  // Set the bounds inside with the cursor can translate
  // This prevents the cursor from moving off the screen
  if(x > 1200){
    background(225, 225, 225); // pick the fill color (r,g,b). Feel free to change this.
    x = 0;
  }
  
}
}
}

 // Save data to data.csv file on local computer
 //saveTable(table, "data.csv");
 
 // Save file to .csv file containing month, day, hour, minute, and second
 saveTable(table, title);

}
