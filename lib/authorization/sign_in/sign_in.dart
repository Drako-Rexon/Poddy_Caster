import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast_app/Terms_of_service/terms_of_service.dart';
import 'package:podcast_app/authorization/components/gradient_button.dart';
import 'package:podcast_app/authorization/components/sign_in_button.dart';
import 'package:podcast_app/authorization/forget_password/forget_password.dart';
import 'package:podcast_app/authorization/sign_up/sign_up_page.dart';
import 'package:podcast_app/components/data_for_dynamic.dart';
import 'package:podcast_app/components/normal_text.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool value = false;
  bool isVisible = false;
  final textController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textController.addListener(() => setState(() {}));
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
                  // SizedBox(height: SizeForDynamic.height20),
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
                              value: value,
                              activeColor: Color(0xFF1D192C),
                              checkColor: Color(0xFF7B7B8B),
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
                        FlatButton(
                          onPressed: () {
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
                  GradientButton(text: "Log In"),
                  SizedBox(height: SizeForDynamic.height20),
                  NormalText(text: "OR"),
                  SizedBox(height: SizeForDynamic.height20),
                  SignInButtoncustom(
                    text: "Continue with Google",
                    iconLocation: "assets/images/google-png.png",
                  ),
                  SizedBox(height: SizeForDynamic.height20),
                  SignInButtoncustom(
                    text: "Continue with Facebook",
                    iconLocation: "assets/images/fb.jpg",
                    backColor: ColorsForApp.fbColor,
                    textColor: ColorsForApp.cutomWhite,
                  ),
                  SizedBox(height: SizeForDynamic.height10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NormalText(
                        text: "Don't have account?",
                        textSize: SizeForDynamic.textSize12,
                      ),
                      TextButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                        ),
                        onPressed: () {
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
                  // SizedBox(height: SizeForDynamic.height30),
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
