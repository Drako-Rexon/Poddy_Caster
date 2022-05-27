import 'package:flutter/material.dart';
import 'package:podcast_app/components/normal_text.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key? key,
    required this.devWidth,
    required this.text,
  }) : super(key: key);
  final String text;
  final double devWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: devWidth - 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFB6580), Color(0xFFF11775)],
        ),
      ),
      child: TextButton(
        style: ButtonStyle(),
        onPressed: () {},
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
