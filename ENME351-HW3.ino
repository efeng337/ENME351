mint terps[5] = {3, 9, 10, 1, 4}; 
void printArray(int arrayToPrint[], int arraySize){
  for(int i = 0; i < arraySize; i++){
    Serial.print("[");
    Serial.print(i);
    Serial.print("]: ");
    Serial.println(arrayToPrint[i]);
  }
}
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  printArray(terps, sizeof(terps)/sizeof(int));
  delay(1000);
}
