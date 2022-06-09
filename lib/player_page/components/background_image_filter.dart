import 'package:flutter/material.dart';
import 'package:podcast_app/components/data_for_dynamic.dart';

class BackGroundImageFilter extends StatelessWidget {
  const BackGroundImageFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: SizeForDynamic.screenHeight * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage('assets/images/Image-7.png'),
            ),
          ),
        ),
        Column(
          // mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: SizeForDynamic.screenHeight * 0.3,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  // begin: Alignment.bottomCenter,
                  // end: Alignment.topCenter,
                  radius: 0.75,
                  colors: [
                    // ColorsForApp.backGradientColor1.withOpacity(0.1),
                    // ColorsForApp.backGradientColor1.withOpacity(0.8),
                    // ColorsForApp.backGradientColor1.withOpacity(0.9),
                    // ColorsForApp.backGradientColor1.withOpacity(1),
                    // ColorsForApp.backGradientColor1,
                    ColorsForApp.backImagRadial1.withOpacity(0.5),
                    ColorsForApp.backImagRadial2.withOpacity(0.7),
                    ColorsForApp.backImagRadial3.withOpacity(0.9),
                  ],
                ),
              ),
            ),
            Container(
              height: SizeForDynamic.screenHeight * 0.669,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    // ColorsForApp.backGradientColor1,
                    ColorsForApp.backImagRadial3.withOpacity(1),
                    ColorsForApp.backGradientColor2,
                  ],
                  radius: 2,
                ),
              ),
            )
          ],
        ),
        Container(
          height: SizeForDynamic.screenHeight,
          decoration: BoxDecoration(
            color: ColorsForApp.backGradientColor1.withOpacity(0.2),
          ),
        ),
      ],
    );
  }
}
