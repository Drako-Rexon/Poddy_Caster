import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:podcast_app/_components/colors.dart';
import 'package:podcast_app/_components/data_for_dynamic.dart';
import 'package:podcast_app/_components/util_widgets.dart';

class Social extends StatefulWidget {
  Social({Key? key}) : super(key: key);

  @override
  State<Social> createState() => _SocialState();
}

class _SocialState extends State<Social> {
  List<bool> gapLess = [true, false];
  List<bool> listAct = [true, false];

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
          "Social",
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
            SizedBox(height: 30),
            RegularCard(
              "Private Session",
              () {},
              listAction: [
                Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: ToggleButtons(
                    renderBorder: false,
                    color: pCustomGrey,
                    borderRadius: BorderRadius.circular(10),
                    fillColor: pDarkPink,
                    selectedColor: pWhite,
                    children: [Text("ON"), Text("OFF")],
                    isSelected: gapLess,
                    onPressed: (int newInd) {
                      setState(() {
                        for (int i = 0; i < gapLess.length; i++) {
                          newInd == i ? gapLess[i] = true : gapLess[i] = false;
                        }
                      });
                    },
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            RegularCard(
              "Listening Activity",
              () {},
              listAction: [
                Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: ToggleButtons(
                    renderBorder: false,
                    color: pCustomGrey,
                    borderRadius: BorderRadius.circular(10),
                    fillColor: pDarkPink,
                    selectedColor: pWhite,
                    children: [Text("ON"), Text("OFF")],
                    isSelected: listAct,
                    onPressed: (int newInd) {
                      setState(() {
                        for (int i = 0; i < listAct.length; i++) {
                          newInd == i ? listAct[i] = true : listAct[i] = false;
                        }
                      });
                    },
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            RegularCard(
              "Connect to Facebook",
              () {},
              listLead: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/facebook.png',
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            RegularCard(
              "Connect to Google",
              () {},
              listLead: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/google-png.png',
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
