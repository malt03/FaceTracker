#include "ofApp.h"

using namespace ofxCv;

//--------------------------------------------------------------
void ofApp::setup(){
  ofSetVerticalSync(false);
  ofSetFrameRate(0);
  camera.setDeviceID(1);
  camera.initGrabber(360, 480);
  camera.setDesiredFrameRate(30);
  
  tracker.setup();
  tracker.setRescale(0.25);
  tracker.setIterations(1);
  tracker.setAttempts(4);
  tracker.setClamp(4);
  tracker.setTolerance(0.1);
  tracker.setHaarMinSize(140);

  finish = true;
  background_queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
  main_queue = dispatch_get_main_queue();
}

//--------------------------------------------------------------
void ofApp::update(){
  camera.update();
  if (camera.isFrameNew()) {
    if (finish) {
      finish = false;
      auto tmp = toCv(camera);
      if (tracker.getFound()) {
        tracker.update(tmp);
        finish = true;
      } else {
        dispatch_async(background_queue, ^{
          tracker.update(tmp);
          finish = true;
        });
      }
    }
  }
}

//--------------------------------------------------------------
void ofApp::draw() {
  ofSetColor(255);
  camera.draw(0, 0);
  ofDrawBitmapString(ofToString((int) ofGetFrameRate()), 10, 20);
  
  if(tracker.getFound()) {
    tracker.draw();
  }
}

//--------------------------------------------------------------
void ofApp::exit(){

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){

}

//--------------------------------------------------------------
void ofApp::gotFocus(){

}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){

}
