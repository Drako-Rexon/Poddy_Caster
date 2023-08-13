import 'package:flutter/material.dart';
import 'package:poddy_caster/_components/colors.dart';
import 'package:poddy_caster/src/presentation/ui/auth/sign_in.dart';
import 'package:poddy_caster/src/utils/important_functions.dart';
import 'package:poddy_caster/src/utils/data_for_dynamic.dart';
import 'package:poddy_caster/src/utils/util_widgets.dart';

class ForgetPassPage extends StatefulWidget {
  const ForgetPassPage({Key? key}) : super(key: key);

  @override
  State<ForgetPassPage> createState() => _ForgetPassPageState();
}

class _ForgetPassPageState extends State<ForgetPassPage> {
  late TextEditingController _forgetEmail;

  @override
  void initState() {
    super.initState();
    _forgetEmail = TextEditingController();
    _forgetEmail.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    _forgetEmail.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: pBackgroundAppColor,
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: AppConfig.screenWidth,
          height: AppConfig.screenHeight,
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              radius: 5,
              colors: [pBackgroundAppColor, backGradientColor2],
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
                  const NormalText(
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
                      controller: _forgetEmail,
                      cursorColor: pPrimaryTextColor,
                      style: const TextStyle(color: pLightPrimary),
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
                                icon: const Icon(Icons.close,
                                    color: pLightPrimary),
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
                    isDisable: _forgetEmail.text ==
                            RegExp(r'^([a-z0-9]+)\@([a-z]+)\.([a-z]+)$')
                        ? true
                        : false,
                  ),
                ],
              ),
              SizedBox(height: AppConfig.height80),
              Column(
                children: [
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
                          navigateRoute(context, const SignInPage());
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
                  SizedBox(height: AppConfig.height15),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
