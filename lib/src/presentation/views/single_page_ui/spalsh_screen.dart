import 'package:flutter/material.dart';
import 'package:poddy_caster/src/helper/helper_function.dart';
import 'package:poddy_caster/src/presentation/views/auth/sign_in.dart';
import 'package:poddy_caster/src/presentation/views/home/ui/redirecting_page.dart';
import 'package:poddy_caster/src/presentation/views/introduction/ui/intro.dart';
import 'package:poddy_caster/src/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _introDone = false;
  bool _signedIn = false;
  @override
  void initState() {
    super.initState();
    introDone();
    navigate();
  }

  introDone() async {
    await HelperFunction.getIntroDoneStatus().then((value) {
      if (value != null) {
        setState(() {
          _introDone = value;
        });
      }
    });
  }

  signedIn() async {
    await HelperFunction.getLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _signedIn = value;
        });
      }
    });
  }

  void navigate() {
    Future.delayed(const Duration(milliseconds: 2000), () async {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (_) => _introDone
                ? _signedIn
                    ? const RedirectingPage()
                    : const SignInPage()
                : const Intro()),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pBackgroundAppColor,
      body: Center(
        child: Image.asset('assets/images/radio.png'),
      ),
    );
  }
}
