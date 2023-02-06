import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:podcast_app/_components/colors.dart';
import 'package:podcast_app/_components/list_card_home.dart';
import 'package:podcast_app/_components/data_for_dynamic.dart';
import 'package:podcast_app/_components/home_card_carousel.dart';
import 'package:podcast_app/_components/normal_text.dart';
import 'package:podcast_app/_components/sample_json.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final _sliderController = CarouselController();
  final double scrollValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.search, size: 32),
          ),
        ],
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Container(
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                opacity: scrollValue,
                fit: BoxFit.fitHeight,
                image: AssetImage('assets/images/slider1.jpg'),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: AppConfig.height80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 8,
                          width: 8,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 1,
                              color: pWhite,
                            ),
                          ),
                        ),
                        Container(
                          height: 8,
                          width: 8,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2,
                              color: pWhite,
                            ),
                          ),
                        ),
                        Container(
                          height: 8,
                          width: 8,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: pWhite,
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2,
                              color: pWhite,
                            ),
                          ),
                        ),
                        Container(
                          height: 8,
                          width: 8,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2,
                              color: pWhite,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 120,
                      width: AppConfig.screenWidth - 60,
                      child: CarouselSlider(
                        carouselController: _sliderController,
                        items: List.generate(homeTopSliderOne.length, (index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                homeTopSliderOne[index]["text1"],
                                style: TextStyle(
                                  color: ColorsForApp.customGrey,
                                  fontSize: AppConfig.textSize12,
                                  fontFamily: 'CircularStd-Book',
                                ),
                              ),
                              NormalText(
                                text: homeTopSliderOne[index]["text2"],
                                textSize: AppConfig.textSize36,
                                isBold: true,
                                textColor: pWhite,
                              ),
                            ],
                          );
                        }),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          enableInfiniteScroll: true,
                          scrollDirection: Axis.vertical,
                        ),
                      ),
                    ),
                  ],
                ),
                // ! this is for the carousel slider
                Column(
                  children: [
                    SizedBox(height: 50),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(
                            "Popular Broadcast",
                            style: TextStyle(
                              color: pWhite,
                              fontSize: AppConfig.textSize12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children:
                            List.generate(homeCarouselSlider.length, (index) {
                          return CarouselCardHome(
                            text1: homeCarouselSlider[index]["mainTitle"],
                            text2: homeCarouselSlider[index]["subTitle"],
                            img: homeCarouselSlider[index]["img"],
                          );
                        }),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppConfig.height20),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      NormalText(
                        text: "Similar Broadcast",
                        isBold: true,
                        textSize: AppConfig.textSize12,
                        textColor: pWhite,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppConfig.height20),
                Column(
                  children: List.generate(HomeCardBottom.length, (index) {
                    return Column(
                      children: [
                        ListCardBottomHome(
                          img: HomeCardBottom[index]['img'],
                          mainText: HomeCardBottom[index]['mainTitle'],
                          subText: HomeCardBottom[index]['subTitle'],
                        ),
                        SizedBox(height: 20),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
