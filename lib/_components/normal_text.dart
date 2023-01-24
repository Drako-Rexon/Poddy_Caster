import 'package:flutter/material.dart';
import 'package:podcast_app/_components/colors.dart';

class NormalText extends StatelessWidget {
  const NormalText({
    Key? key,
    required this.text,
    this.textSize = 14,
    this.isBold = false,
    this.textColor = pPrimaryTextColor,
    this.align = TextAlign.justify,
    this.toUpper = false,
  }) : super(key: key);
  final String text;
  final double textSize;
  final bool isBold;
  final Color textColor;
  final TextAlign align;
  final bool toUpper;

  @override
  Widget build(BuildContext context) {
    return Text(
      toUpper ? text.toUpperCase() : text,
      textAlign: align,
      style: TextStyle(
        fontSize: textSize,
        fontFamily: isBold ? 'CircularStd' : 'CircularStd-Book',
        color: textColor,
      ),
    );
  }
}
