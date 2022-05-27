import 'package:flutter/material.dart';
import 'package:podcast_app/components/data_for_dynamic.dart';

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
          EdgeInsets.symmetric(vertical: SizeForDynamic.height15),
        ),
        backgroundColor: MaterialStateProperty.all(backColor),
      ),
      child: Container(
        width: devWidth - SizeForDynamic.width50,
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
