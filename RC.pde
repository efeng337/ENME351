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
  myPort = new Serial(this, Serial.list()[0], 115200); // define input port
  myPort.clear(); // clear the port of any initial junk
 
 table = new Table(); // Create a table to save data as a csv file
  
 table.addColumn("id");
 table.addColumn("R");
 table.addColumn("C");

}

void draw () {
  
while (myPort.available () > 0) { // make sure port is open
  String inString = myPort.readStringUntil('\n'); // read input string
 textSize(32); //creation of oscilloscope grid lines and labels
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
 fill(255, 0, 0);    //creation of Vin and Vc legend
 ellipse(200, 10, 10, 10); 
 text("Vin", 250, 30);
 fill(0, 255, 0);    
 ellipse(400, 10, 10, 10);
 text("Vc", 450, 30);
if (inString != null) { // ignore null strings
inString = trim(inString); // trim off any whitespace
String[] xyzaRaw = splitTokens(inString, "\t"); // extract x & y into an array
// proceed only if correct # of values extracted from the string:

if (xyzaRaw.length == 2) {
  
  int a1 = int(xyzaRaw[0]); //Vin
  int a2 = int(xyzaRaw[1]); //Vc
  
    a1 = int((float)a1*(512.0/1024.0)); // note the type conversions
    a2 = int((float)a2*(512.0/1024.0));

 TableRow newRow = table.addRow();
 newRow.setInt("id", table.lastRowIndex());
 newRow.setFloat("R", a1);
 newRow.setFloat("C", a2);
    
  fill(255, 0, 0);    //plots Vin
  ellipse(x, 550-a1, 10, 10); 
  println(a1);
  
  fill(0, 255, 0);    //plots Vc
  ellipse(x, 550-a2, 10, 10); 
  println(a2);

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
