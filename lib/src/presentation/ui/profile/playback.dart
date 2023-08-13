import 'package:flutter/material.dart';
import 'package:poddy_caster/_components/colors.dart';
import 'package:poddy_caster/src/utils/data_for_dynamic.dart';
import 'package:poddy_caster/src/utils/util_widgets.dart';

class Playback extends StatefulWidget {
  const Playback({Key? key}) : super(key: key);

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
  List<String> name = [
    "Gapless",
    "Automix",
    "Show Unplayable Songs",
    "Normalize Volume",
    "Autoplay",
    "Canvas",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pBackground,
      appBar: AppBar(
        elevation: 0,
        leading: const BackArrow(),
        backgroundColor: pBackground,
        title: Text(
          "Playback",
          style: TextStyle(
            color: pWhite,
            fontSize: AppConfig.textSize24,
          ),
        ),
      ),
      body: SizedBox(
        height: double.maxFinite,
        width: AppConfig.screenWidth,
        child: Column(
          children: [
            SizedBox(
              height: double.maxFinite - 10,
              width: AppConfig.screenWidth,
              child: ListView.builder(
                itemCount: name.length,
                itemBuilder: (BuildContext context, int ind) {
                  return Column(
                    children: [
                      RegularCardToggle(
                        name[ind],
                        () {
                          // val.switchGapless();
                        },
                        status: true, // playbackController.gapless,
                      ),
                      SizedBox(height: AppConfig.height10),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        // Column(
        //   children: [
        // const SizedBox(height: 30),
        // RegularCard(
        //   "Gapless",
        //   () {},
        //   listAction: [
        //     Container(
        //       height: 30,
        //       width: 100,
        //       decoration: const BoxDecoration(
        //         borderRadius: BorderRadius.all(Radius.circular(30)),
        //       ),
        //       child: ToggleButtons(
        //         renderBorder: false,
        //         color: pCustomGrey,
        //         borderRadius: BorderRadius.circular(10),
        //         fillColor: pDarkPink,
        //         selectedColor: pWhite,
        //         isSelected: gapLess,
        //         onPressed: (int newInd) {
        //           setState(() {
        //             for (int i = 0; i < gapLess.length; i++) {
        //               newInd == i ? gapLess[i] = true : gapLess[i] = false;
        //             }
        //           });
        //         },
        //         children: const [Text("ON"), Text("OFF")],
        //       ),
        //     ),
        //   ],
        // ),
        // SizedBox(height: AppConfig.height10),
        // RegularCard(
        //   "Automix",
        //   () {},
        //   listAction: [
        //     SizedBox(
        //       height: 30,
        //       child: ToggleButtons(
        //         borderRadius: BorderRadius.circular(10),
        //         renderBorder: false,
        //         color: pCustomGrey,
        //         fillColor: pDarkPink,
        //         selectedColor: pWhite,
        //         splashColor: pLightPink,
        //         isSelected: autoMix,
        //         onPressed: (int newInd) {
        //           setState(() {
        //             for (int i = 0; i < autoMix.length; i++) {
        //               newInd == i ? autoMix[i] = true : autoMix[i] = false;
        //             }
        //           });
        //         },
        //         children: const [Text("ON"), Text("OFF")],
        //       ),
        //     ),
        //   ],
        // ),
        // SizedBox(height: AppConfig.height10),
        // RegularCard(
        //   "Show Unplayable Songs",
        //   () {},
        //   listAction: [
        //     SizedBox(
        //       height: 30,
        //       child: ToggleButtons(
        //         borderRadius: BorderRadius.circular(10),
        //         renderBorder: false,
        //         color: pCustomGrey,
        //         fillColor: pDarkPink,
        //         selectedColor: pWhite,
        //         splashColor: pLightPink,
        //         isSelected: showUnplaySongs,
        //         onPressed: (int newInd) {
        //           setState(() {
        //             for (int i = 0; i < showUnplaySongs.length; i++) {
        //               newInd == i
        //                   ? showUnplaySongs[i] = true
        //                   : showUnplaySongs[i] = false;
        //             }
        //           });
        //         },
        //         children: const [Text("ON"), Text("OFF")],
        //       ),
        //     ),
        //   ],
        // ),
        // SizedBox(height: AppConfig.height10),
        // RegularCard(
        //   "Normalize Volume",
        //   () {},
        //   listAction: [
        //     SizedBox(
        //       height: 30,
        //       child: ToggleButtons(
        //         borderRadius: BorderRadius.circular(10),
        //         renderBorder: false,
        //         color: pCustomGrey,
        //         fillColor: pDarkPink,
        //         selectedColor: pWhite,
        //         splashColor: pLightPink,
        //         isSelected: normalVol,
        //         onPressed: (int newInd) {
        //           setState(() {
        //             for (int i = 0; i < normalVol.length; i++) {
        //               newInd == i
        //                   ? normalVol[i] = true
        //                   : normalVol[i] = false;
        //             }
        //           });
        //         },
        //         children: const [Text("ON"), Text("OFF")],
        //       ),
        //     ),
        //   ],
        // ),
        // SizedBox(height: AppConfig.height10),
        // RegularCard(
        //   "Autoplay",
        //   () {},
        //   listAction: [
        //     SizedBox(
        //       height: 30,
        //       child: ToggleButtons(
        //         borderRadius: BorderRadius.circular(10),
        //         renderBorder: false,
        //         color: pCustomGrey,
        //         fillColor: pDarkPink,
        //         selectedColor: pWhite,
        //         splashColor: pLightPink,
        //         isSelected: autoPlay,
        //         onPressed: (int newInd) {
        //           setState(() {
        //             for (int i = 0; i < autoPlay.length; i++) {
        //               newInd == i
        //                   ? autoPlay[i] = true
        //                   : autoPlay[i] = false;
        //             }
        //           });
        //         },
        //         children: const [Text("ON"), Text("OFF")],
        //       ),
        //     ),
        //   ],
        // ),
        // SizedBox(height: AppConfig.height10),
        // RegularCard(
        //   "Canvas",
        //   () {},
        //   listAction: [
        //     SizedBox(
        //       height: 30,
        //       child: ToggleButtons(
        //         borderRadius: BorderRadius.circular(10),
        //         renderBorder: false,
        //         color: pCustomGrey,
        //         fillColor: pDarkPink,
        //         selectedColor: pWhite,
        //         splashColor: pLightPink,
        //         isSelected: canvas,
        //         onPressed: (int newInd) {
        //           setState(() {
        //             for (int i = 0; i < canvas.length; i++) {
        //               newInd == i ? canvas[i] = true : canvas[i] = false;
        //             }
        //           });
        //         },
        //         children: const [Text("ON"), Text("OFF")],
        //       ),
        //     ),
        //   ],
        // ),
        // ],
        // ),
      ),
    );
  }
}
