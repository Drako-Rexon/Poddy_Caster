import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poddy_caster/Screens/Profile/about_us.dart';
import 'package:poddy_caster/Screens/Profile/connect_to_device.dart';
import 'package:poddy_caster/Screens/Profile/music_quality.dart';
import 'package:poddy_caster/Screens/Profile/playback.dart';
import 'package:poddy_caster/Screens/Profile/social.dart';
import 'package:poddy_caster/_components/colors.dart';
import 'package:poddy_caster/_components/data_for_dynamic.dart';
import 'package:poddy_caster/_components/util_function.dart';
import 'package:poddy_caster/_components/util_widgets.dart';

class More extends StatelessWidget {
  const More({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: const BackArrow(),
        backgroundColor: pBackground,
        title: Text(
          "More",
          style: TextStyle(
            color: pWhite,
            fontSize: AppConfig.textSize24,
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: AppConfig.screenWidth,
          child: Column(
            children: [
              const SizedBox(height: 30),
              RegularCard(
                "Playback",
                () {
                  Get.to(() => const Playback());
                },
                listAction: [enterArrow()],
              ),
              SizedBox(height: AppConfig.height10),
              RegularCard(
                "Connect to device",
                () {
                  Get.to(() => const ConnToDevice());
                },
                listAction: [enterArrow()],
              ),
              SizedBox(height: AppConfig.height10),
              RegularCard(
                "Social",
                () {
                  Get.to(() => const Social());
                },
                listAction: [enterArrow()],
              ),
              SizedBox(height: AppConfig.height10),
              RegularCard(
                "Music Quality",
                () {
                  Get.to(() => const MusicQuality());
                },
                listAction: [enterArrow()],
              ),
              SizedBox(height: AppConfig.height10),
              RegularCard(
                "About Us",
                () {
                  Get.to(() => const AboutUs());
                },
                listAction: [enterArrow()],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
