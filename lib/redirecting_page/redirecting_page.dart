import 'package:flutter/material.dart';
import 'package:podcast_app/Profile/profile_page.dart';
import 'package:podcast_app/Radio_Station/radio_station.dart';
import 'package:podcast_app/_components/colors.dart';
import 'package:podcast_app/_components/data_for_dynamic.dart';
import 'package:podcast_app/_components/normal_text.dart';
import 'package:podcast_app/Home/home_page.dart';

class RedirectingPage extends StatefulWidget {
  const RedirectingPage({Key? key}) : super(key: key);

  @override
  State<RedirectingPage> createState() => _RedirectingPageState();
}

class _RedirectingPageState extends State<RedirectingPage> {
  int currentTab = 0, index = 0;
  List navName = ["Home", "Stations", "Podcasts", "Events", "Profile"];
  List<String> navIcon = [
    'assets/images/home.png',
    'assets/images/station.png',
    'assets/images/podcast.png',
    'assets/images/event.png',
    'assets/images/profile.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsForApp.commonBackGround,
      body: IndexedStack(
        index: currentTab,
        children: [
          HomePage(),
          RadioStationPage(),
          Container(
            child: Center(
              child: NormalText(text: "Podcast"),
            ),
          ),
          Container(
            child: Center(
              child: NormalText(text: "event"),
            ),
          ),
          UserProfilePage(),
        ],
      ),
      bottomNavigationBar: RedirectingNav(),
    );
  }

  Container RedirectingNav() {
    return Container(
      width: AppConfig.screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        color: ColorsForApp.forgroundAppColor,
      ),
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(navIcon.length, (index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 5,
                width: 22,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  color: index == currentTab
                      ? ColorsForApp.buttonGradientColor1
                      : ColorsForApp.forgroundAppColor,
                ),
              ),
              SizedBox(height: 6),
              TextButton(
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(pPrimaryTextColor)),
                onPressed: () {
                  setState(() {
                    currentTab = index;
                  });
                },
                child: Column(
                  children: [
                    Image.asset(
                      navIcon[index],
                      height: 24,
                      width: 24,
                      color: index == currentTab
                          ? ColorsForApp.buttonGradientColor1
                          : ColorsForApp.customGrey,
                    ),
                    SizedBox(height: 6),
                    Text(
                      navName[index],
                      style: TextStyle(
                        fontSize: AppConfig.textSize12,
                        color: index == currentTab
                            ? ColorsForApp.buttonGradientColor1
                            : ColorsForApp.customGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
