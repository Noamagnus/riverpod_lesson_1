import 'dart:ui';

var pixelRatio = window.devicePixelRatio;

//Size in physical pixels
var physicalScreenSize = window.physicalSize;
var physicalWidth = physicalScreenSize.width;
var physicalHeight = physicalScreenSize.height;

//Size in logical pixels
var logicalScreenSize = window.physicalSize / pixelRatio;
var logicalWidth = logicalScreenSize.width;
var logicalHeight = logicalScreenSize.height;

//Padding in physical pixels
var padding = window.padding;

//Safe area paddings in logical pixels
var paddingLeft = window.padding.left / window.devicePixelRatio;
var paddingRight = window.padding.right / window.devicePixelRatio;
var paddingTop = window.padding.top / window.devicePixelRatio;
var paddingBottom = window.padding.bottom / window.devicePixelRatio;

//Safe area in logical pixels
var safeWidth = logicalWidth - paddingLeft - paddingRight;
var safeHeight = logicalHeight - paddingTop - paddingBottom;

class Dimensions {
  // My screen is 640 logical pixels
  static double screenHeight = logicalHeight; //844 for iPhone12
  static double screenWidth = logicalWidth;

  static double pageView = logicalHeight / 2.64;
  static double pageViewContainer = logicalHeight / 3.84;
  static double pageViewTextContainer = logicalHeight / 7.03;
  static double actionScreenImage = logicalHeight / 2.56; //640/250
  
// ActionScreenDimensions
  static double imageActionScreen = logicalHeight / 3;

// Dynamic height
  static double height5 = logicalHeight / 168.8; //844/5
  static double height10 = logicalHeight / 84.4; //844/10
  static double height15 = logicalHeight / 56.27; //844/15
  static double height20 = logicalHeight / 42.2;
  static double height25 = logicalHeight / 33.76;
  static double height30 = logicalHeight / 28.13;
  static double height40 = logicalHeight / 21.1;
  static double height45 = logicalHeight / 18.76;
// Dynamic width
  static double width10 = logicalWidth / 84.4; //844/10
  static double width15 = logicalWidth / 56.27; //844/15
  static double width20 = logicalWidth / 42.2;
  static double width25 = logicalHeight / 33.76;
  static double width30 = logicalHeight / 28.13;
  static double width40 = logicalHeight / 21.1;
// Dynamic font size
  static double font20 = logicalHeight / 42.2;
  static double font26 = logicalHeight / 32.26;

// Dynamic radius size
  static double radius10 = logicalHeight / 84.4;
  static double radius20 = logicalHeight / 42.2;
  static double radius30 = logicalHeight / 28.13;
// Dynamic icon size (default font size in Flutter is 24)
  static double icon24 = logicalHeight / 35.17;
  static double icon16 = logicalHeight / 52.75;
}
