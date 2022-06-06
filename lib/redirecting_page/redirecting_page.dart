import 'package:flutter/material.dart';
import 'package:podcast_app/Radio_Station/radio_station.dart';
import 'package:podcast_app/components/data_for_dynamic.dart';
import 'package:podcast_app/components/normal_text.dart';
import 'package:podcast_app/Home/home_page.dart';
import 'package:podcast_app/components/sample_json.dart';

class RedirectingPage extends StatefulWidget {
  const RedirectingPage({Key? key}) : super(key: key);

  @override
  State<RedirectingPage> createState() => _RedirectingPageState();
}

class _RedirectingPageState extends State<RedirectingPage> {
  int currentTab = 1, index = 0;

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
          Container(
            child: Center(
              child: NormalText(text: "profile"),
            ),
          ),
        ],
      ),
      bottomNavigationBar: RedirectingNav(),
    );
  }

  Widget RedirectingNav() {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      color: ColorsForApp.forgroundAppColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(navIcons.length, (index) {
          return Container(
            child: Column(
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
                  onPressed: () {
                    setState(() {
                      currentTab = index;
                    });
                  },
                  child: Column(
                    children: [
                      Icon(
                        navIcons[index],
                        size: 30,
                        color: index == currentTab
                            ? ColorsForApp.buttonGradientColor1
                            : ColorsForApp.customGrey,
                      ),
                      SizedBox(height: 6),
                      Text(
                        navName[index],
                        style: TextStyle(
                          fontSize: SizeForDynamic.textSize12,
                          color: index == currentTab
                              ? ColorsForApp.buttonGradientColor1
                              : ColorsForApp.customGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

// class NavBar extends StatefulWidget {
//   const NavBar({Key? key, required this.list1, required this.list2})
//       : super(key: key);
//   final List list1;
//   final List list2;

//   @override
//   State<NavBar> createState() => _NavBarState();
// }

// class _NavBarState extends State<NavBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 100,
//       height: 200,
//       color: Colors.white,
//       child: Row(
//         children: List.generate(list1.length, (index) {
//           return Container(
//             padding: EdgeInsets.only(bottom: 60),
//             child: RaisedButton(
//               onPressed: () {
//                 setState(() {});
//               },
//               child: Column(
//                 children: [
//                   Icon(
//                     list1[index],
//                     color: Colors.red,
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }
