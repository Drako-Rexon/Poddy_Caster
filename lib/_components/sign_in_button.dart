import 'package:flutter/material.dart';
import 'package:podcast_app/_components/data_for_dynamic.dart';

class SignInButtoncustom extends StatelessWidget {
  SignInButtoncustom({
    Key? key,
    this.backColor = Colors.white,
    this.textColor = Colors.black,
    required this.text,
    required this.iconLocation,
    this.login,
  }) : super(key: key);
  final Color backColor;
  final Color textColor;
  final String text;
  final String iconLocation;
  Function? login;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return ElevatedButton(
      onPressed: () {
        login;
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: SizeForDynamic.height15),
        ),
        backgroundColor: MaterialStateProperty.all(backColor),
      ),
      child: Container(
        width: screenWidth - SizeForDynamic.width50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(iconLocation),
              width: SizeForDynamic.width40,
              height: SizeForDynamic.height20,
            ),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 13,
                fontFamily: 'CircularStd',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
