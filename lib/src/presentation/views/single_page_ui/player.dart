import 'package:flutter/material.dart';
import 'package:poddy_caster/src/models/song_model.dart';
import 'package:poddy_caster/src/utils/colors.dart';
import 'package:poddy_caster/src/utils/data_for_dynamic.dart';
import 'package:poddy_caster/src/utils/important_functions.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({
    Key? key,
    // required this.data,
    required this.song,
  }) : super(key: key);
  // final dynamic data;
  final SongModel song;

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  double _currVal = 0.0;
  double minLen = 0.0;
  double maxLen = 10.0;
  IconData currentButton = Icons.play_arrow_rounded;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pBackground,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: AppConfig.screenHeight / 3,
              width: AppConfig.screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.song.images[0].url),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: AppConfig.screenHeight / 3,
              width: AppConfig.screenWidth,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    pBackgroundAppColor,
                    trans,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConfig.width20),
              child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(height: AppConfig.screenHeight / 6),
                      Container(
                        width: AppConfig.screenWidth / 2,
                        height: AppConfig.screenWidth / 2,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                          image: DecorationImage(
                            image: NetworkImage(widget.song.images[0].url),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          AppConfig.height10,
                          0,
                          AppConfig.height5,
                        ),
                        child: Text(
                          widget.song.name.toUpperCase(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: pWhite,
                            fontSize: AppConfig.textSize24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        widget.song.album.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: pPrimaryTextColor,
                          fontSize: AppConfig.textSize12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "00:10",
                        style: TextStyle(
                          color: pWhite,
                          fontFamily: 'CircularStd-Book',
                          fontSize: 14,
                        ),
                      ),
                      Expanded(
                        child: Slider(
                          activeColor: pDarkPink,
                          min: minLen,
                          max: maxLen,
                          value: _currVal,
                          onChanged: (double val) {
                            setState(() {
                              _currVal = val;
                            });
                          },
                        ),
                      ),
                      const Text(
                        "00:50",
                        style: TextStyle(
                          color: pWhite,
                          fontFamily: 'CircularStd-Book',
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          overlayColor: MaterialStateProperty.all(trans),
                          onTap: () {
                            // _musicController.getData('dff');
                            setState(() {
                              _currVal = maxLen / 4;
                            });
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: pWhite,
                            size: AppConfig.height30,
                          ),
                        ),
                        InkWell(
                          overlayColor: MaterialStateProperty.all(trans),
                          onTap: () {},
                          child: Container(
                            height: 90,
                            width: 90,
                            decoration: const BoxDecoration(
                              color: pDeepPrimary,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              currentButton,
                              size: AppConfig.height60,
                              color: pWhite,
                            ),
                          ),
                        ),
                        InkWell(
                          overlayColor: MaterialStateProperty.all(trans),
                          onTap: () {
                            setState(() {
                              _currVal = maxLen * 3 / 4;
                            });
                          },
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: pWhite,
                            size: AppConfig.height30,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                popScreen(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 36,
                color: pLightPink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
