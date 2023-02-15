import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:podcast_app/_components/colors.dart';
import 'package:podcast_app/_components/data_for_dynamic.dart';
import 'package:podcast_app/_components/util_function.dart';
import 'package:podcast_app/_components/util_widgets.dart';
import 'package:podcast_app/profile/about_us.dart';
import 'package:podcast_app/profile/connect_to_device.dart';
import 'package:podcast_app/profile/music_quality.dart';
import 'package:podcast_app/profile/playback.dart';
import 'package:podcast_app/profile/social.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

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
              SizedBox(height: 10),
              RegularCard(
                "Connect to device",
                () {
                  Get.to(() => ConnToDevice());
                },
                listAction: [enterArrow()],
              ),
              SizedBox(height: 10),
              RegularCard(
                "Social",
                () {
                  Get.to(() => Social());
                },
                listAction: [enterArrow()],
              ),
              SizedBox(height: 10),
              RegularCard(
                "Music Quality",
                () {
                  Get.to(() => MusicQuality());
                },
                listAction: [enterArrow()],
              ),
              SizedBox(height: 10),
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
