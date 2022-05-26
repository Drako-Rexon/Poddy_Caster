import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast_app/Terms_of_service/terms_of_service.dart';
import 'package:podcast_app/authorization/components/input_info_text_field.dart';
import 'package:podcast_app/authorization/components/sign_in_button.dart';
import 'package:podcast_app/components/normal_text.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

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
    double devWidth = MediaQuery.of(context).size.width;
    double devHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: devHeight,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              radius: 5,
              colors: [Color(0xFF2D2C3C), Color(0xFF191925)],
            ),
          ),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: 35),
                Container(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child:
                      Image.asset('assets/images/logo.png', fit: BoxFit.cover),
                ),
                SizedBox(height: 30),
                NormalText(
                  text: "Welcome Back!",
                  isBold: true,
                  textColor: Colors.white,
                  textSize: 24,
                ),
                NormalText(text: "Login to continue Radio App"),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF1D192C),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  width: devWidth - 50,
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
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF1D192C),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  width: devWidth - 50,
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
                // InputInfoTextField(
                //   text: "Password",
                //   icon: Icons.lock_outline,
                //   obsText: true,
                // ),
                Container(
                  padding: const EdgeInsets.only(left: 12, right: 27),
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
                        onPressed: () {},
                        child: NormalText(
                          text: "Forget password?",
                          isBold: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: devWidth - 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFFB6580), Color(0xFFF11775)],
                    ),
                  ),
                  child: TextButton(
                    style: ButtonStyle(),
                    onPressed: () {},
                    child: NormalText(
                      text: "Log In",
                      textColor: Colors.white,
                      textSize: 18,
                      isBold: true,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                NormalText(text: "OR"),
                SizedBox(height: 20),
                SignInButtoncustom(
                  text: "Continue with Google",
                  iconLocation: "assets/images/google-png.png",
                ),
                SizedBox(height: 20),
                SignInButtoncustom(
                  text: "Continue with Facebook",
                  iconLocation: "assets/images/fb.jpg",
                  backColor: Color(0xFF3d599f),
                  textColor: Colors.white,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NormalText(text: "Don't have account?"),
                    TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                      ),
                      onPressed: () {},
                      child: NormalText(
                        text: "Sign Up",
                        textColor: Color(0xFFFB6580),
                        isBold: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                // Text(
                //   "By signing up you indicate that you have read and",
                //   style: TextStyle(
                //     fontSize: 8,
                //     fontFamily: 'CircularStd-Book',
                //     color: Color(0xFF7477A0),
                //   ),
                // ),
                NormalText(
                  text: "By signing up you indicate that you have read and",
                  textSize: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NormalText(
                      text: "agreed to the Patch",
                      textSize: 8,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(TermsOfService());
                      },
                      child: NormalText(
                        text: "Terms of Service",
                        textSize: 8,
                        textColor: Color(0xFFFB6580),
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
