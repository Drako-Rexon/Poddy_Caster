import 'package:flutter/material.dart';
import 'package:poddy_caster/src/utils/colors.dart';
import 'package:poddy_caster/src/utils/data_for_dynamic.dart';
import 'package:poddy_caster/src/utils/util_widgets.dart';
import 'package:poddy_caster/src/utils/important_functions.dart';

class ConnToDevice extends StatelessWidget {
  const ConnToDevice({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pBackground,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            popScreen(context);
          },
          color: pLightPink,
        ),
        backgroundColor: pBackground,
        title: Text(
          "Connect to device",
          style: TextStyle(
            color: pWhite,
            fontSize: AppConfig.textSize24,
          ),
        ),
      ),
      body: SizedBox(
        width: AppConfig.screenWidth,
        child: Column(
          children: [
            SizedBox(height: AppConfig.height10),
            RegularCard(
              "Computer",
              () {},
              listLead: [
                Container(
                  height: AppConfig.height30,
                  width: AppConfig.width30,
                  padding: EdgeInsets.all(AppConfig.height5 + 2),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFEA4335),
                  ),
                  child: Image.asset(
                    'assets/images/computer.png',
                    height: AppConfig.height20,
                    width: AppConfig.width20,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppConfig.height10),
            RegularCard(
              "Computer",
              () {},
              listLead: [
                Container(
                  height: AppConfig.height30,
                  width: AppConfig.width30,
                  padding: EdgeInsets.all(AppConfig.height5 + 2),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFBBC04),
                  ),
                  child: Image.asset(
                    'assets/images/tv.png',
                    height: AppConfig.height20,
                    width: AppConfig.width20,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppConfig.height10),
            RegularCard(
              "Computer",
              () {},
              listLead: [
                Container(
                  height: AppConfig.height30,
                  width: AppConfig.width30,
                  padding: EdgeInsets.all(AppConfig.height5 + 2),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF9D00FF),
                  ),
                  child: Image.asset(
                    'assets/images/wifi.png',
                    height: AppConfig.height20,
                    width: AppConfig.width20,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppConfig.height10),
            RegularCard(
              "Computer",
              () {},
              listLead: [
                Container(
                  height: AppConfig.height30,
                  width: AppConfig.width30,
                  padding: EdgeInsets.all(AppConfig.height5 + 2),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF34A853),
                  ),
                  child: Image.asset(
                    'assets/images/chromecast.png',
                    height: AppConfig.height20,
                    width: AppConfig.width20,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppConfig.height10),
            RegularCard(
              "Computer",
              () {},
              listLead: [
                Container(
                  height: AppConfig.height30,
                  width: AppConfig.width30,
                  padding: EdgeInsets.all(AppConfig.height5 + 2),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF0083FD),
                  ),
                  child: Image.asset(
                    'assets/images/bluetooth.png',
                    height: AppConfig.height20,
                    width: AppConfig.width20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
