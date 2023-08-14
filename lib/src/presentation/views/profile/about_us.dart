import 'package:flutter/material.dart';
import 'package:poddy_caster/src/utils/colors.dart';
import 'package:poddy_caster/src/utils/data_for_dynamic.dart';
import 'package:poddy_caster/src/utils/util_widgets.dart';
import 'package:poddy_caster/src/presentation/views/terms_and_services/terms_of_service.dart';
import 'package:poddy_caster/src/utils/important_functions.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pBackground,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
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
        child: SizedBox(
          width: AppConfig.screenWidth,
          child: Column(
            children: [
              const SizedBox(height: 30),
              RegularCard(
                "Version",
                () {},
                listAction: const [
                  Text(
                    "v1.0.0",
                    style: TextStyle(color: pPrimaryTextColor),
                  ),
                ],
              ),
              SizedBox(height: AppConfig.height10),
              RegularCard(
                "Terms & Services",
                () {
                  navigateRoute(context, const TermsOfService());
                },
              ),
              SizedBox(height: AppConfig.height10),
              RegularCard(
                "Privacy Policy",
                () {},
              ),
              SizedBox(height: AppConfig.height10),
              RegularCard(
                "Support",
                () {},
              ),
              SizedBox(height: AppConfig.height10),
              RegularCard(
                "Logout",
                () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
