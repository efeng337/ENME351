int led = 9; //pin 9
void setup() {
  // put your setup code here, to run once: 
  pinMode(led, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly: 
  // first loop fades LED from on (onLength) to off (offLength)
  for(int onLength = 2000; onLength > 0; onLength -= 1){ //10 FAST, 5 MEDIUM, 1 SLOW
    digitalWrite(led, HIGH);
    delayMicroseconds(onLength);
    digitalWrite(led, LOW);
    delayMicroseconds(2000 - onLength);
  }
  //blink LED twice HERE with 1 sec intervals
  digitalWrite(led, HIGH);
  delay(1000);
  digitalWrite(led, LOW);
  delay(1000);
  digitalWrite(led, HIGH);
  delay(1000);
  digitalWrite(led, LOW);
  delay(1000);

  // second loop fades LED from off (offLength) to on (onLength)
  for(int offLength = 2000; offLength > 0; offLength -= 1){
    digitalWrite(led, HIGH);
    delayMicroseconds(2000 - offLength);
    digitalWrite(led, LOW);
    delayMicroseconds(offLength);
  }
  //blink LED twice HERE
  digitalWrite(led, LOW);
  delay(1000);
  digitalWrite(led, HIGH);
  delay(1000);
  digitalWrite(led, LOW);
  delay(1000);
  digitalWrite(led, HIGH); //extra HIGH and LOW added here to differentiate from beginning of next fade loop
  delay(1000);
  digitalWrite(led, LOW);
  delay(1000);
}
