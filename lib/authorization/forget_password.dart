import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast_app/_components/colors.dart';
import 'package:podcast_app/_components/util_widgets.dart';
import 'package:podcast_app/authorization/sign_in.dart';
import 'package:podcast_app/_components/data_for_dynamic.dart';
import 'package:podcast_app/_components/normal_text.dart';

class ForgetPassPage extends StatefulWidget {
  const ForgetPassPage({Key? key}) : super(key: key);

  @override
  State<ForgetPassPage> createState() => _ForgetPassPageState();
}

class _ForgetPassPageState extends State<ForgetPassPage> {
  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: AppConfig.screenWidth,
          height: AppConfig.screenHeight,
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
                  SizedBox(height: AppConfig.screenHeight * 0.25),
                  NormalText(
                    text: "Forget Password",
                    textColor: pWhite,
                    textSize: AppConfig.textSize24,
                    isBold: true,
                  ),
                  SizedBox(height: AppConfig.height10),
                  NormalText(
                    text:
                        "Enter your email address below.\nWe'll look for your account and send you a\npassword reset email.",
                    align: TextAlign.center,
                  ),
                  SizedBox(height: AppConfig.height30),
                  Container(
                    decoration: BoxDecoration(
                      color: pDeepPrimary,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    width: AppConfig.screenWidth - AppConfig.width50,
                    child: TextFormField(
                      cursorColor: pPrimaryTextColor,
                      style: TextStyle(color: pLightPrimary),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: pLightPrimary,
                          size: AppConfig.textSize18,
                        ),
                        suffixIcon: textController.text.isEmpty
                            ? Container(width: 0)
                            : IconButton(
                                icon: Icon(Icons.close, color: pLightPrimary),
                                onPressed: () {
                                  setState(() {
                                    textController.clear();
                                  });
                                },
                              ),
                        hintText: "Email Address",
                        hintStyle: TextStyle(
                          fontFamily: 'CircularStd-Book',
                          color: pLightPrimary,
                          fontSize: AppConfig.textSize12,
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  SizedBox(height: AppConfig.height20),
                  GradientButton(
                    "Send Password Reset",
                    () {},
                    isDisable: false,
                  ),
                ],
              ),
              SizedBox(height: AppConfig.height80),
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
                      textColor: pLightPink,
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
