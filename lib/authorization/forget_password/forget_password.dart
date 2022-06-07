import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast_app/authorization/components/gradient_button.dart';
import 'package:podcast_app/authorization/sign_in/sign_in.dart';
import 'package:podcast_app/components/data_for_dynamic.dart';
import 'package:podcast_app/components/normal_text.dart';

class ForgetPassPage extends StatefulWidget {
  const ForgetPassPage({Key? key}) : super(key: key);

  @override
  State<ForgetPassPage> createState() => _ForgetPassPageState();
}

class _ForgetPassPageState extends State<ForgetPassPage> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: SizeForDynamic.screenWidth,
          height: SizeForDynamic.screenHeight,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              radius: 5,
              colors: [
                ColorsForApp.backGradientColor1,
                ColorsForApp.backGradientColor2
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: SizeForDynamic.screenHeight * 0.25),
                  NormalText(
                    text: "Forget Password",
                    textColor: ColorsForApp.customWhite,
                    textSize: SizeForDynamic.textSize24,
                    isBold: true,
                  ),
                  SizedBox(height: SizeForDynamic.height10),
                  NormalText(
                    text:
                        "Enter your email address below.\nWe'll look for your account and send you a\npassword reset email.",
                    align: TextAlign.center,
                  ),
                  SizedBox(height: SizeForDynamic.height30),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF1D192C),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    width: SizeForDynamic.screenWidth - SizeForDynamic.width50,
                    child: TextField(
                      style: TextStyle(color: Color(0xFF7477A0)),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: Color(0xFF7477A0),
                          size: 18,
                        ),
                        suffixIcon: textController.text.isNotEmpty
                            ? Container(width: 0)
                            : IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  setState(() {
                                    textController.clear();
                                  });
                                },
                              ),
                        hintText: "Email Address",
                        hintStyle: TextStyle(
                          fontFamily: 'CircularStd-Book',
                          color: Color(0xFF7477A0),
                          fontSize: 12,
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  SizedBox(height: SizeForDynamic.height20),
                  GradientButton(text: "Send Password Reset"),
                ],
              ),
              SizedBox(height: SizeForDynamic.height80),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NormalText(
                    text: "Already have account?",
                    textSize: 12,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                    ),
                    onPressed: () {
                      Get.to(SignInPage());
                    },
                    child: NormalText(
                      text: "Log In (WORK)",
                      textColor: ColorsForApp.buttonGradientColor1,
                      isBold: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
