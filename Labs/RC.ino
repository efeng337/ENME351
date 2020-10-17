int pinPower = 2; //digital 
int Vin = 4; //analog
int Vc = 5; //analog
float R = 100000; //Ohms
float C = 10 * pow(10, -6); //Farads
unsigned long startMillis; 
String ADCString;
float period = (R*C*1000)/50; //reading period
void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  pinMode(pinPower, OUTPUT);
  pinMode(Vin, INPUT);
  pinMode(Vc, INPUT);
  digitalWrite(pinPower,LOW); //discharge capacitor for 5 secs
  delay(5000);
}

void loop() {
  // put your main code here, to run repeatedly:
  startMillis = millis();
  digitalWrite(pinPower, HIGH); //power on
  while(millis() - startMillis < 10000*R*C){ 
    ADCString = String(analogRead(Vin)) + "\t" + String(analogRead(Vc));
    Serial.println(ADCString);
    delay(period); //send readings every period
  }
  startMillis = millis();
  digitalWrite(pinPower, LOW); //power off
  while(millis() - startMillis < 10000*R*C){
    ADCString = String(analogRead(Vin)) + "\t" + String(analogRead(Vc));
    Serial.println(ADCString);
    delay(period);
  }
}
