import 'package:flutter/material.dart';
import 'package:poddy_caster/src/models/song_model.dart';
import 'package:poddy_caster/src/presentation/views/single_page_ui/player.dart';
import 'package:poddy_caster/src/utils/colors.dart';
import 'package:poddy_caster/src/utils/data_for_dynamic.dart';
import 'package:poddy_caster/src/utils/important_functions.dart';

class ListCardBottomHome extends StatefulWidget {
  const ListCardBottomHome({
    Key? key,
    // this.fav = false,
    // this.radio = false,
    required this.song,
  }) : super(key: key);
  // final dynamic list;
  // bool fav;
  // final bool radio;
  // final Function? func;
  final SongModel song;

  @override
  State<ListCardBottomHome> createState() => _ListCardBottomHomeState();
}

class _ListCardBottomHomeState extends State<ListCardBottomHome> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(trans),
      onTap: () {
        // widget.func!();
        navigateRoute(context, PlayerPage(song: widget.song));
      },
      child: Container(
        width: AppConfig.screenWidth - 40,
        height: AppConfig.height80,
        padding: EdgeInsets.all(AppConfig.height10),
        decoration: const BoxDecoration(
          color: ColorsForApp.darkPurple,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: AppConfig.width15),
                  width: AppConfig.height50,
                  height: AppConfig.height50,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                      image: NetworkImage(widget.song.images[0].url),
                    ),
                  ),
                ),
                SizedBox(
                  width: AppConfig.screenWidth - (AppConfig.width30 * 7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.song.name.toUpperCase(),
                        // widget.list['mainTitle'].toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: pWhite,
                          fontSize: AppConfig.textSize14,
                          fontFamily: 'CircularStd-Book',
                        ),
                      ),
                      SizedBox(height: AppConfig.height5),
                      Text(
                        widget.song.album.name.toString(),
                        // widget.list['subTitle'],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: AppConfig.textSize12,
                          color: pCustomGrey,
                          fontFamily: 'CircularStd-Book',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    // widget.func!();
                    navigateRoute(
                        context,
                        PlayerPage(
                          song: widget.song,
                        ));
                  },
                  child: Icon(
                    Icons.more_horiz,
                    color: pPrimaryTextColor,
                    size: AppConfig.textSize18,
                  ),
                ),
                // widget.radio
                // true
                //     ?
                Row(
                  children: [
                    SizedBox(width: AppConfig.width10),
                    InkWell(
                      overlayColor: MaterialStateProperty.all(trans),
                      onTap: () {
                        // setState(() {
                        //   widget.fav
                        //       ? widget.fav = false
                        //       : widget.fav = true;
                        // });
                      },
                      child: const Icon(
                        // widget.fav
                        //     ? Icons.favorite
                        // :
                        Icons.favorite_border,
                        color: pPrimaryTextColor,
                        size: 18,
                      ),
                    ),
                  ],
                ),
                // : Container(),
                SizedBox(width: AppConfig.width10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
