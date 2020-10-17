int ledTotal = 5; //total number of LEDs
int ledPin[] = {2,4,7,8,12}; 
int ledDelay; 
int direction = 1; //direction LEDs will flash
int currentLED = 0; //index 0
unsigned long time;
int potPin = 0; //potentiometer

void setup() {
  // put your setup code here, to run once:
  // turns all LEDs to OUTPUT mode
  for(int i = 0; i < ledTotal; i++){
    pinMode(ledPin[i], OUTPUT);
  }
  time = millis(); //time delay
}

// Turns LED on and off one at a time
void switchLED(){
  // turns all LED off
  for(int i = 0; i < ledTotal; i++){
    digitalWrite(ledPin[i], LOW);
  }
  digitalWrite(ledPin[currentLED], HIGH); // turns one LED on
  //determines what direction LED should travel
  currentLED += direction; 
  if(currentLED == ledTotal - 1){
    direction-=1;
  }
  if(currentLED == 0){
    direction = 1;
  }
}
void loop() {
  // put your main code here, to run repeatedly:
  // potentiometer controls delay of LED turning on and off
  ledDelay = analogRead(potPin);
  if((millis() - time) > ledDelay){
    switchLED();
    time = millis();
  }
}
