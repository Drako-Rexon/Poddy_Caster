import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:podcast_app/components/data_for_dynamic.dart';
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
                                fontSize: SizeForDynamic.textSize18,
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
                                fontSize: SizeForDynamic.textSize18,
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
                                fontSize: SizeForDynamic.textSize18,
                                color: ColorsForApp.cutomWhite,
                                fontFamily: 'CircularStd',
                              ),
                            ),
                          ],
                        ),
                      ],
                      options: CarouselOptions(
                        enableInfiniteScroll: false,
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
                        return Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        homeCarouselSlider[index]["img"]),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: NormalText(
                                  text: homeCarouselSlider[index]["mainTitle"],
                                  isBold: true,
                                  toUpper: true,
                                  textColor: ColorsForApp.cutomWhite,
                                  textSize: SizeForDynamic.textSize12,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: NormalText(
                                  text: homeCarouselSlider[index]["subTitle"],
                                  isBold: true,
                                  toUpper: true,
                                  // textColor: ColorsForApp.cutomWhite,
                                  textSize: SizeForDynamic.textSize8,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                child: Row(
                  children: [
                    NormalText(
                      text: "Similar Broadcast",
                      isBold: true,
                      textColor: ColorsForApp.cutomWhite,
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(homeCarouselSlider[0]["img"]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
