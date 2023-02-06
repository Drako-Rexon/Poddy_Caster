import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:podcast_app/_components/data_for_dynamic.dart';
import 'package:podcast_app/authorization/sign_in.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Container(
          width: AppConfig.screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 50),
              TextButton(
                onPressed: () {
                  Get.offAll(() => SignInPage());
                },
                child: Text("Sign out"),
                // color: ColorsForApp.backGradientColor1,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future signOut() async {
    // FirebaseAuth.instance.signOut();
  }
}
