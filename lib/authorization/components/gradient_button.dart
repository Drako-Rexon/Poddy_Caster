import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast_app/components/data_for_dynamic.dart';
import 'package:podcast_app/components/normal_text.dart';
import 'package:podcast_app/redirecting_page/redirecting_page.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  // Function? func;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeForDynamic.screenWidth - SizeForDynamic.width50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFB6580), Color(0xFFF11775)],
        ),
      ),
      child: TextButton(
        onPressed: () {
          Get.to(RedirectingPage());
        },
        child: NormalText(
          text: text,
          textColor: Colors.white,
          textSize: 18,
          isBold: true,
        ),
      ),
    );
  }
}
