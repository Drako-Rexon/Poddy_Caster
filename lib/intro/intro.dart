import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poddy_caster/_components/colors.dart';
import 'package:poddy_caster/_components/data_for_dynamic.dart';
import 'package:poddy_caster/_components/util_widgets.dart';
import 'package:poddy_caster/authorization/sign_in.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

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
              children: const [
                IntroPagePart(
                  img: 'assets/images/radio.png',
                  content:
                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna',
                ),
                IntroPagePart(
                  img: 'assets/images/radio.png',
                  content:
                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna',
                ),
                IntroPagePart(
                  img: 'assets/images/radio.png',
                  content:
                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna',
                ),
                IntroPagePart(
                  img: 'assets/images/radio.png',
                  content:
                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna',
                ),
              ],
            ),
            Align(
              alignment: const Alignment(0.8, -0.9),
              child: InkWell(
                overlayColor: MaterialStateProperty.all(trans),
                onTap: () {
                  Get.to(() => const SignInPage());
                },
                child: SizedBox(
                  height: AppConfig.height30,
                  width: AppConfig.width50,
                  child: const Center(
                    child: Text(
                      "skip",
                      style: TextStyle(color: pLightPink),
                    ),
                  ),
                ),
              ),
            ),
            Align(alignment: const Alignment(0, 0.9), child: controller()),
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
                duration: const Duration(milliseconds: 100),
                curve: Curves.linear,
              );
            });
          },
          child: SizedBox(
            height: AppConfig.height50,
            width: AppConfig.width70 + AppConfig.width30,
            child: const Center(
              child: Text(
                "Previous",
                style: TextStyle(color: pLightPink),
              ),
            ),
          ),
        ),
        SizedBox(
          height: AppConfig.height50,
          width: AppConfig.width60 * 2 + AppConfig.width20,
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
                ? Get.to(() => const SignInPage())
                : setState(() {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.linear,
                    );
                  });
          },
          child: SizedBox(
            height: AppConfig.height50,
            width: 70,
            child: Center(
              child: Text(
                actPage == 3 ? "Done" : "Next",
                style: const TextStyle(color: pLightPink),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
