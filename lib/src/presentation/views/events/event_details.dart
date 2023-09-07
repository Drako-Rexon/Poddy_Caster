import 'dart:async';

import 'package:flutter/material.dart';
import 'package:poddy_caster/src/models/song_model.dart';
import 'package:poddy_caster/src/presentation/views/home/ui/widgets/carousel_slider.dart';
import 'package:poddy_caster/src/utils/colors.dart';
import 'package:poddy_caster/src/utils/data_for_dynamic.dart';
import 'package:poddy_caster/src/data/sample_json.dart';
import 'package:poddy_caster/src/utils/important_functions.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({Key? key, required this.list}) : super(key: key);
  final dynamic list;

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  bool _loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pBackgroundAppColor,
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
        child: Visibility(
          visible: _loading,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Stack(
                children: [
                  Image.asset(
                    widget.list['img'],
                    height: AppConfig.screenHeight / 2,
                    width: AppConfig.screenWidth,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    children: [
                      Container(
                        height: AppConfig.screenHeight / 2,
                        width: AppConfig.screenWidth,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [trans, pBackgroundAppColor],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.list['mainTitle'],
                              style: TextStyle(
                                color: pWhite,
                                fontFamily: 'CircularStd',
                                fontSize: AppConfig.textSize24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              widget.list['des'],
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: pWhite,
                                fontFamily: 'CircularStd-Book',
                                fontSize: AppConfig.textSize18 - 2,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            SizedBox(
                              height: AppConfig.height60 * 3,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: modelData.length,
                                  itemBuilder: (BuildContext context,
                                          int index) =>
                                      InkWell(
                                        onTap: () {
                                          navigateRoute(
                                              context,
                                              EventDetails(
                                                  list: events1[index]));
                                        },
                                        child: CarouselCardHome(
                                          song: SongModel(
                                            id: modelData[index]['id'],
                                            name: modelData[index]['name'],
                                            artists: List.generate(
                                                modelData[index]['artists']
                                                    .length,
                                                (ind) => Artist(
                                                    id: modelData[index]
                                                                ['artists'][ind]
                                                            ['id']
                                                        .toString(),
                                                    name: modelData[index]
                                                            ['artists'][ind]
                                                        ['name'])),
                                            album: Album(
                                              id: modelData[index]['album']
                                                  ['id'],
                                              name: modelData[index]['album']
                                                  ['name'],
                                              releaseDate: modelData[index]
                                                          ['album']
                                                      ['release_date'] ??
                                                  "null arha h",
                                              totalTracks: modelData[index]
                                                          ['album']
                                                      ['total_tracks'] ??
                                                  -1,
                                            ),
                                            durationMs: modelData[index]
                                                ['duration_ms'],
                                            popularity: modelData[index]
                                                ['popularity'],
                                            explicit: modelData[index]
                                                ['explicit'],
                                            previewUrl: modelData[index]
                                                    ['previewUrl'] ??
                                                "Null arha h fr",
                                            externalUrls: ExternalUrls(
                                                spotify: modelData[index]
                                                        ['external_urls']
                                                    ['spotify']),
                                            images: List.generate(
                                              modelData[index]['images'].length,
                                              (ind) => ImageData(
                                                height: modelData[index]
                                                    ['images'][ind]['height'],
                                                width: modelData[index]
                                                    ['images'][ind]['width'],
                                                url: modelData[index]['images']
                                                    [ind]['url'],
                                              ),
                                            ),
                                            releaseDate: modelData[index]
                                                ['release_date'],
                                          ),
                                        ),
                                      )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            popScreen(context);
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: pLightPink,
                          ),
                        ),
                        Text(
                          "Events",
                          style: TextStyle(
                            color: pWhite,
                            fontSize: AppConfig.textSize24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            size: 26,
                            color: pPrimaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
