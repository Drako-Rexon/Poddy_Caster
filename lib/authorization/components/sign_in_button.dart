import 'package:flutter/material.dart';

class SignInButtoncustom extends StatelessWidget {
  const SignInButtoncustom(
      {Key? key,
      this.backColor = Colors.white,
      this.textColor = Colors.black,
      required this.text,
      required this.iconLocation})
      : super(key: key);
  final Color backColor;
  final Color textColor;
  final String text;
  final String iconLocation;

  @override
  Widget build(BuildContext context) {
    double devWidth = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 14),
          ),
          backgroundColor: MaterialStateProperty.all(backColor)),
      child: Container(
        width: devWidth - 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(iconLocation),
              width: 40,
              height: 20,
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
