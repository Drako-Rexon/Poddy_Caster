import 'package:flutter/material.dart';
import 'package:podcast_app/_components/colors.dart';
import 'package:podcast_app/_components/gradient_button_radio.dart';
import 'package:podcast_app/_components/list_card_radio.dart';
import 'package:podcast_app/_components/data_for_dynamic.dart';
import 'package:podcast_app/_components/normal_text.dart';
import 'package:podcast_app/_components/sample_json.dart';

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
    super.initState();
    _tabController = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void dispose() {
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
          textColor: pWhite,
          textSize: AppConfig.textSize24,
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
              _tabController, // * this controller is needed to declare in the init() and need to dispose too for control the ram consumption
          tabs: myTabs,
          labelColor: ColorsForApp.buttonGradientColor1,
          unselectedLabelColor: ColorsForApp.customGrey,
          labelStyle: TextStyle(
            fontFamily: 'CircularStd',
            fontWeight: FontWeight.bold,
            fontSize: AppConfig.textSize12,
          ),
          labelPadding: EdgeInsets.only(
            left: AppConfig.width15,
            right: AppConfig.width15,
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: 'CircularStd',
            color: ColorsForApp.customGrey,
            fontWeight: FontWeight.bold,
            fontSize: AppConfig.textSize12,
          ),
          indicator: BoxDecoration(
            border: Border.all(width: 0),
          ),
        ),
      ),
      // ! The below content is for the list of cards in radio station
      body: SizedBox(
        child: Column(
          children: [
            SizedBox(height: AppConfig.height20),
            Container(
              padding: EdgeInsets.all(AppConfig.width20),
              width: AppConfig.screenWidth - 20,
              height: AppConfig.height80,
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
                        textColor: pWhite,
                      ),
                      NormalText(
                        text: "Tune your radio now",
                        textColor: pWhite,
                        isBold: true,
                        textSize: AppConfig.textSize18,
                      ),
                    ],
                  ),
                  GradientButtonRadio(
                    "Tune Now",
                    () {},
                    txtSize: AppConfig.textSize14,
                    textWeight: FontWeight.w900,
                  )
                ],
              ),
            ),
            // ! tabview here below
            SizedBox(
              height: AppConfig.screenHeight - AppConfig.height308,
              child: TabBarView(
                controller:
                    _tabController, // * This is controller for the controlling the shifting of pages between the tabs
                children: [
                  ListView.builder(
                    itemCount: radioPopularBroadCard.length,
                    itemBuilder: ((context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                          vertical: AppConfig.height10,
                          horizontal: AppConfig.width15,
                        ),
                        // width: AppConfig.screenWidth - 40,
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
                              vertical: AppConfig.height10),
                          padding: EdgeInsets.symmetric(
                            vertical: AppConfig.height15,
                            horizontal: AppConfig.width25,
                          ),
                          width: AppConfig.screenWidth - 40,
                          decoration: BoxDecoration(
                            color: ColorsForApp.darkPurple,
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              NormalText(
                                text: radioGenre[index]['category'],
                                textColor: pWhite,
                                textSize: AppConfig.textSize18,
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
                                  color: pWhite,
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
