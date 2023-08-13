import 'package:flutter/material.dart';
import 'package:poddy_caster/_components/colors.dart';
import 'package:poddy_caster/src/utils/data_for_dynamic.dart';
import 'package:poddy_caster/src/utils/util_widgets.dart';
import 'package:poddy_caster/src/utils/important_functions.dart';

class MusicQuality extends StatefulWidget {
  const MusicQuality({Key? key}) : super(key: key);

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
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            popScreen(context);
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
            const SizedBox(height: 30),
            RegularCard(
              "Streaming",
              () {},
              listAction: const [
                Text(
                  "Automatic",
                  style: TextStyle(
                    color: pPrimaryTextColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppConfig.height10),
            RegularCard(
              "Download using cellular",
              () {},
              listAction: [
                Container(
                  height: 30,
                  width: 100,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: ToggleButtons(
                    renderBorder: false,
                    color: pCustomGrey,
                    borderRadius: BorderRadius.circular(10),
                    fillColor: pDarkPink,
                    selectedColor: pWhite,
                    isSelected: gapLess,
                    onPressed: (int newInd) {
                      setState(() {
                        for (int i = 0; i < gapLess.length; i++) {
                          newInd == i ? gapLess[i] = true : gapLess[i] = false;
                        }
                      });
                    },
                    children: const [Text("ON"), Text("OFF")],
                  ),
                ),
              ],
            ),
            SizedBox(height: AppConfig.height10),
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
