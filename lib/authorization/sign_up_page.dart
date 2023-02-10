import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast_app/_components/colors.dart';
import 'package:podcast_app/_components/util_function.dart';
import 'package:podcast_app/_components/util_widgets.dart';
import 'package:podcast_app/authorization/sign_in.dart';
import 'package:podcast_app/_components/data_for_dynamic.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool value = false;
  bool isVisible = false;
  // TextEditingController textController = TextEditingController();
  late TextEditingController _usernameController; // = TextEditingController();
  late TextEditingController _mailController; // = TextEditingController();
  late TextEditingController _passwordController; // = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _mailController = TextEditingController();
    _passwordController = TextEditingController();
    _usernameController.addListener(() {
      setState(() {});
    });
    _mailController.addListener(() {
      setState(() {});
    });
    _passwordController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _mailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    pPrintLog("text:", _usernameController.text.isEmpty);
    return Scaffold(
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
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: AppConfig.height60),
                    NormalText(
                      text: "Sign Up",
                      textColor: pWhite,
                      textSize: AppConfig.textSize24,
                      isBold: true,
                    ),
                    SizedBox(height: AppConfig.height5),
                    NormalText(text: "Sign Up and Start Learning"),
                    SizedBox(height: AppConfig.height20),
                    Container(
                      decoration: BoxDecoration(
                        color: pDeepPrimary,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      width: AppConfig.screenWidth - AppConfig.width50,
                      child: TextField(
                        cursorColor: pPrimaryTextColor,
                        controller: _usernameController,
                        style: TextStyle(color: pPrimaryTextColor),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.person_outline_outlined,
                            color: pPrimaryTextColor,
                            size: AppConfig.textSize18,
                          ),
                          suffixIcon: _usernameController.text.isEmpty
                              ? Container(width: 0)
                              : InkWell(
                                  child: Icon(
                                    Icons.close,
                                    color: pPrimaryTextColor,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      _usernameController.clear();
                                    });
                                  },
                                ),
                          hintText: "User Name",
                          hintStyle: TextStyle(
                            fontFamily: 'CircularStd-Book',
                            color: pPrimaryTextColor,
                            fontSize: AppConfig.textSize12,
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    SizedBox(height: AppConfig.height20),
                    Container(
                      decoration: BoxDecoration(
                        color: pDeepPrimary,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      width: AppConfig.screenWidth - AppConfig.width50,
                      child: TextField(
                        cursorColor: pPrimaryTextColor,
                        controller: _mailController,
                        style: TextStyle(color: pPrimaryTextColor),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            color: pPrimaryTextColor,
                            size: AppConfig.textSize18,
                          ),
                          suffixIcon: _mailController.text.isEmpty
                              ? Container(width: 0)
                              : IconButton(
                                  icon: Icon(
                                    Icons.close,
                                    color: pPrimaryTextColor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _mailController.clear();
                                    });
                                  },
                                ),
                          hintText: "Email Address",
                          hintStyle: TextStyle(
                            fontFamily: 'CircularStd-Book',
                            color: pPrimaryTextColor,
                            fontSize: AppConfig.textSize12,
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    SizedBox(height: AppConfig.height20),
                    Container(
                      decoration: BoxDecoration(
                        color: pDeepPrimary,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      width: AppConfig.screenWidth - AppConfig.width50,
                      child: TextField(
                        cursorColor: pPrimaryTextColor,
                        controller: _passwordController,
                        obscureText: isVisible,
                        style: TextStyle(color: pPrimaryTextColor),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: pPrimaryTextColor,
                            size: AppConfig.textSize18,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isVisible
                                  ? Icons.visibility_off
                                  : Icons.remove_red_eye,
                              color: pPrimaryTextColor,
                            ),
                            onPressed: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(
                            fontFamily: 'CircularStd-Book',
                            color: pPrimaryTextColor,
                            fontSize: AppConfig.textSize12,
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    SizedBox(height: AppConfig.height10),
                    Row(
                      children: [
                        Checkbox(
                          value: value,
                          activeColor: pLightPink,
                          checkColor: pWhite,
                          shape: CircleBorder(),
                          onChanged: (value) {
                            setState(() {
                              this.value = value!;
                            });
                          },
                        ),
                        Container(
                          width: AppConfig.screenWidth - AppConfig.width70,
                          child: NormalText(
                              textSize: AppConfig.textSize12,
                              text:
                                  "Yes! I want to get the most out of Ezymaster by\n receiving emails with exclusive deals and learning tips!"),
                        )
                      ],
                    ),
                    SizedBox(height: AppConfig.height20),
                    GradientButton(
                      "Sign Up",
                      () {
                        Get.offAll(() => SignInPage());
                      },
                      isDisable: (_usernameController.text.isNotEmpty &&
                              _mailController.text.isNotEmpty &&
                              _passwordController.text.isNotEmpty)
                          ? false
                          : true,
                    ),
                    SizedBox(height: AppConfig.height20),
                    NormalText(text: "OR"),
                    SizedBox(height: AppConfig.height20),
                    SignInSocial(
                      "Continue with Google",
                      () {},
                      "assets/images/google-png.png",
                      backColor: pWhite,
                      textColor: pBlack,
                    ),
                    SizedBox(height: AppConfig.height20),
                    SignInSocial(
                      'Continue with Facebook',
                      () {},
                      "assets/images/facebook.png",
                      textColor: pWhite,
                      backColor: pFB,
                    ),
                    SizedBox(height: AppConfig.height30),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NormalText(
                      text: "Already have account?",
                      textSize: AppConfig.textSize12,
                    ),
                    TextButton(
                      style: ButtonStyle(
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(0)),
                      ),
                      onPressed: () {
                        Get.to(SignInPage());
                      },
                      child: NormalText(
                        text: "Log In",
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
      ),
    );
  }
}
