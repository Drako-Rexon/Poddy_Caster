import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast_app/_components/colors.dart';
import 'package:podcast_app/_components/data_for_dynamic.dart';
import 'package:podcast_app/_components/util_function.dart';
import 'package:podcast_app/_components/util_widgets.dart';

class PlayerPage extends StatelessWidget {
  PlayerPage({Key? key, required this.data}) : super(key: key);
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    pPrintLog("data here 1", data);
    double _value = 0;
    return Scaffold(
      backgroundColor: pBackground,
      body: SafeArea(
        child: Stack(
          children: [
            BackGroundImageFilter(),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: AppConfig.height20,
                    left: AppConfig.width10,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          // Get.defaultDialog(title: "Hi", middleText: "");
                          Get.back();
                          // Get.to(RedirectingPage());
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: pLightPink,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: AppConfig.screenHeight * 0.5,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 230,
                      height: 230,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(data["img"]),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: AppConfig.screenHeight * 0.35,
                  // color: Colors.white, // ! testing the size of container
                  margin: EdgeInsets.only(
                    top: AppConfig.height30,
                    bottom: AppConfig.height60,
                    left: AppConfig.width20,
                    right: AppConfig.width20,
                  ),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      NormalText(
                        text: "The Jordan",
                        textColor: pWhite,
                        textSize: AppConfig.textSize24,
                        isBold: true,
                      ),
                      NormalText(text: "Celeste Headlee"),
                      Row(
                        children: [
                          NormalText(text: "40:01"),
                          Slider(
                            value: _value,
                            onChanged: (value) {},
                            min: 0,
                            max: 100,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite,
                              color: pCustomGrey,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_back_ios_new_sharp),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.arrow_back_ios_new_sharp),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_back_ios_new_sharp),
                            ),
                          ],
                        ),
                      )
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
