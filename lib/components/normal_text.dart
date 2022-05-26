import 'package:flutter/material.dart';

class NormalText extends StatelessWidget {
  const NormalText({
    Key? key,
    required this.text,
    this.textSize = 14,
    this.isBold = false,
    this.textColor = const Color(0xFF7477A0),
  }) : super(key: key);
  final String text;
  final double textSize;
  final bool isBold;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: textSize,
        fontFamily: isBold ? 'CircularStd' : 'CircularStd-Book',
        color: textColor,
      ),
    );
  }
}
