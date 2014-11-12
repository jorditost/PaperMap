/**
 * This is a test for the physical computing part of the PaperMap sketch.
 * 
 * Prototyped in the ShapeChangingUI Workshop at ACE2014
 *
 * @author: Jordi Tost @jorditost
 *
 * University of Applied Sciences Potsdam, 2014
 */
 
int pinZoom1 = 3;
int pinZoom2 = 4;

void setup() {  
  pinMode(pinZoom1, INPUT);
  pinMode(pinZoom2, INPUT);
  
  Serial.begin(9600);
}

void loop() {
    int zoom1 = digitalRead(pinZoom1);
    int zoom2 = digitalRead(pinZoom2);
    Serial.println(zoom1);
    Serial.println(zoom2);
}
