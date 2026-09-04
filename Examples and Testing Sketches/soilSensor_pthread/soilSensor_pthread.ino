#include<pthread.h>
const int motor = 0;
const int analogPin = 4;
const int vccSensor = 5;

volatile boolean enRega = 0;

void setup() {
  // put your setup code here, to run once:
  pthread_t thread;
  Serial.begin(9600);
  pinMode(analogPin, INPUT);
  pinMode(vccSensor, OUTPUT);
  pinMode(motor, OUTPUT);
  digitalWrite(analogPin, LOW);
  digitalWrite(motor, LOW);
  analogReadResolution(10);

  pthread_create(&thread, NULL, rega, NULL);

}

void *rega(void *arg){

  while(1){
    if(enRega ==1){
        Serial.println("Solo Seco!");
        Serial.println("A regar...");
        digitalWrite(motor, HIGH);
  
        delay(5000);
  
        digitalWrite(motor, LOW);
        Serial.println("Rega Terminada!");
        enRega = 0;
    }
    delay(50); //Delay com função de yield para esp executar funções background
  }
}


void loop() {
  int humid = 0;
  int aux = 0;
    //Leitura Sensor
    digitalWrite(vccSensor, HIGH);
    delay(100);
    for(int i= 0; i<50; i++){
      humid = analogRead(analogPin);
      aux = aux + humid;
    }
    humid = (aux/50);
    humid = map(humid, 300, 1023, 100, 0); //Conversão para percentagem
    delay(50);
    digitalWrite(vccSensor, LOW);
    delay(1000);
    //Apresentação valor Humidade 0 - 200 (+/-)
    Serial.print("Humidade solo: ");
    Serial.print(humid); Serial.println(" %");
    
    if(humid<40 && enRega == 0){
      // rc = pthread_create(&thread, NULL, rega, NULL);
      enRega = 1;
    }else if(humid >= 40){
      Serial.println("Solo Húmido !");
    }

}

   
