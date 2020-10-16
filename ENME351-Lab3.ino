void setup() {
 Serial.begin(9600);
}
void loop() {
 int xPot = analogRead(4);
 int yPot = analogRead(5);
 String xyString = String(xPot) + "," + String(yPot);
 Serial.println(xyString); // observe "x,y" via serial monitor
 delay(50); // add delay to avoid over-filling serial buffer
} 
