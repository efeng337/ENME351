void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  //initializing internal pull up resistors
  pinMode(2, INPUT_PULLUP); 
  pinMode(4, INPUT_PULLUP);
  pinMode(7, INPUT_PULLUP);
  pinMode(8, INPUT_PULLUP);
}

void loop() {
  // put your main code here, to run repeatedly:
  int left = digitalRead(2);
  int up = digitalRead(4);
  int down = digitalRead(7);
  int right = digitalRead(8);

  String buttonString = String(left) + "," + String(right)+ "," + String(up)+ "," + String(down);
  Serial.println(buttonString); // observe button states via serial monitor
  delay(100); // add delay to avoid over-filling serial buffer
}
