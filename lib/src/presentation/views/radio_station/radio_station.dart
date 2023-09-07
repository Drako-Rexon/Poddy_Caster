import 'package:flutter/material.dart';
import 'package:poddy_caster/src/data/sample_json.dart';
import 'package:poddy_caster/src/models/song_model.dart';
import 'package:poddy_caster/src/presentation/widgets/gradient_button.dart';
import 'package:poddy_caster/src/presentation/widgets/list_widget.dart';
import 'package:poddy_caster/src/utils/colors.dart';
import 'package:poddy_caster/src/utils/data_for_dynamic.dart';
import 'package:poddy_caster/src/utils/util_widgets.dart';
import 'package:poddy_caster/src/presentation/views/single_page_ui/search.dart';
import 'package:poddy_caster/src/utils/important_functions.dart';

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
              navigateRoute(context, const SearchPage());
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
                        modelData.length
                    : (AppConfig.height70) * radioGenre.length,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: modelData.length,
                      itemBuilder: ((BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            vertical: AppConfig.height5,
                            horizontal: AppConfig.width15,
                          ),
                          child: ListCardBottomHome(
                            song: SongModel(
                              id: modelData[index]['id'],
                              name: modelData[index]['name'],
                              artists: List.generate(
                                  modelData[index]['artists'].length,
                                  (ind) => Artist(
                                      id: modelData[index]['artists'][ind]['id']
                                          .toString(),
                                      name: modelData[index]['artists'][ind]
                                          ['name'])),
                              album: Album(
                                id: modelData[index]['album']['id'],
                                name: modelData[index]['album']['name'],
                                releaseDate: modelData[index]['album']
                                        ['release_date'] ??
                                    "null arha h",
                                totalTracks: modelData[index]['album']
                                        ['total_tracks'] ??
                                    -1,
                              ),
                              durationMs: modelData[index]['duration_ms'],
                              popularity: modelData[index]['popularity'],
                              explicit: modelData[index]['explicit'],
                              previewUrl: modelData[index]['previewUrl'] ??
                                  "Null arha h fr",
                              externalUrls: ExternalUrls(
                                  spotify: modelData[index]['external_urls']
                                      ['spotify']),
                              images: List.generate(
                                modelData[index]['images'].length,
                                (ind) => ImageData(
                                  height: modelData[index]['images'][ind]
                                      ['height'],
                                  width: modelData[index]['images'][ind]
                                      ['width'],
                                  url: modelData[index]['images'][ind]['url'],
                                ),
                              ),
                              releaseDate: modelData[index]['release_date'],
                            ),
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
