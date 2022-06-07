import 'package:flutter/material.dart';
import 'package:podcast_app/components/data_for_dynamic.dart';

class GradientButtonRadio extends StatelessWidget {
  const GradientButtonRadio({
    Key? key,
    required this.text,
    this.txtSize = 18,
    this.textWeight = FontWeight.w400,
  }) : super(key: key);
  final String text;
  final double txtSize;
  final FontWeight textWeight;
  // Function? func;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeForDynamic.screenWidth - 300,
      height: SizeForDynamic.width35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFB6580), Color(0xFFF11775)],
        ),
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: textWeight,
            fontSize: txtSize,
          ),
        ),
      ),
    );
  }
}
