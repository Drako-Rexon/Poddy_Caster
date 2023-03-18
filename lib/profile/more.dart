import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poddy_caster/_components/colors.dart';
import 'package:poddy_caster/_components/data_for_dynamic.dart';
import 'package:poddy_caster/_components/util_function.dart';
import 'package:poddy_caster/_components/util_widgets.dart';
import 'package:poddy_caster/profile/about_us.dart';
import 'package:poddy_caster/profile/connect_to_device.dart';
import 'package:poddy_caster/profile/music_quality.dart';
import 'package:poddy_caster/profile/playback.dart';
import 'package:poddy_caster/profile/social.dart';

class More extends StatelessWidget {
  const More({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: BackArrow(),
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
        child: Container(
          width: AppConfig.screenWidth,
          child: Column(
            children: [
              SizedBox(height: 30),
              RegularCard(
                "Playback",
                () {
                  Get.to(() => Playback());
                },
                listAction: [enterArrow()],
              ),
              SizedBox(height: AppConfig.height10),
              RegularCard(
                "Connect to device",
                () {
                  Get.to(() => ConnToDevice());
                },
                listAction: [enterArrow()],
              ),
              SizedBox(height: AppConfig.height10),
              RegularCard(
                "Social",
                () {
                  Get.to(() => Social());
                },
                listAction: [enterArrow()],
              ),
              SizedBox(height: AppConfig.height10),
              RegularCard(
                "Music Quality",
                () {
                  Get.to(() => MusicQuality());
                },
                listAction: [enterArrow()],
              ),
              SizedBox(height: AppConfig.height10),
              RegularCard(
                "About Us",
                () {
                  Get.to(() => AboutUs());
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
