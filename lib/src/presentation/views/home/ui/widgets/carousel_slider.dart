import 'package:flutter/material.dart';
import 'package:poddy_caster/src/models/song_model.dart';
import 'package:poddy_caster/src/utils/colors.dart';
import 'package:poddy_caster/src/utils/data_for_dynamic.dart';

class CarouselCardHome extends StatelessWidget {
  const CarouselCardHome({
    Key? key,
    // required this.objData,
    required this.song,
  }) : super(key: key);
  // final dynamic objData;
  final SongModel song;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: AppConfig.width10, right: AppConfig.width10),
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: AppConfig.height60 * 2,
            height: AppConfig.height60 * 2,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              image: DecorationImage(
                  image: NetworkImage(song.images[0].url), fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: AppConfig.height5),
          Text(
            song.name.toUpperCase(),
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: pWhite,
              fontSize: AppConfig.textSize12,
              fontFamily: 'CircularStd-Book',
            ),
          ),
          SizedBox(height: AppConfig.height5),
          Text(
            song.album.name.toString(),
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: pPrimaryTextColor,
              fontSize: AppConfig.textSize10,
            ),
          ),
        ],
      ),
    );
  }
}
