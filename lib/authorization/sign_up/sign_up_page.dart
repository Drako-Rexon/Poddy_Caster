import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast_app/authorization/components/gradient_button.dart';
import 'package:podcast_app/authorization/components/sign_in_button.dart';
import 'package:podcast_app/authorization/sign_in/sign_in.dart';
import 'package:podcast_app/components/data_for_dynamic.dart';
import 'package:podcast_app/components/normal_text.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool value = false;
  bool isVisible = false;
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          // keyboardDismissBehavior:
          // ScrollViewKeyboardDismissBehavior.onDrag,
          // SingleChildScrollView(
          //   controller: controller,
          //   child: Column(
          //   ),
          // ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: SizeForDynamic.height80),
              NormalText(
                text: "Sign Up",
                textColor: Colors.white,
                textSize: SizeForDynamic.textSize12,
                isBold: true,
              ),
              SizedBox(height: SizeForDynamic.height5),
              NormalText(
                text: "Sign Up and Start Learning",
              ),
              SizedBox(height: SizeForDynamic.height20),
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
                      Icons.person_outline_outlined,
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
                    hintText: "User Name",
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
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF1D192C),
                  borderRadius: BorderRadius.circular(6),
                ),
                width: SizeForDynamic.screenWidth - SizeForDynamic.width50,
                child: TextField(
                  obscureText: !isVisible,
                  style: TextStyle(color: Color(0xFF7477A0)),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Color(0xFF7477A0),
                      size: 18,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(isVisible
                          ? Icons.visibility_off
                          : Icons.remove_red_eye),
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(
                      fontFamily: 'CircularStd-Book',
                      color: Color(0xFF7477A0),
                      fontSize: 12,
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                ),
              ),
              SizedBox(height: SizeForDynamic.height10),
              Row(
                children: [
                  Checkbox(
                    value: value,
                    activeColor: ColorsForApp.buttonGradientColor1,
                    checkColor: ColorsForApp.cutomWhite,
                    shape: CircleBorder(),
                    onChanged: (value) {
                      setState(() {
                        this.value = value!;
                      });
                    },
                  ),
                  Container(
                    width: SizeForDynamic.screenWidth - SizeForDynamic.width70,
                    child: NormalText(
                        textSize: SizeForDynamic.textSize12,
                        text:
                            "Yes! I want to get the most out of Ezymaster by\n receiving emails with exclusive deals and learning tips!"),
                  )
                ],
              ),
              SizedBox(height: SizeForDynamic.height20),
              GradientButton(text: "Sign Up"),
              SizedBox(height: SizeForDynamic.height20),
              NormalText(text: "OR"),
              SizedBox(height: SizeForDynamic.height20),
              SignInButtoncustom(
                text: "Continue with Google",
                iconLocation: 'assets/images/google-png.png',
              ),
              SizedBox(height: SizeForDynamic.height20),
              SignInButtoncustom(
                text: "Continue with Facebook",
                iconLocation: 'assets/images/fb.jpg',
                backColor: ColorsForApp.fbColor,
                textColor: ColorsForApp.cutomWhite,
              ),
              SizedBox(height: SizeForDynamic.height30),
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
                      text: "Sign Up",
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
