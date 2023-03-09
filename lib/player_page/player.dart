import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast_app/_components/colors.dart';
import 'package:podcast_app/_components/data_for_dynamic.dart';
import 'package:podcast_app/_components/util_function.dart';

class PlayerPage extends StatefulWidget {
  PlayerPage({
    Key? key,
    required this.data,
  }) : super(key: key);
  final dynamic data;

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  double _currVal = 0.0;
  @override
  Widget build(BuildContext context) {
    pPrintLog("data here 1", widget.data);

    double _value = 0;
    return Scaffold(
      backgroundColor: pBackground,
      appBar: AppBar(
        title: Text(
          widget.data['mainTitle'],
          overflow: TextOverflow.ellipsis,
        ),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: pLightPink,
          ),
        ),
        backgroundColor: trans,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: AppConfig.screenHeight / 3,
            width: AppConfig.screenWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.data['img']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: AppConfig.screenHeight / 3,
            width: AppConfig.screenWidth,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  pBackgroundAppColor,
                  trans,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Column(
            children: [
              Text(widget.data.toString()),
              Container(
                width: AppConfig.screenWidth / 2,
                height: AppConfig.screenWidth / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.data['img']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                widget.data['mainTitle'],
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: pWhite,
                  fontSize: AppConfig.textSize24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.data['subTitle'],
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: pPrimaryTextColor,
                  fontSize: AppConfig.textSize12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Slider(
                activeColor: pDarkPink,
                min: 0.0,
                max: 10.0,
                value: _currVal,
                onChanged: (double val) {
                  setState(() {
                    _currVal = val;
                  });
                },
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.red,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.red,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



/**
 * 
 * Stack(
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
 */