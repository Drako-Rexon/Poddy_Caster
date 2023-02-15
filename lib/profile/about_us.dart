// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:podcast_app/_components/colors.dart';
// import 'package:podcast_app/_components/data_for_dynamic.dart';

// class AboutUs extends StatelessWidget {
//   const AboutUs({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: pBackground,
//       appBar: AppBar(
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Get.back();
//           },
//           color: pLightPink,
//         ),
//         backgroundColor: pBackground,
//         title: Text(
//           "About Us",
//           style: TextStyle(
//             color: pWhite,
//             fontSize: AppConfig.textSize24,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:podcast_app/_components/colors.dart';
import 'package:podcast_app/_components/data_for_dynamic.dart';
import 'package:podcast_app/_components/terms_of_service.dart';
import 'package:podcast_app/_components/util_widgets.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

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
          "About Us",
          style: TextStyle(
            color: pWhite,
            fontSize: AppConfig.textSize24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: AppConfig.screenWidth,
          child: Column(
            children: [
              SizedBox(height: 30),
              RegularCard(
                "Terms & Services",
                () {
                  Get.to(() => TermsOfService());
                },
              ),
              SizedBox(height: 10),
              RegularCard(
                "Version",
                () {},
                listAction: [Text("v1.0.0", style: TextStyle(color: pWhite))],
              ),
              SizedBox(height: 10),
              RegularCard(
                "Connect to Facebook",
                () {},
                listLead: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/facebook.png',
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
