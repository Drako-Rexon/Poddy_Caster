import 'package:flutter/material.dart';
import 'package:podcast_app/_components/colors.dart';
import 'package:podcast_app/_components/data_for_dynamic.dart';
import 'package:podcast_app/_components/normal_text.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final Function func;
  final bool isDisable;

  const GradientButton(
    this.text,
    this.func, {
    Key? key,
    this.isLoading = false,
    this.isDisable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        func();
      },
      child: Container(
        width: AppConfig.screenWidth - AppConfig.width50,
        height: AppConfig.height40 + AppConfig.height5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDisable ? disableGradient : gradientButton1,
          ),
        ),
        child: isLoading
            ? CircularProgressIndicator(color: pWhite)
            : Center(
                child: NormalText(
                  text: text,
                  textColor: pWhite,
                  textSize: 18,
                  isBold: true,
                ),
              ),
      ),
    );
  }
}

class SignInSocial extends StatelessWidget {
  final String text;
  final bool isLoading;
  final Function func;
  final bool isDisable;
  final String iconLocation;
  final Color textColor;
  final Color backColor;

  const SignInSocial(
    this.text,
    this.func,
    this.iconLocation, {
    Key? key,
    this.isLoading = false,
    this.isDisable = true,
    this.textColor = pWhite,
    this.backColor = pDeepPrimary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        func();
      },
      child: Container(
        width: AppConfig.screenWidth - AppConfig.width50,
        height: AppConfig.height40 + AppConfig.height5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          color: backColor,
        ),
        child: isLoading
            ? CircularProgressIndicator(color: pWhite)
            : Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(iconLocation),
                      width: AppConfig.width40,
                      height: AppConfig.height20,
                    ),
                    NormalText(
                      text: text,
                      textColor: textColor,
                      isBold: true,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
