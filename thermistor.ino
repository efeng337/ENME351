int Vout = 5; //analog
unsigned long startMillis;
String ADCString;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(Vout, INPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  ADCString = analogRead(Vout); //read in Vout from thermistor 
  Serial.println(ADCString);
  delay(50);
}
