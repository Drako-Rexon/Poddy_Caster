import 'package:flutter/material.dart';
import 'package:poddy_caster/src/models/song_model.dart';
import 'package:poddy_caster/src/presentation/widgets/list_widget.dart';
import 'package:poddy_caster/src/utils/colors.dart';
import 'package:poddy_caster/src/data/sample_json.dart';
import 'package:poddy_caster/src/utils/data_for_dynamic.dart';
import 'package:poddy_caster/src/utils/util_widgets.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pBackgroundAppColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          style: ButtonStyle(overlayColor: MaterialStateProperty.all(trans)),
          icon: const Icon(
            Icons.arrow_back,
            color: pLightPink,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Search',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: pWhite,
            fontSize: AppConfig.textSize24,
          ),
        ),
        backgroundColor: pBackgroundAppColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextFormField(
                style: const TextStyle(color: pBackgroundAppColor),
                cursorColor: pLightPrimary,
                decoration: const InputDecoration(
                  fillColor: pBackground,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  prefixIcon: Icon(Icons.search, color: pLightPrimary),
                  hintText: "Search",
                  hintStyle: TextStyle(color: pLightPrimary),
                ),
              ),
            ),
            SizedBox(
              height: AppConfig.screenHeight * 2 / 3,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: AppConfig.height60 * 2,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: radioPopularBroadCard.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ProfileCards(
                              hei: 120,
                              wid: 120,
                            );
                          }),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: modelData.length *
                          (AppConfig.height80 + AppConfig.height10),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: modelData.length,
                        itemBuilder: (BuildContext context, int index) =>
                            Column(
                          children: [
                            ListCardBottomHome(
                              song: SongModel(
                                id: modelData[index]['id'],
                                name: modelData[index]['name'],
                                artists: List.generate(
                                    modelData[index]['artists'].length,
                                    (ind) => Artist(
                                        id: modelData[index]['artists'][ind]
                                                ['id']
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
                            SizedBox(height: AppConfig.height10),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
