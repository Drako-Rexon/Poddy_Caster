import 'package:flutter/material.dart';
import 'package:poddy_caster/src/presentation/widgets/gradient_button.dart';
import 'package:poddy_caster/src/utils/colors.dart';
import 'package:poddy_caster/src/utils/data_for_dynamic.dart';
import 'package:poddy_caster/src/utils/util_widgets.dart';
import 'package:poddy_caster/src/presentation/views/auth/sign_in.dart';
import 'package:poddy_caster/src/utils/important_functions.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool value = false;
  bool isVisible = false;
  late TextEditingController _usernameController;
  late TextEditingController _mailController;
  late TextEditingController _passwordController;

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
          decoration: const BoxDecoration(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      SizedBox(height: AppConfig.height60),
                      NormalText(
                        text: "Sign Up",
                        textColor: pWhite,
                        textSize: AppConfig.textSize24,
                        isBold: true,
                      ),
                      SizedBox(height: AppConfig.height5),
                      const NormalText(text: "Sign Up and Start Learning"),
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
                          style: const TextStyle(color: pPrimaryTextColor),
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
                                    child: const Icon(
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
                          style: const TextStyle(color: pPrimaryTextColor),
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
                                    icon: const Icon(
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
                          style: const TextStyle(color: pPrimaryTextColor),
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
                            shape: const CircleBorder(),
                            onChanged: (value) {
                              setState(() {
                                this.value = value!;
                              });
                            },
                          ),
                          Flexible(
                            child: Text(
                              "Yes! I want to get the most out of Ezymaster by receiving emails with exclusive deals and learning tips!",
                              textAlign: TextAlign.justify,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: AppConfig.textSize12,
                                  color: pPrimaryTextColor,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppConfig.height20),
                      GradientButton(
                        "Sign Up",
                        () {},
                        isDisable: (_usernameController.text.isNotEmpty &&
                                RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(_mailController.text) &&
                                _passwordController.text.isNotEmpty)
                            ? false
                            : true,
                      ),
                      SizedBox(height: AppConfig.height20),
                      const NormalText(text: "OR"),
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have account? ",
                      style: TextStyle(
                        fontSize: AppConfig.textSize12,
                        color: pPrimaryTextColor,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        navigateRemoveRoute(context, const SignInPage());
                      },
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                          color: pLightPink,
                          fontWeight: FontWeight.bold,
                        ),
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
