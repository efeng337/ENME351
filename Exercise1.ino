int valPot = 0; //potentiometer value
int valScope = 0; //nScope value
int pinPot = A0; 
int nScope = A1;
unsigned long startTime;
unsigned long currentTime;
float fs = 0; // fs [Hz] = 1000 / dt 
float dt = 0; //[ms]
void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
}

void loop() {
  // put your main code here, to run repeatedly:
  startTime = micros(); //start time read
  valPot = analogRead(pinPot);
  
  if(valPot >= 0 && valPot <= 255){ //adjusting fs based on potentiometer value
    fs = 100; 
  }
  else if(valPot >= 256 && valPot <= 510){
    fs = 142; 
  }
  else if(valPot >= 511 && valPot <= 765){
    fs = 200; 
  }
  else{
    fs = 500;
  }
  
  dt = (1000/fs) * 1000; //[microsec]
  valScope = analogRead(nScope);
  currentTime = micros(); //end time
  Serial.println(valScope); 
  delayMicroseconds(dt - (currentTime - startTime)); //makes up for delay from if statements in arduino 
 
}
