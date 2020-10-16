
#define in1 8
#define in2 9
void setup() {
  // put your setup code here, to run once:
  pinMode(in1, OUTPUT);
  pinMode(in2, OUTPUT);
  
}
void turn(){
   digitalWrite(in1, HIGH);
    digitalWrite(in2, LOW);
}
void turnotherdirection(){
   digitalWrite(in1, LOW);
    digitalWrite(in2, HIGH);
}
void loop() {
  // put your main code here, to run repeatedly:
    turn();
    delay(3000);
    turnotherdirection();
    delay(3000);
  
}
