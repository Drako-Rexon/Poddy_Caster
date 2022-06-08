import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast_app/Radio_Station/components/gradient_button_radio.dart';
import 'package:podcast_app/Radio_Station/components/list_card_radio.dart';
import 'package:podcast_app/components/data_for_dynamic.dart';
import 'package:podcast_app/components/normal_text.dart';
import 'package:podcast_app/components/sample_json.dart';
import 'package:podcast_app/player_page/player.dart';

class RadioStationPage extends StatefulWidget {
  const RadioStationPage({Key? key}) : super(key: key);

  @override
  State<RadioStationPage> createState() => _RadioStationPageState();
}

class _RadioStationPageState extends State<RadioStationPage>
    with SingleTickerProviderStateMixin {
  static List<Tab> myTabs = [
    Tab(text: "Popular Broadcast"),
    Tab(text: "Radio Genre")
  ];
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsForApp.commonBackGround,
      appBar: AppBar(
        title: NormalText(
          text: "Radio Stations",
          isBold: true,
          textColor: ColorsForApp.customWhite,
          textSize: SizeForDynamic.textSize24,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
        backgroundColor: ColorsForApp.commonBackGround,
        elevation: 0,
        bottom: TabBar(
          isScrollable: true,
          controller:
              _tabController, // * this controller is needed to declare in the init() and need to dispose too for control th eram consumption
          tabs: myTabs,
          labelColor: ColorsForApp.buttonGradientColor1,
          unselectedLabelColor: ColorsForApp.customGrey,
          labelStyle: TextStyle(
            fontFamily: 'CircularStd',
            fontWeight: FontWeight.bold,
            fontSize: SizeForDynamic.textSize12,
          ),
          labelPadding: EdgeInsets.only(
            left: SizeForDynamic.width15,
            right: SizeForDynamic.width15,
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: 'CircularStd',
            color: ColorsForApp.customGrey,
            fontWeight: FontWeight.bold,
            fontSize: SizeForDynamic.textSize12,
          ),
          indicator: BoxDecoration(
            border: Border.all(width: 0),
          ),
        ),
      ),
      // ! The below content is for the list of cards in radio station
      body: SizedBox(
        // height: SizeForDynamic.screenHeight - 120,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: SizeForDynamic.height20),
            Container(
              padding: EdgeInsets.all(SizeForDynamic.width20),
              width: SizeForDynamic.screenWidth - 20,
              height: SizeForDynamic.height80,
              decoration: BoxDecoration(
                color: ColorsForApp.buttonGradientColor1,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/Rectangle-1.png'),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NormalText(
                        text: "Enjoy your day with RadioApp",
                        textColor: ColorsForApp.customWhite,
                      ),
                      NormalText(
                        text: "Tune your radio now",
                        textColor: ColorsForApp.customWhite,
                        isBold: true,
                        textSize: SizeForDynamic.textSize18,
                      )
                    ],
                  ),
                  GradientButtonRadio(
                    text: "Tune Now",
                    txtSize: SizeForDynamic.textSize14,
                    textWeight: FontWeight.w900,
                  )
                ],
              ),
            ),
            // ! tabview here below
            SizedBox(
              height: SizeForDynamic.screenHeight - SizeForDynamic.height308,
              child: TabBarView(
                controller:
                    _tabController, // * This is controller for the controlling the shifting of pages between the tabs
                children: [
                  ListView.builder(
                    itemCount: radioPopularBroadCard.length,
                    itemBuilder: ((context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                          vertical: SizeForDynamic.height10,
                          horizontal: SizeForDynamic.width15,
                        ),
                        // width: SizeForDynamic.screenWidth - 40,
                        child: ListCardRadio(
                          img: radioPopularBroadCard[index]['img'],
                          mainText: radioPopularBroadCard[index]['mainTitle'],
                          subText: radioPopularBroadCard[index]['subTitle'],
                        ),
                      );
                    }),
                  ),
                  //! Popular Broadcast Ends here
                  SingleChildScrollView(
                    child: Column(
                      children: List.generate(radioGenre.length, (index) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              vertical: SizeForDynamic.height10),
                          padding: EdgeInsets.symmetric(
                            vertical: SizeForDynamic.height15,
                            horizontal: SizeForDynamic.width25,
                          ),
                          width: SizeForDynamic.screenWidth - 40,
                          decoration: BoxDecoration(
                            color: ColorsForApp.darkPurple,
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              NormalText(
                                text: radioGenre[index]['category'],
                                textColor: ColorsForApp.customWhite,
                                textSize: SizeForDynamic.textSize18,
                              ),
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorsForApp.commonBackGround,
                                ),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: ColorsForApp.customWhite,
                                  size: 8,
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
            ),
          ],
        ),
      ),
    );
  }
}

//  child: TextButton(
//                                   style: ButtonStyle(
//                                       padding: MaterialStateProperty.all(
//                                           EdgeInsets.all(0)),
//                                       shape: MaterialStateProperty.all(
//                                           CircleBorder(side: BorderSide.none)),
//                                       backgroundColor:
//                                           MaterialStateProperty.all(
//                                               ColorsForApp.commonBackGround)),
//                                   onPressed: () {},