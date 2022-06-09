import 'package:flutter/material.dart';
import 'package:podcast_app/Home/components/ellipses_text.dart';
import 'package:podcast_app/components/data_for_dynamic.dart';

class CarouselCardHome extends StatelessWidget {
  const CarouselCardHome({
    Key? key,
    required this.text1,
    required this.text2,
    required this.img,
  }) : super(key: key);
  final String text1;
  final String text2;
  final String img;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(img),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: EllipsisText(
              text: text1,
              toUpper: true,
              textColor: ColorsForApp.customWhite,
              textSize: SizeForDynamic.textSize12,isBold: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: EllipsisText(
              text: text2,
              textSize: SizeForDynamic.textSize8,
            ),
          ),
        ],
      ),
    );
  }
}
// Text(
//               text1.toUpperCase(),
//               // maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: ColorsForApp.cutomWhite,
//                 fontSize: SizeForDynamic.textSize12,
//               ),
//             ),