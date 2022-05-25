import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [/*LOGO*/],
            ),
            Row(
              children: [
                Text("Welcome Back!"),
                Text("Login to continue Radio App"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
