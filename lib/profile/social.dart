import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:podcast_app/_components/colors.dart';
import 'package:podcast_app/_components/data_for_dynamic.dart';

class Social extends StatelessWidget {
  const Social({Key? key}) : super(key: key);
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
          "Social",
          style: TextStyle(
            color: pWhite,
            fontSize: AppConfig.textSize24,
          ),
        ),
      ),
    );
  }
}
