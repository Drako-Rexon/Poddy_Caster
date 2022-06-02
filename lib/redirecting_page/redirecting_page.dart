import 'package:flutter/material.dart';
import 'package:podcast_app/components/data_for_dynamic.dart';

class RedirectingPage extends StatefulWidget {
  const RedirectingPage({Key? key}) : super(key: key);

  @override
  State<RedirectingPage> createState() => _RedirectingPageState();
}

class _RedirectingPageState extends State<RedirectingPage> {
  int currentTab = 0, index = 0;
  List navIcons = [
    Icons.home,
    Icons.radar_outlined,
    Icons.podcasts,
    Icons.calendar_month_outlined,
    Icons.person_add_alt_1_outlined
  ];
  List navName = ["Home", "radio Stations", "Podcasts", "Events", "Profile"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: IndexedStack(
        index: index,
        children: [
          Container(
            child: Center(
              child: Text("Home"),
            ),
          ),
        ],
      ),
      bottomNavigationBar: RedirectingNav(),
    );
  }

  Widget RedirectingNav() {
    return Container(
      width: 100,
      height: 200,
      color: Colors.white,
      child: Row(
        children: List.generate(navIcons.length, (index) {
          return Container(
            padding: EdgeInsets.only(bottom: 60),
            child: RaisedButton(
              onPressed: () {
                setState(() {});
              },
              child: Column(
                children: [
                  Icon(
                    navIcons[index],
                    color: Colors.red,
                  ),
                ],
              ),
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
