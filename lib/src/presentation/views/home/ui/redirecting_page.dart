import 'package:flutter/material.dart';
import 'package:poddy_caster/src/presentation/views/events/events.dart';
import 'package:poddy_caster/src/presentation/views/home/ui/home_page.dart';
import 'package:poddy_caster/src/presentation/views/podcasts/podcasts.dart';
import 'package:poddy_caster/src/presentation/views/profile/profile_page.dart';
import 'package:poddy_caster/src/presentation/views/radio_station/radio_station.dart';
import 'package:poddy_caster/src/utils/colors.dart';
import 'package:poddy_caster/src/utils/data_for_dynamic.dart';

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
    'assets/images/profile.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pBackground,
      body: IndexedStack(
        index: currentTab,
        children: const [
          HomePage(),
          RadioStationPage(),
          Podcasts(),
          Events(),
          ProfilePage()
        ],
      ),
      bottomNavigationBar: Container(
        width: AppConfig.screenWidth,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          color: pSecondaryDeep,
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
                  height: AppConfig.height5,
                  width: AppConfig.width20 + 2,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                    color: index == currentTab ? pLightPink : pSecondaryDeep,
                  ),
                ),
                SizedBox(height: AppConfig.height5 + 1),
                TextButton(
                  style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(pPrimaryTextColor)),
                  onPressed: () {
                    setState(() {
                      currentTab = index;
                    });
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        navIcon[index],
                        height: AppConfig.height20,
                        width: AppConfig.width20,
                        color: index == currentTab ? pLightPink : pCustomGrey,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        navName[index],
                        style: TextStyle(
                          fontSize: AppConfig.textSize12,
                          color: index == currentTab ? pLightPink : pCustomGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
