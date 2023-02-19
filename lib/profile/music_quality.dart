import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast_app/_components/colors.dart';
import 'package:podcast_app/_components/data_for_dynamic.dart';
import 'package:podcast_app/_components/util_widgets.dart';

class MusicQuality extends StatefulWidget {
  MusicQuality({Key? key}) : super(key: key);

  @override
  State<MusicQuality> createState() => _MusicQualityState();
}

class _MusicQualityState extends State<MusicQuality> {
  List<bool> gapLess = [true, false];

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
          "Music Quality",
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
              "Streaming",
              () {},
              listAction: [
                Text(
                  "Automatic",
                  style: TextStyle(
                    color: pPrimaryTextColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            RegularCard(
              "Download using cellular",
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
                ),
              ],
            ),
            SizedBox(height: 10),
            RegularCard(
              "Equilizer",
              () {},
            ),
          ],
        ),
      ),
    );
  }
}
