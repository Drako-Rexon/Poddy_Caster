import 'package:flutter/material.dart';
import 'package:poddy_caster/_components/colors.dart';
import 'package:poddy_caster/src/utils/data_for_dynamic.dart';
import 'package:poddy_caster/src/utils/important_functions.dart';

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
                          popScreen(context);
                        },
                        child: const Icon(Icons.arrow_back_outlined,
                            color: pDarkPink),
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
                        child:
                            const Icon(Icons.search, color: pPrimaryTextColor),
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
