import 'package:flutter/material.dart';

class SizeConfig{
  static MediaQueryData?  mediaQueryData;
  static double? screenHeight;
  static double? screenWidth;


  static void init(BuildContext context){
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData?.size.width;
    screenHeight = mediaQueryData?.size.height;
  }
}



// double? getProportionalWidth(double inputWidth){
//   double? screenWidth  = SizeConfig.screenWidth;

//   return (inputWidth/375) * screenWidth!;
// }

// double? getProportionalHeight(double inputHeight){
//   double? screenHeight = SizeConfig.screenHeight;

//   return (inputHeight/812) * screenHeight!;

// }



double? getProportionalWidth(double inputWidth){
  double width = 375;
  double? screenWidth  = SizeConfig.screenWidth;
  double dividedValue= width/inputWidth;

  return (screenWidth!/dividedValue);
}

double? getProportionalHeight(double inputHeight){
  double height = 844;
  double? screenHeight = SizeConfig.screenHeight;
  double dividedValue= height/inputHeight;
  

  return (screenHeight!/dividedValue);

}