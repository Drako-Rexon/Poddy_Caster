import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:podcast_app/components/data_for_dynamic.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Container(
          width: SizeForDynamic.screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 50),
              // Container(
              //   width: SizeForDynamic.screenWidth - 40,
              //   height: 40,
              //   decoration: BoxDecoration(color: Colors.purpleAccent),
              // ),
              TextButton(
                onPressed: signOut,
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
    FirebaseAuth.instance.signOut();
  }
}
