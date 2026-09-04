#include <Arduino.h>
#include <WiFi.h>
#include <PubSubClient.h>

const char* ssid = "ZON-47D0";
const char* pass = "cdabd8766a92";
const char* brokerUser = "";

void setupWifi(){
  delay(100);
  Serial.print("\nConnecting to ");
  Serial.println(ssid);

  WiFi.begin(ssid, pass);
  
  while(WiFi.status () != WL_CONNECTED){
    delay(100);
    Serial.print("-");
  }

  Serial.print("\nConnected to ");
  Serial.println(ssid);
}

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  setupWifi();
}

void loop() {
  // put your main code here, to run repeatedly:

}
