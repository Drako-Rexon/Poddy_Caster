import 'package:get/get.dart';

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
  static double height50 = screenHeight / 15.62;

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

  // ! Text Size
  static double textSize8 = screenHeight / 49.1;
  static double textSize12 = screenHeight / 32.73;
  static double textSize18 = screenHeight / 21.82;
  static double textSize24 = screenHeight / 16.36;
}
