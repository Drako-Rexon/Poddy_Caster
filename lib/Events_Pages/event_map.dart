import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poddy_caster/_components/colors.dart';
import 'package:poddy_caster/_components/data_for_dynamic.dart';

class EventMap extends StatelessWidget {
  const EventMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pBackground,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: AppConfig.height20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        overlayColor: MaterialStateProperty.all(trans),
                        onTap: () {
                          Get.back();
                        },
                        child:
                            Icon(Icons.arrow_back_outlined, color: pDarkPink),
                      ),
                      Text(
                        "Events",
                        style: TextStyle(
                          color: pWhite,
                          fontSize:
                              AppConfig.textSize24 + AppConfig.textSize8 - 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        overlayColor: MaterialStateProperty.all(trans),
                        onTap: () {},
                        child: Icon(Icons.search, color: pPrimaryTextColor),
                      ),
                    ],
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
