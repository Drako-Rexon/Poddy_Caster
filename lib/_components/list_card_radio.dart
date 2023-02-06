import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast_app/_components/colors.dart';
import 'package:podcast_app/_components/ellipses_text.dart';
import 'package:podcast_app/_components/data_for_dynamic.dart';
import 'package:podcast_app/player_page/player.dart';

class ListCardRadio extends StatelessWidget {
  const ListCardRadio({
    Key? key,
    required this.img,
    required this.mainText,
    required this.subText,
  }) : super(key: key);
  final String img;
  final String mainText;
  final String subText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConfig.screenWidth - 40,
      height: 80,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorsForApp.darkPurple,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 50,
            height: 50,
            padding: EdgeInsets.symmetric(
              horizontal: AppConfig.height10,
              vertical: AppConfig.width10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage(img),
              ),
            ),
          ),
          SizedBox(
            width: AppConfig.screenWidth - 240,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              /* for the text data */ children: [
                EllipsisText(
                  text: mainText,
                  textColor: pWhite,
                  isBold: true,
                  textSize: AppConfig.textSize12,
                ),
                SizedBox(height: 5),
                EllipsisText(
                  text: subText,
                  textColor: ColorsForApp.customGrey,
                  textSize: AppConfig.textSize10,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              Get.to(PlayerPage());
            },
            icon: Icon(
              Icons.more_horiz,
              color: pWhite,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_rounded,
              color: pWhite,
            ),
          ),
        ],
      ),
    );
  }
}
