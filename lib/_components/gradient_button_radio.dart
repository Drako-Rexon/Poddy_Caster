import 'package:flutter/material.dart';
import 'package:podcast_app/_components/colors.dart';
import 'package:podcast_app/_components/data_for_dynamic.dart';

class GradientButtonRadio extends StatelessWidget {
  const GradientButtonRadio(
    this.text,
    this.func, {
    Key? key,
    this.txtSize = 18,
    this.textWeight = FontWeight.w400,
    this.isLoading = false,
  }) : super(key: key);
  final String text;
  final double txtSize;
  final FontWeight textWeight;
  final Function? func;
  final bool isLoading;

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
          colors: gradientButton1,
        ),
      ),
      child: TextButton(
        onPressed: () {},
        child: isLoading
            ? CircularProgressIndicator(color: pWhite)
            : Text(
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
