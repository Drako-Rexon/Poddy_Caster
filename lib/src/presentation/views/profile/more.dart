import 'package:flutter/material.dart';
import 'package:poddy_caster/src/utils/colors.dart';
import 'package:poddy_caster/src/utils/data_for_dynamic.dart';
import 'package:poddy_caster/src/utils/util_widgets.dart';
import 'package:poddy_caster/src/presentation/views/profile/about_us.dart';
import 'package:poddy_caster/src/presentation/views/profile/connect_to_device.dart';
import 'package:poddy_caster/src/presentation/views/profile/music_quality.dart';
import 'package:poddy_caster/src/presentation/views/profile/playback.dart';
import 'package:poddy_caster/src/presentation/views/profile/social.dart';
import 'package:poddy_caster/src/utils/imp_ui_function.dart';
import 'package:poddy_caster/src/utils/important_functions.dart';

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
                  navigateRoute(context, const Playback());
                },
                listAction: [enterArrow()],
              ),
              SizedBox(height: AppConfig.height10),
              RegularCard(
                "Connect to device",
                () {
                  navigateRoute(context, const ConnToDevice());
                },
                listAction: [enterArrow()],
              ),
              SizedBox(height: AppConfig.height10),
              RegularCard(
                "Social",
                () {
                  navigateRoute(context, const Social());
                },
                listAction: [enterArrow()],
              ),
              SizedBox(height: AppConfig.height10),
              RegularCard(
                "Music Quality",
                () {
                  navigateRoute(context, const MusicQuality());
                },
                listAction: [enterArrow()],
              ),
              SizedBox(height: AppConfig.height10),
              RegularCard(
                "About Us",
                () {
                  navigateRoute(context, const AboutUs());
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
