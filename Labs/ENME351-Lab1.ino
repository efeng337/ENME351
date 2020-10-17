void setup() {
  pinMode(8, OUTPUT);
  pinMode(4, OUTPUT);
  
}
int counter = 0;
void loop() {

  if(digitalRead(4) == HIGH){
    digitalWrite(4, LOW);
  } 
  else{
    digitalWrite(4, HIGH);
  }
 
  if(counter < 20){
    counter = counter + 1;
  }
  else if(counter == 20){
    if(digitalRead(8) == HIGH){
    digitalWrite(8, LOW);
    } 
    else{
    digitalWrite(8, HIGH);
    }
    counter = 0;
  }
  
  delay(100);

}
