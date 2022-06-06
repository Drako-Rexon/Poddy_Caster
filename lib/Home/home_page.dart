import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:podcast_app/Home/components/list_card_home.dart';
import 'package:podcast_app/components/data_for_dynamic.dart';
import 'package:podcast_app/Home/components/home_card_carousel.dart';
import 'package:podcast_app/components/normal_text.dart';
import 'package:podcast_app/components/sample_json.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
              SizedBox(height: SizeForDynamic.height30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      size: 32,
                      color: ColorsForApp.customGrey,
                    ),
                  ),
                ],
              ),
              Row(
                // mainAxisSize: MainAxisSize.min,
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
                            color: ColorsForApp.cutomWhite,
                          ),
                        ),
                      ),
                      Container(
                        height: 8,
                        width: 8,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.all(Radius.circular(4)),
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2,
                            color: ColorsForApp.cutomWhite,
                          ),
                        ),
                      ),
                      Container(
                        height: 8,
                        width: 8,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: ColorsForApp.cutomWhite,
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2,
                            color: ColorsForApp.cutomWhite,
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
                            color: ColorsForApp.cutomWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 120,
                    width: SizeForDynamic.screenWidth - 60,
                    child: CarouselSlider(
                      items: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Tabitha Nauser",
                              style: TextStyle(
                                color: ColorsForApp.customGrey,
                                fontSize: SizeForDynamic.textSize12,
                                fontFamily: 'CircularStd-Book',
                              ),
                            ),
                            Text(
                              "Bulletproof",
                              style: TextStyle(
                                fontSize: SizeForDynamic.textSize36,
                                color: ColorsForApp.cutomWhite,
                                fontFamily: 'CircularStd',
                              ),
                            ),
                            // SizedBox(height: 20),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tabitha Nauser2",
                              style: TextStyle(
                                color: ColorsForApp.customGrey,
                                fontSize: SizeForDynamic.textSize12,
                                fontFamily: 'CircularStd-Book',
                              ),
                            ),
                            Text(
                              "Bulletproof2",
                              style: TextStyle(
                                fontSize: SizeForDynamic.textSize36,
                                color: ColorsForApp.cutomWhite,
                                fontFamily: 'CircularStd',
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tabitha Nauser3",
                              style: TextStyle(
                                color: ColorsForApp.customGrey,
                                fontSize: SizeForDynamic.textSize12,
                                fontFamily: 'CircularStd-Book',
                              ),
                            ),
                            Text(
                              "Bulletproof3",
                              style: TextStyle(
                                fontSize: SizeForDynamic.textSize36,
                                color: ColorsForApp.cutomWhite,
                                fontFamily: 'CircularStd',
                              ),
                            ),
                          ],
                        ),
                      ],
                      options: CarouselOptions(
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
                          textColor: ColorsForApp.cutomWhite,
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
                      textColor: ColorsForApp.cutomWhite,
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
    );
  }
}
