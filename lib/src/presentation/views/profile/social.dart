import 'package:poddy_caster/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:poddy_caster/src/utils/data_for_dynamic.dart';
import 'package:poddy_caster/src/utils/util_widgets.dart';
import 'package:poddy_caster/src/utils/important_functions.dart';

class Social extends StatefulWidget {
  const Social({Key? key}) : super(key: key);

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
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            popScreen(context);
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
            const SizedBox(height: 30),
            RegularCard(
              "Private Session",
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
                )
              ],
            ),
            SizedBox(height: AppConfig.height10),
            RegularCard(
              "Listening Activity",
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
                    isSelected: listAct,
                    onPressed: (int newInd) {
                      setState(() {
                        for (int i = 0; i < listAct.length; i++) {
                          newInd == i ? listAct[i] = true : listAct[i] = false;
                        }
                      });
                    },
                    children: const [Text("ON"), Text("OFF")],
                  ),
                )
              ],
            ),
            SizedBox(height: AppConfig.height10),
            RegularCard(
              "Connect to Facebook",
              () {},
              listLead: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/facebook.png',
                      height: AppConfig.height20,
                      width: 20,
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ],
            ),
            SizedBox(height: AppConfig.height10),
            RegularCard(
              "Connect to Google",
              () {},
              listLead: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/google-png.png',
                      height: AppConfig.height20,
                      width: 20,
                    ),
                    const SizedBox(width: 10),
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
