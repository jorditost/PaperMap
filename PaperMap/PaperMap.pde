/**
 * PaperMap
 * This sketch converts a traditional paper map into an interface.
 * By folding and unfolding the map, you can control the zoom
 * of a digital replica of it. It uses Arduino and Unfolding Maps. 
 *
 * Prototyped in the ShapeChangingUI Workshop at ACE2014
 * http://shapechangingui.org/
 *
 * @author: Jordi Tost @jorditost
 * 
 * University of Applied Sciences Potsdam, 2014
 */

import processing.serial.*;
import cc.arduino.*;
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.providers.*;

UnfoldingMap map;

Arduino arduino;

int pinZoom1 = 3;
int pinZoom2 = 4;
int mapZoom = 13;

void setup() {
  size(displayWidth, displayHeight, P2D);

  //map = new UnfoldingMap(this); // Default map provider
  map = new UnfoldingMap(this, new Google.GoogleMapProvider());
  map.zoomAndPanTo(new Location(38.7418191f, -9.1067312f), mapZoom);
  map.setTweening(false);
  MapUtils.createDefaultEventDispatcher(this, map);
  
  arduino = new Arduino(this, Arduino.list()[4], 57600);
  //println(Arduino.list());
  
  arduino.pinMode(pinZoom1, Arduino.INPUT);
  arduino.pinMode(pinZoom2, Arduino.INPUT);
}

boolean sketchFullScreen() {
  return true;
}

void draw() {
  map.draw();
  
  /*if ( myPort.available() > 0) 
  {  // If data is available,
  val = myPort.readStringUntil('\n');         // read it and store it in val
  }*/
  
  int zoom1 = arduino.digitalRead(pinZoom1);
  int zoom2 = arduino.digitalRead(pinZoom2);
  
  if (zoom1 == 0 && zoom2 == 0) {
    map.zoomAndPanTo(new Location(38.7418191f, -9.1067312f), mapZoom);
  } else if (zoom1 == 1 && zoom2 == 0) {
    map.zoomAndPanTo(new Location(38.7283952f, -9.1125677f), mapZoom+1);
  } else {
    map.zoomAndPanTo(new Location(38.7159231f, -9.1290043f), mapZoom+2);
  }
  
  println("pin1: " + zoom1);
  println("pin2: " + zoom2);
}
