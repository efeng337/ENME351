int sensorState=0;
void setup() {
  // put your setup code here, to run once:
  pinMode(2,INPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  Serial.begin(9600);
  sensorState=digitalRead(2);

  Serial.println(sensorState);
  delay(100);
  
}
