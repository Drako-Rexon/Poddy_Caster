import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast_app/_components/colors.dart';
import 'package:podcast_app/_components/util_widgets.dart';
import 'package:podcast_app/authorization/sign_in.dart';
import 'package:podcast_app/redirecting_page/redirecting_page.dart';

class Intro extends StatefulWidget {
  Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  PageController _pageController = PageController();
  int actPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pBackground,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              onPageChanged: (ind) {
                setState(() {
                  actPage = _pageController.page!.round();
                });
              },
              controller: _pageController,
              children: [
                IntroPagePart(img: 'assets/images/radio.png'),
                IntroPagePart(img: 'assets/images/radio.png'),
                IntroPagePart(img: 'assets/images/radio.png'),
                IntroPagePart(img: 'assets/images/radio.png'),
              ],
            ),
            Align(
              alignment: Alignment(0.8, -0.9),
              child: InkWell(
                overlayColor: MaterialStateProperty.all(trans),
                onTap: () {
                  Get.to(() => RedirectingPage());
                },
                child: Container(
                  height: 30,
                  width: 50,
                  child: Center(
                    child: Text(
                      "skip",
                      style: TextStyle(color: pLightPink),
                    ),
                  ),
                ),
              ),
            ),
            Align(alignment: Alignment(0, 0.75), child: controller()),
          ],
        ),
      ),
    );
  }

  Row controller() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          overlayColor: MaterialStateProperty.all(trans),
          onTap: () {
            setState(() {
              _pageController.previousPage(
                duration: Duration(milliseconds: 100),
                curve: Curves.linear,
              );
            });
          },
          child: Container(
            height: 50,
            width: 100,
            child: Center(
              child: Text(
                "Previous",
                style: TextStyle(color: pLightPink),
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          width: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return DotCarousel(
                dia: 10,
                fillClr: actPage == index ? pLightPink : pPrimaryTextColor,
                borderClr: actPage == index ? pLightPink : pPrimaryTextColor,
              );
            },
          ),
        ),
        InkWell(
          overlayColor: MaterialStateProperty.all(trans),
          onTap: () {
            actPage == 3
                ? Get.to(() => SignInPage())
                : setState(() {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.linear,
                    );
                  });
          },
          child: Container(
            height: 50,
            width: 70,
            child: Center(
              child: Text(
                actPage == 3 ? "Done" : "Next",
                style: TextStyle(color: pLightPink),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
