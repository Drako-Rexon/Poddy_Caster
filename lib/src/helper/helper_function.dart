import 'package:shared_preferences/shared_preferences.dart';

class HelperFunction {
  static String userLoggedInKey = "LOGGEDINKEY";
  static String introDoneKey = "INTRODONEKEY";

  // * setter data
  static Future<void> setIntroDone(bool state) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(HelperFunction.introDoneKey, state);
  }

  static Future<void> setLoggedIn(bool state) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(HelperFunction.userLoggedInKey, state);
  }

  // * getter of data
  static Future<bool> getLoggedInStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(userLoggedInKey)!;
  }

  static Future<bool> getIntroDoneStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(introDoneKey)!;
  }
}
