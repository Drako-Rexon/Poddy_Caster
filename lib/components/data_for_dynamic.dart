import 'package:flutter/material.dart';
import 'package:get/get.dart';

// screen height is basically 781.1
// screen  is basically 392.72
class SizeForDynamic {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  // ! This data is for dynamic height
  static double height5 = screenHeight / 156.2;
  static double height10 = screenHeight / 78.11;
  static double height15 = screenHeight / 52.07;
  static double height20 = screenHeight / 39.05;
  static double height25 = screenHeight / 31.25;
  static double height30 = screenHeight / 26.03;
  static double height35 = screenHeight / 22.32;
  static double height40 = screenHeight / 19.53;
  static double height50 = screenHeight / 15.62;
  static double height60 = screenHeight / 13.02;
  static double height70 = screenHeight / 11.16;
  static double height80 = screenHeight / 9.76;

  // ! This data is for dynamic width
  static double width5 = screenWidth / 78.54;
  static double width10 = screenWidth / 39.27;
  static double width15 = screenWidth / 26.2;
  static double width20 = screenWidth / 19.63;
  static double width25 = screenWidth / 15.7;
  static double width30 = screenWidth / 13.1;
  static double width35 = screenWidth / 11.22;
  static double width40 = screenWidth / 9.82;
  static double width50 = screenWidth / 7.85;
  static double width70 = screenWidth / 5.61;

  // ! Text Size
  // static double textSizeTrick8 = 8 * (pow(1.01, screenHeight) / 49.1);
  static double textSize8 = screenHeight / 97.64;
  static double textSize10 = screenHeight / 78.11;
  static double textSize12 = screenHeight / 65.1;
  static double textSize18 = screenHeight / 21.82;
  static double textSize24 = screenHeight / 32.5;
}

//! Thi is for colors

class ColorsForApp {
  static const Color cutomWhite = Colors.white;
  static const Color cutomBlack = Colors.black;

  static final Color cutomTextColor = Color(0xFF7477A0);
  static final Color buttonGradientColor1 = Color(0xFFFB6580);
  static final Color buttonGradientColor2 = Color(0xFFF11775);
  static final Color backGradientColor1 = Color(0xFF2D2C3C);
  static final Color backGradientColor2 = Color(0xFF191925);
  static final Color backgroundAppColor = Color(0xFF2D2C3C);
  static final Color forgroundAppColor = Color(0xFF181A26);
  static final Color fbColor = Color(0xFF3d599f);
  static final Color customGrey = Color(0xFF5C5E6F);
  static final Color darkPurple = Color(0xFF0B0B15);

  // static final Color appPinkColor = Color(0xFFFB6580);

}
