import 'package:flutter/material.dart';
import 'package:podcast_app/authorization/components/input_info_text_field.dart';

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
      backgroundColor: Color(0xFF2D2C3C),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 35),
            Container(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Image.asset('assets/images/logo.png', fit: BoxFit.cover),
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
                  Text(
                    "Forget password?",
                    style: TextStyle(
                      color: Color(0xFF7B7B8B),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFFB6580), Color(0xFFF11775)],
                ),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(0, 255, 255, 255),
                  // onSurface: Colors.transparent,
                  // shadowColor: Colors.transparent,
                ),
                onPressed: () {},
                child: Text(
                  "Log In",
                  style: TextStyle(fontFamily: 'CircularStd'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
