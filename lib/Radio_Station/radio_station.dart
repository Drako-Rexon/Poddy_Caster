import 'package:flutter/material.dart';
import 'package:podcast_app/Radio_Station/components/gradient_button_radio.dart';
import 'package:podcast_app/Radio_Station/components/list_card_radio.dart';
import 'package:podcast_app/components/data_for_dynamic.dart';
import 'package:podcast_app/components/normal_text.dart';
import 'package:podcast_app/components/sample_json.dart';

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
          controller: _tabController,
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
      body: SingleChildScrollView(
        child: Column(
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
            Container(
              height: (radioPopularBroadCard.length + 1) * 80 +20,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Column(
                    children:
                        List.generate(radioPopularBroadCard.length, (index) {
                      return Column(
                        children: [
                          SizedBox(height: SizeForDynamic.height10),
                          ListCardRadio(
                            img: radioPopularBroadCard[index]['img'],
                            mainText: radioPopularBroadCard[index]['mainTitle'],
                            subText: radioPopularBroadCard[index]['subTitle'],
                          ),
                          SizedBox(height: SizeForDynamic.height10),
                        ],
                      );
                    }),
                  ),
                  Center(
                    child: NormalText(text: "Hello1"),
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
