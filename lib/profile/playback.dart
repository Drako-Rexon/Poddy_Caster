import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:podcast_app/_components/colors.dart';
import 'package:podcast_app/_components/data_for_dynamic.dart';
import 'package:podcast_app/_components/util_widgets.dart';

class Playback extends StatefulWidget {
  Playback({Key? key}) : super(key: key);

  @override
  State<Playback> createState() => _PlaybackState();
}

class _PlaybackState extends State<Playback> {
  List<bool> gapLess = [true, false];
  List<bool> autoMix = [false, true];
  List<bool> showUnplaySongs = [true, false];
  List<bool> normalVol = [true, false];
  List<bool> autoPlay = [true, false];
  List<bool> canvas = [true, false];

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
          "Playback",
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
            SizedBox(height: 30),
            RegularCard(
              "Gapless",
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
              "Automix",
              () {},
              listAction: [
                Container(
                  height: 30,
                  child: ToggleButtons(
                    borderRadius: BorderRadius.circular(10),
                    renderBorder: false,
                    color: pCustomGrey,
                    fillColor: pDarkPink,
                    selectedColor: pWhite,
                    splashColor: pLightPink,
                    children: [Text("ON"), Text("OFF")],
                    isSelected: autoMix,
                    onPressed: (int newInd) {
                      setState(() {
                        for (int i = 0; i < autoMix.length; i++) {
                          newInd == i ? autoMix[i] = true : autoMix[i] = false;
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            RegularCard(
              "Show Unplayable Songs",
              () {},
              listAction: [
                Container(
                  height: 30,
                  child: ToggleButtons(
                    borderRadius: BorderRadius.circular(10),
                    renderBorder: false,
                    color: pCustomGrey,
                    fillColor: pDarkPink,
                    selectedColor: pWhite,
                    splashColor: pLightPink,
                    children: [Text("ON"), Text("OFF")],
                    isSelected: showUnplaySongs,
                    onPressed: (int newInd) {
                      setState(() {
                        for (int i = 0; i < showUnplaySongs.length; i++) {
                          newInd == i
                              ? showUnplaySongs[i] = true
                              : showUnplaySongs[i] = false;
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            RegularCard(
              "Normalize Volume",
              () {},
              listAction: [
                Container(
                  height: 30,
                  child: ToggleButtons(
                    borderRadius: BorderRadius.circular(10),
                    renderBorder: false,
                    color: pCustomGrey,
                    fillColor: pDarkPink,
                    selectedColor: pWhite,
                    splashColor: pLightPink,
                    children: [Text("ON"), Text("OFF")],
                    isSelected: normalVol,
                    onPressed: (int newInd) {
                      setState(() {
                        for (int i = 0; i < normalVol.length; i++) {
                          newInd == i
                              ? normalVol[i] = true
                              : normalVol[i] = false;
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            RegularCard(
              "Autoplay",
              () {},
              listAction: [
                Container(
                  height: 30,
                  child: ToggleButtons(
                    borderRadius: BorderRadius.circular(10),
                    renderBorder: false,
                    color: pCustomGrey,
                    fillColor: pDarkPink,
                    selectedColor: pWhite,
                    splashColor: pLightPink,
                    children: [Text("ON"), Text("OFF")],
                    isSelected: autoPlay,
                    onPressed: (int newInd) {
                      setState(() {
                        for (int i = 0; i < autoPlay.length; i++) {
                          newInd == i
                              ? autoPlay[i] = true
                              : autoPlay[i] = false;
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            RegularCard(
              "Canvas",
              () {},
              listAction: [
                Container(
                  height: 30,
                  child: ToggleButtons(
                    borderRadius: BorderRadius.circular(10),
                    renderBorder: false,
                    color: pCustomGrey,
                    fillColor: pDarkPink,
                    selectedColor: pWhite,
                    splashColor: pLightPink,
                    children: [Text("ON"), Text("OFF")],
                    isSelected: canvas,
                    onPressed: (int newInd) {
                      setState(() {
                        for (int i = 0; i < canvas.length; i++) {
                          newInd == i ? canvas[i] = true : canvas[i] = false;
                        }
                      });
                    },
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
