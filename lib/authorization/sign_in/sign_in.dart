import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double devWidth = MediaQuery.of(context).size.width;
    double devHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF2D2C3C),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  left: 50, right: 50, top: 50, bottom: 35),
              child: Image.asset('assets/images/logo.png', fit: BoxFit.cover),
            ),
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
            Container(
              width: devWidth - 40,
              decoration: BoxDecoration(color: Color(0xFF1D192C)),
              child: Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Icon(
                      Icons.email_outlined,
                      color: Color(0xFF7477A0),
                    ),
                  ),
                  Container(
                    width: devWidth - 100,
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Email Address",
                        hintStyle: TextStyle(
                          color: Color(0xFF7477A0),
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
