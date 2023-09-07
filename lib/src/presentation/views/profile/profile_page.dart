import 'dart:async';
import 'package:flutter/material.dart';
import 'package:poddy_caster/src/models/song_model.dart';
import 'package:poddy_caster/src/presentation/widgets/list_widget.dart';
import 'package:poddy_caster/src/utils/colors.dart';
import 'package:poddy_caster/src/data/sample_json.dart';
import 'package:poddy_caster/src/utils/data_for_dynamic.dart';
import 'package:poddy_caster/src/utils/util_widgets.dart';
import 'package:poddy_caster/src/presentation/views/profile/more.dart';
import 'package:poddy_caster/src/utils/important_functions.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _loading = true;
  bool fav = false;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      replacement: const Center(
          child: CircularProgressIndicator(color: pPrimaryTextColor)),
      visible: _loading,
      child: Scaffold(
        backgroundColor: pBackground,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: pBackground,
          title: const Text("Profile"),
          centerTitle: true,
          actions: [
            InkWell(
              overlayColor: MaterialStateProperty.all(trans),
              onTap: () {
                navigateRoute(context, const More());
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.more_vert, size: 26),
              ),
            ),
          ],
        ),
        body: RefreshIndicator(
          color: pPrimaryTextColor,
          backgroundColor: pDeepPrimary,
          onRefresh: () async {
            setState(() {
              _loading = false;
            });
            Timer(const Duration(milliseconds: 1500), () {
              setState(() {
                _loading = true;
              });
            });
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppConfig.height20),
                Center(
                  child: Column(
                    children: [
                      Container(
                        height: AppConfig.height60 * 2,
                        width: 120,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: pLightPink,
                              blurRadius: 5,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Visibility(
                          replacement: const Center(
                            child: CircularProgressIndicator(
                                color: pPrimaryTextColor),
                          ),
                          visible: _loading,
                          child: CircleAvatar(
                            radius: AppConfig.width50 + AppConfig.width10,
                            backgroundImage:
                                const AssetImage('assets/images/avatar.jpg'),
                          ),
                        ),
                      ),
                      SizedBox(height: AppConfig.height20),
                      const Text(
                        "Drako Rexon",
                        style: TextStyle(
                          color: pWhite,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "drakocodeforever@gmail.com",
                        style: TextStyle(
                          color: pPrimaryTextColor,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Favourite Podcasts",
                        style: TextStyle(color: pWhite),
                      ),
                      SizedBox(height: AppConfig.height10),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: modelData.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ProfileCards(fav: fav);
                            }),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppConfig.height20),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    "Favourite Radio Stations",
                    style: TextStyle(
                      color: pWhite,
                    ),
                  ),
                ),
                SizedBox(height: AppConfig.height10),
                SizedBox(
                  height: modelData.length *
                      (AppConfig.height80 + AppConfig.height10),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: modelData.length,
                    itemBuilder: (BuildContext context, int index) => Column(
                      children: [
                        ListCardBottomHome(
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
                                width: modelData[index]['images'][ind]['width'],
                                url: modelData[index]['images'][ind]['url'],
                              ),
                            ),
                            releaseDate: modelData[index]['release_date'],
                          ),
                        ),
                        SizedBox(height: AppConfig.height10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
