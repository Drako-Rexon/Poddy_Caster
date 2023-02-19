import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast_app/_components/colors.dart';
import 'package:podcast_app/_components/data_for_dynamic.dart';
import 'package:podcast_app/_components/util_widgets.dart';

class ConnToDevice extends StatelessWidget {
  const ConnToDevice({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pBackground,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
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
      body: Container(
        width: AppConfig.screenWidth,
        child: Column(
          children: [
            SizedBox(height: 10),
            RegularCard(
              "Computer",
              () {},
              listLead: [
                Container(
                  height: 30,
                  width: 30,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFEA4335),
                  ),
                  child: Image.asset('assets/images/computer.png'),
                ),
              ],
            ),
            SizedBox(height: 10),
            RegularCard(
              "Computer",
              () {},
              listLead: [
                Container(
                  height: 30,
                  width: 30,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFBBC04),
                  ),
                  child: Image.asset(
                    'assets/images/tv.png',
                    height: 18,
                    width: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            RegularCard(
              "Computer",
              () {},
              listLead: [
                Container(
                  height: 30,
                  width: 30,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF9D00FF),
                  ),
                  child: Image.asset(
                    'assets/images/wifi.png',
                    height: 20,
                    width: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            RegularCard(
              "Computer",
              () {},
              listLead: [
                Container(
                  height: 30,
                  width: 30,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF34A853),
                  ),
                  child: Image.asset(
                    'assets/images/chromecast.png',
                    height: 20,
                    width: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            RegularCard(
              "Computer",
              () {},
              listLead: [
                Container(
                  height: 30,
                  width: 30,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF0083FD),
                  ),
                  child: Image.asset(
                    'assets/images/bluetooth.png',
                    height: 20,
                    width: 20,
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
