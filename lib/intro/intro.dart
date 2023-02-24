import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast_app/_components/colors.dart';
import 'package:podcast_app/_components/data_for_dynamic.dart';
import 'package:podcast_app/_components/util_widgets.dart';
import 'package:podcast_app/redirecting_page/redirecting_page.dart';

class Intro extends StatefulWidget {
  Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  int actPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pBackground,
      body: Container(
        height: AppConfig.screenHeight,
        width: AppConfig.screenWidth,
        child: Column(
          children: [
            Image.asset(
              'assets/images/radio.png',
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: [
                  Text(
                    "Tune your Radio",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: pWhite,
                      fontSize: 26,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: pCustomGrey, fontSize: 16),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  overlayColor: MaterialStateProperty.all(trans),
                  onTap: () {
                    if (actPage > 0) {
                      setState(() {
                        actPage--;
                      });
                    }
                  },
                  child: Container(
                    height: 20,
                    width: 80,
                    child: Text(
                      "Previous",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: pLightPink),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return DotCarousel(
                        dia: 10,
                        borderClr: index == actPage ? pLightPink : pCustomGrey,
                        fillClr: index == actPage ? pLightPink : pCustomGrey,
                        active: index == actPage ? true : false,
                      );
                    },
                  ),
                ),
                InkWell(
                  overlayColor: MaterialStateProperty.all(trans),
                  onTap: () {
                    if (actPage < 3) {
                      setState(() {
                        actPage++;
                      });
                    } else if (actPage == 3) {
                      Get.to(RedirectingPage());
                    }
                  },
                  child: Container(
                    height: 20,
                    width: 60,
                    child: Text(
                      actPage < 3 ? "Next" : "Finish",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: pLightPink),
                    ),
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
