#pragma once

#include "ofxiOS.h"
#include "ofxFaceTracker.h"

class ofApp : public ofxiOSApp {
public:
  void setup();
  void update();
  void draw();
  void exit();
  
  void touchDown(ofTouchEventArgs & touch);
  void touchMoved(ofTouchEventArgs & touch);
  void touchUp(ofTouchEventArgs & touch);
  void touchDoubleTap(ofTouchEventArgs & touch);
  void touchCancelled(ofTouchEventArgs & touch);
  
  void lostFocus();
  void gotFocus();
  void gotMemoryWarning();
  void deviceOrientationChanged(int newOrientation);
  
private:
  ofVideoGrabber camera;
  ofxFaceTracker tracker;
  dispatch_queue_s* main_queue;
  dispatch_queue_s* background_queue;
  bool finish;
};


