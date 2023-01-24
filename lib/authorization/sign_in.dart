import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast_app/Terms_of_service/terms_of_service.dart';
import 'package:podcast_app/_components/colors.dart';
import 'package:podcast_app/_components/gradient_button.dart';
import 'package:podcast_app/authorization/forget_password.dart';
import 'package:podcast_app/authorization/sign_up_page.dart';
import 'package:podcast_app/_components/data_for_dynamic.dart';
import 'package:podcast_app/_components/normal_text.dart';
import 'package:podcast_app/redirecting_page/redirecting_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool value = false;
  bool isVisible = false;
  final textController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textController.addListener(() => setState(() {}));
    // isLoading = false;
  }

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    // double devHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
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
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: SizeForDynamic.height30),
                  isKeyboard
                      ? Container(height: 0)
                      : Container(
                          padding: EdgeInsets.only(
                              left: SizeForDynamic.width50,
                              right: SizeForDynamic.width50),
                          child: Image.asset('assets/images/logo.png',
                              fit: BoxFit.cover),
                        ),
                  SizedBox(height: SizeForDynamic.height30),
                  NormalText(
                    text: "Welcome Back!",
                    isBold: true,
                    textColor: Colors.white,
                    textSize: SizeForDynamic.textSize24,
                  ),
                  NormalText(text: "Login to continue Radio App"),
                  SizedBox(height: SizeForDynamic.height20),
                  Container(
                    decoration: BoxDecoration(
                      color: pDeepPrimary,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    width: SizeForDynamic.screenWidth - SizeForDynamic.width50,
                    child: TextField(
                      controller: emailController,
                      style: TextStyle(color: pLightPrimary),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: pPrimaryTextColor,
                          size: 18,
                        ),
                        suffixIcon: emailController.text.isNotEmpty
                            ? Container(width: 0)
                            : IconButton(
                                icon: Icon(
                                  Icons.close,
                                  color: pPrimaryTextColor,
                                ),
                                onPressed: () {
                                  setState(() {
                                    emailController.clear();
                                  });
                                },
                              ),
                        hintText: "Email Address",
                        hintStyle: TextStyle(
                          fontFamily: 'CircularStd-Book',
                          color: pPrimaryTextColor,
                          fontSize: 12,
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  SizedBox(height: SizeForDynamic.height20),
                  Container(
                    decoration: BoxDecoration(
                      color: pDeepPrimary,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    width: SizeForDynamic.screenWidth - SizeForDynamic.width50,
                    child: TextField(
                      controller: passController,
                      obscureText: !isVisible,
                      style: TextStyle(color: pLightPrimary),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: pPrimaryTextColor,
                          size: 18,
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
                          fontSize: 12,
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: SizeForDynamic.width10 + 2,
                        right: SizeForDynamic.width25 + 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              value: value,
                              activeColor: pDeepPrimary,
                              checkColor: pLightPrimary,
                              shape: CircleBorder(),
                              onChanged: (value) {
                                setState(() {
                                  this.value = value!;
                                });
                              },
                            ),
                            NormalText(text: "Remeber me"),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(ForgetPassPage());
                          },
                          child: NormalText(
                            text: "Forget(WORKING)?",
                            isBold: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GradientButton(
                    "Log In",
                    () {
                      Get.to(RedirectingPage());
                    },
                    isDisable: false,
                    isLoading: isLoading,
                  ),
                  SizedBox(height: SizeForDynamic.height20),
                  NormalText(text: "OR"),
                  SizedBox(height: SizeForDynamic.height20),
                  SignInSocial(
                    "Continue with Google",
                    () {},
                    "assets/images/google-png.png",
                    backColor: pWhite,
                    textColor: pBlack,
                  ),
                  SizedBox(height: SizeForDynamic.height20),
                  SignInSocial(
                    'Continue with Facebook',
                    () {},
                    "assets/images/facebook.png",
                    textColor: pWhite,
                    backColor: Color(0xFF3d599f),
                  ),
                  SizedBox(height: SizeForDynamic.height10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NormalText(
                        text: "Don't have account?",
                        textSize: SizeForDynamic.textSize12,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(SignUpPage());
                        },
                        child: NormalText(
                          text: "Sign Up (WORK)",
                          textColor: ColorsForApp.buttonGradientColor1,
                          isBold: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  NormalText(
                    text: "By signing up you indicate that you have read and",
                    textSize: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NormalText(
                        text: "agreed to the Patch",
                        textSize: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(TermsOfService());
                        },
                        child: NormalText(
                          text: "Terms of Service (WORK)",
                          textSize: 10,
                          textColor: ColorsForApp.buttonGradientColor1,
                        ),
                      ),
                    ],
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
