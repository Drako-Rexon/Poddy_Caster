import 'package:flutter/material.dart';

// screen height is basically 781.1
// screen width is basically 392.72

class AppConfig {
  static double screenHeight = 781.1; //  Get.context!.height;
  static double screenWidth = 392.72; // Get.context!.width;
  // static double screenHeight = Get.context!.height;
  // static double screenWidth = Get.context!.width;

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
  static double height308 = screenHeight / 2.54;

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
  static double width60 = screenWidth / 6.53;
  static double width70 = screenWidth / 5.61;

  // ! Text Size
  // static double textSizeTrick8 = 8 * (pow(1.01, screenHeight) / 49.1);
  static double textSize8 = screenHeight / 97.64;
  static double textSize10 = screenHeight / 78.11;
  static double textSize12 = screenHeight / 65.1;
  static double textSize14 = screenHeight / 55.8;
  static double textSize18 = screenHeight / 43.4;
  static double textSize24 = screenHeight / 32.55;
  static double textSize36 = screenHeight / 21.7;
}

//! This is for colors

class ColorsForApp {
  static const Color customWhite = Colors.white;
  static const Color customBlack = Colors.black;

  static const Color cutomTextColor = Color(0xFF7477A0);
  static const Color buttonGradientColor1 = Color(0xFFFB6580);
  static const Color buttonGradientColor2 = Color(0xFFF11775);
  static const Color backGradientColor1 = Color(0xFF2D2C3C);
  static const Color backGradientColor2 = Color(0xFF191925);
  static const Color backgroundAppColor = Color(0xFF2D2C3C);
  static const Color forgroundAppColor = Color(0xFF181A26);
  static const Color fbColor = Color(0xFF3d599f);
  static const Color customGrey = Color(0xFF5C5E6F);
  static const Color darkPurple = Color(0xFF0B0B15);
  static const Color commonBackGround = Color(0xFF13131A);
  static const Color backImagRadial1 = Color(0xFF14174E);
  static const Color backImagRadial2 = Color(0xFF141535);
  static const Color backImagRadial3 = Color(0xFF14121C);

  // static final Color appPinkColor = Color(0xFFFB6580);
}
