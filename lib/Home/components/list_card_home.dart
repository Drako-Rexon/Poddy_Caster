import 'package:flutter/material.dart';
import 'package:podcast_app/Home/components/ellipses_text.dart';
import 'package:podcast_app/components/data_for_dynamic.dart';

class ListCardBottomHome extends StatelessWidget {
  const ListCardBottomHome({
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
      width: SizeForDynamic.screenWidth - 40,
      height: 80,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorsForApp.darkPurple,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 50,
            height: 50,
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
            width: SizeForDynamic.screenWidth - 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              /* for the text data */ children: [
                EllipsisText(
                  text: mainText,
                  textColor: ColorsForApp.cutomWhite,
                  isBold: true,
                  textSize: SizeForDynamic.textSize12,
                ),
                SizedBox(height: 5),
                EllipsisText(
                  text: subText,
                  textColor: ColorsForApp.customGrey,
                  textSize: SizeForDynamic.textSize10,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz,
              color: ColorsForApp.cutomWhite,
            ),
          ),
        ],
      ),
    );
  }
}
