import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast_app/components/data_for_dynamic.dart';
import 'package:podcast_app/components/sample_json.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  height: SizeForDynamic.screenHeight * 0.6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage(homeCarouselSlider[0]["img"]),
                    ),
                  ),
                ),
                Container(
                  height: SizeForDynamic.screenHeight * 0.4,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      // begin: Alignment.bottomCenter,
                      // end: Alignment.topCenter,
                      focalRadius: 50,
                      colors: [
                        Colors.white.withOpacity(0.3),
                        ColorsForApp.commonBackGround,
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    // Get.defaultDialog(title: "Hi");
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: ColorsForApp.buttonGradientColor1,
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
