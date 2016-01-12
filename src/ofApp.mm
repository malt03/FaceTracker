#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
  camera.setDeviceID(1);
  camera.initGrabber(320, 240);
  camera.setDesiredFrameRate(60);
}

//--------------------------------------------------------------
void ofApp::update(){
  camera.update();
}

//--------------------------------------------------------------
void ofApp::draw() {
  ofSetColor(255);
  camera.draw(0, 0);
  ofDrawBitmapString(ofToString((int) ofGetFrameRate()), 10, 20);
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
