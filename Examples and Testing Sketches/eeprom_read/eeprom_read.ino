#include <EEPROM.h>
#define EEPROM_SIZE 1

int x = 0;
int storedx = 0;

void setup() {
  Serial.begin(115200);
  EEPROM.begin(EEPROM_SIZE);
}

void loop() {
  storedx = EEPROM.read(0);
  Serial.print("The value of stored value is ");
  Serial.println(storedx);
  Serial.print("The current value of x is ");
  Serial.println(x);

  if(((x%5) == 0) && (x > 0)){
    EEPROM.write(0,x);
    EEPROM.commit();
  }
  x++;
  delay(1000);
}
