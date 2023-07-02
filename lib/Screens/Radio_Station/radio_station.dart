import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poddy_caster/Screens/Player_page/player.dart';
import 'package:poddy_caster/_components/colors.dart';
import 'package:poddy_caster/_components/data_for_dynamic.dart';
import 'package:poddy_caster/_components/sample_json.dart';
import 'package:poddy_caster/_components/util_function.dart';
import 'package:poddy_caster/_components/util_widgets.dart';
import 'package:poddy_caster/Screens/search/search.dart';

class RadioStationPage extends StatefulWidget {
  const RadioStationPage({Key? key}) : super(key: key);

  @override
  State<RadioStationPage> createState() => _RadioStationPageState();
}

class _RadioStationPageState extends State<RadioStationPage>
    with SingleTickerProviderStateMixin {
  static List<Tab> myTabs = const [
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
    pPrintLog("value:", _tabController.index);
    return Scaffold(
      backgroundColor: pBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: NormalText(
          text: "Radio Stations",
          isBold: true,
          textColor: pWhite,
          textSize: AppConfig.textSize24,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, size: 26),
            onPressed: () {
              Get.to(() => const SearchPage());
            },
          ),
        ],
        backgroundColor: pBackground,
        elevation: 0,
        bottom: TabBar(
          onTap: (int ind) {
            setState(() {});
          },
          overlayColor: MaterialStateProperty.all(pPrimaryTextColor),
          controller: _tabController,
          tabs: myTabs,
          labelColor: pLightPink,
          unselectedLabelColor: pCustomGrey,
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
            color: pCustomGrey,
            fontWeight: FontWeight.bold,
            fontSize: AppConfig.textSize12,
          ),
          indicator: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1, color: pLightPink),
            ),
          ),
        ),
      ),
      // ! The below content is for the list of cards in radio station
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              SizedBox(height: AppConfig.height20),
              Container(
                padding: EdgeInsets.only(right: AppConfig.width20),
                width: AppConfig.screenWidth - 20,
                height: AppConfig.height80,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/Rectangle-1.png'),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: AppConfig.width20,
                        top: AppConfig.height20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NormalText(
                            text: "Enjoy your day with RadioApp",
                            textColor: pWhite,
                            textSize: AppConfig.textSize12,
                          ),
                          NormalText(
                            text: "Tune your radio now",
                            textColor: pWhite,
                            isBold: true,
                            textSize: AppConfig.textSize18,
                          ),
                        ],
                      ),
                    ),
                    GradientButton(
                      "Tune Now",
                      () {},
                      wid: 90,
                      isDisable: false,
                      textSize: AppConfig.textSize14,
                    )
                  ],
                ),
              ),
              // ! tabview here below
              SizedBox(
                height: _tabController.index == 0
                    ? (AppConfig.height80 + AppConfig.height10) *
                        radioPopularBroadCard.length
                    : (AppConfig.height70) * radioGenre.length,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: radioPopularBroadCard.length,
                      itemBuilder: ((BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            vertical: AppConfig.height5,
                            horizontal: AppConfig.width15,
                          ),
                          child: ListCardBottomHome(
                            radioPopularBroadCard[index],
                            () {
                              Get.to(() => PlayerPage(
                                  data: radioPopularBroadCard[index]));
                            },
                            radio: true,
                          ),
                        );
                      }),
                    ),
                    // ! Popular Broadcast Ends here
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: radioGenre.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            SizedBox(height: AppConfig.height10),
                            RadioGenreCard(
                              list: radioGenre,
                              ind: index,
                              func: () {},
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppConfig.height10),
            ],
          ),
        ),
      ),
    );
  }
}
