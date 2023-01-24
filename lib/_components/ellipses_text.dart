import 'package:flutter/material.dart';

class EllipsisText extends StatelessWidget {
  const EllipsisText({
    Key? key,
    required this.text,
    this.toUpper = false,
    this.textColor = const Color(0xFF5C5E6F),
    this.textSize = 8,
    this.isBold = false,
  }) : super(key: key);
  final String text;
  final bool toUpper;
  final Color textColor;
  final double textSize;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return Text(
      toUpper ? text.toUpperCase() : text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        color: textColor,
        fontSize: textSize,
        fontFamily: 'CircularStd-Book',
      ),
    );
  }
}
