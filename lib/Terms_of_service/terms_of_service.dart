import 'package:flutter/material.dart';

class TermsOfService extends StatelessWidget {
  const TermsOfService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          decoration: BoxDecoration(color: Colors.red),
          child: Text(
            "Center",
            style: TextStyle(color: Colors.yellow),
          ),
        ),
      ),
    );
  }
}
