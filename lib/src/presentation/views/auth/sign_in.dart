import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poddy_caster/src/presentation/views/auth/bloc/auth_bloc.dart';
import 'package:poddy_caster/src/presentation/views/home/ui/redirecting_page.dart';
import 'package:poddy_caster/src/presentation/widgets/gradient_button.dart';
import 'package:poddy_caster/src/utils/colors.dart';
import 'package:poddy_caster/src/presentation/views/terms_and_services/terms_of_service.dart';
import 'package:poddy_caster/src/utils/image_string.dart';
import 'package:poddy_caster/src/utils/data_for_dynamic.dart';
import 'package:poddy_caster/src/presentation/views/auth/forget_password.dart';
import 'package:poddy_caster/src/presentation/views/auth/sign_up_page.dart';
import 'package:poddy_caster/src/utils/important_functions.dart';
import 'package:poddy_caster/src/utils/util_widgets.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool value = false;
  bool isVisible = false;
  late TextEditingController _emailController;
  late TextEditingController _passController;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passController = TextEditingController();
    _emailController.addListener(() => setState(() {}));
    _passController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
  }

  final AuthBloc authBloc = AuthBloc();
  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: authBloc,
      listener: (context, state) {
        if (state is SignInNavigateToSignUpPageState) {
          navigateRemoveRoute(context, const SignUpPage());
        } else if (state is SignInNavigateToAppPageState) {
          navigateRemoveRoute(context, const RedirectingPage());
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Visibility(
            child: SafeArea(
              child: Container(
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(height: AppConfig.height30),
                          isKeyboard
                              ? Container()
                              : Container(
                                  padding: EdgeInsets.only(
                                      left: AppConfig.width50,
                                      right: AppConfig.width50),
                                  child: Image.asset(
                                    logo,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                          SizedBox(height: AppConfig.height30),
                          Text(
                            "Welcome Back!",
                            style: TextStyle(
                              color: pWhite,
                              fontSize: AppConfig.textSize24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const NormalText(text: "Login to continue Radio App"),
                          SizedBox(height: AppConfig.height20),
                          Container(
                            decoration: BoxDecoration(
                              color: pDeepPrimary,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            width: AppConfig.screenWidth - AppConfig.width50,
                            child: TextField(
                              controller: _emailController,
                              style: const TextStyle(color: pLightPrimary),
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: pPrimaryTextColor,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.mail_outline,
                                  color: pPrimaryTextColor,
                                  size: AppConfig.textSize18,
                                ),
                                hintText:
                                    "Type 'abhishek@gmail.com' to sign in",
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
                              controller: _passController,
                              obscureText: !isVisible,
                              style: const TextStyle(color: pLightPrimary),
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: pPrimaryTextColor,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: const Icon(
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
                                hintText: "Type '123456' to sign in",
                                hintStyle: const TextStyle(
                                  fontFamily: 'CircularStd-Book',
                                  color: pPrimaryTextColor,
                                  fontSize: 12,
                                ),
                              ),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    overlayColor:
                                        MaterialStateProperty.all(trans),
                                    value: value,
                                    activeColor: pLightPink,
                                    checkColor: pWhite,
                                    shape: const CircleBorder(),
                                    onChanged: (value) {
                                      setState(() {
                                        this.value = value!;
                                        log(value.toString());
                                      });
                                    },
                                  ),
                                  const NormalText(text: "Remember me"),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  navigateRoute(
                                      context, const ForgetPassPage());
                                },
                                child: const NormalText(
                                  text: "Forget Password?",
                                  isBold: true,
                                ),
                              ),
                            ],
                          ),
                          GradientButton(
                            "Log In",
                            () {
                              authBloc.add(SignInNavigateIntoAppEvent());
                            },
                            textSize: 20,
                            // page: const RedirectingPage(),
                            isDisable:
                                RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(_emailController.text) &&
                                        _passController.text.isNotEmpty
                                    ? false
                                    : true,
                            isLoading: loading,
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
                          SizedBox(height: AppConfig.height10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              NormalText(
                                text: "Don't have account? ",
                                textSize: AppConfig.textSize12,
                              ),
                              InkWell(
                                onTap: () {
                                  authBloc
                                      .add(SignInNavigateToSignUpPageEvent());
                                },
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: pLightPink,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        const NormalText(
                          text:
                              "By signing up you indicate that you have read and",
                          textSize: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const NormalText(
                              text: "agreed to the Patch",
                              textSize: 10,
                            ),
                            InkWell(
                              onTap: () {
                                navigateRoute(context, const TermsOfService());
                              },
                              child: const NormalText(
                                text: " Terms of Service",
                                textSize: 10,
                                textColor: pLightPink,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppConfig.height10),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
