import 'package:flutter/material.dart';
import 'package:podcast_app/authorization/components/input_info_text_field.dart';
import 'package:podcast_app/authorization/components/sign_in_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    double devWidth = MediaQuery.of(context).size.width;
    double devHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: RadialGradient(colors: []),
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
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'CircularStd',
                    fontSize: 24,
                  ),
                ),
                Text(
                  "Login to continue Radio App",
                  style: TextStyle(
                    color: Color(0xFF7B7B8B),
                  ),
                ),
                SizedBox(height: 20),
                InputInfoTextField(
                  text: "Email Address",
                  icon: Icons.email_outlined,
                  inType: TextInputType.text,
                ),
                SizedBox(height: 20),
                InputInfoTextField(
                  text: "Password",
                  icon: Icons.lock_outline,
                  obsText: true,
                ),
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
                          Text(
                            "Remeber me",
                            style: TextStyle(
                              color: Color(0xFF7B7B8B),
                            ),
                          ),
                        ],
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          "Forget password?",
                          style: TextStyle(
                            color: Color(0xFF7B7B8B),
                          ),
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
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'CircularStd',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "OR",
                  style: TextStyle(
                    color: Color(0xFF7477A0),
                    fontFamily: 'CircularStd-Book',
                  ),
                ),
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
                    Text(
                      "Don't have account?",
                      style: TextStyle(
                        color: Color(0xFF7477A0),
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Color(0xFFFB6580),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      child: Text(
                          "By signing up you indicate that you have read and"),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text("agreed to the Patch"),
                          // TextButton(
                          //   style: ButtonStyle(
                          //     minimumSize: MaterialStateProperty.all(
                          //         Size.zero), // Set this
                          //     padding:
                          //         MaterialStateProperty.all(EdgeInsets.zero),
                          //   ),
                          //   onPressed: () {},
                          
                          //   child: Text("Terms of Service"),
                          // ),
                        ],
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
