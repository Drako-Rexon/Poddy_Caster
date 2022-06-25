import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:podcast_app/Home/components/list_card_home.dart';
import 'package:podcast_app/components/data_for_dynamic.dart';
import 'package:podcast_app/Home/components/home_card_carousel.dart';
import 'package:podcast_app/components/normal_text.dart';
import 'package:podcast_app/components/sample_json.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final _sliderController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        actions: [
          Icon(Icons.search, size: 32),
          SizedBox(width: SizeForDynamic.width10),
        ],
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Container(
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
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
                SizedBox(height: SizeForDynamic.height80),
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
                              color: ColorsForApp.customWhite,
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
                              color: ColorsForApp.customWhite,
                            ),
                          ),
                        ),
                        Container(
                          height: 8,
                          width: 8,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: ColorsForApp.customWhite,
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2,
                              color: ColorsForApp.customWhite,
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
                              color: ColorsForApp.customWhite,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 120,
                      width: SizeForDynamic.screenWidth - 60,
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
                                  fontSize: SizeForDynamic.textSize12,
                                  fontFamily: 'CircularStd-Book',
                                ),
                              ),
                              NormalText(
                                text: homeTopSliderOne[index]["text2"],
                                textSize: SizeForDynamic.textSize36,
                                isBold: true,
                                textColor: ColorsForApp.customWhite,
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
                          NormalText(
                            text: "Popular Broadcast",
                            isBold: true,
                            textSize: SizeForDynamic.textSize12,
                            textColor: ColorsForApp.customWhite,
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
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
                SizedBox(height: SizeForDynamic.height20),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      NormalText(
                        text: "Similar Broadcast",
                        isBold: true,
                        textSize: SizeForDynamic.textSize12,
                        textColor: ColorsForApp.customWhite,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: SizeForDynamic.height20),
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
