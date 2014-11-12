

int zoom1 = 0;
int zoom2 = 0;

int led1 = 8;
int led2 = 11;

int pinZoom1 = 3;
int pinZoom2 = 5;

void setup() {
  
  pinMode(led1, OUTPUT);
  pinMode(led2, OUTPUT);
  
  Serial.begin(9600);
  // put your setup code here, to run once:

}

void loop() {
  zoom1 = readCapacitivePin(pinZoom1);
  zoom2 = readCapacitivePin(pinZoom2);
  
  // put your main code here, to run repeatedly:
  Serial.println(zoom1);
  Serial.println(zoom2);
  
  if (zoom1 > 10) {
    digitalWrite(led1, HIGH);
  } else {
    digitalWrite(led1, LOW);
  }
  
  if (zoom2 > 10) {
    digitalWrite(led2, HIGH);
  } else {
    digitalWrite(led2, LOW);
  }
}
