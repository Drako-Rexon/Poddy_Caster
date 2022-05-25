import 'package:flutter/material.dart';

class InputInfoTextField extends StatelessWidget {
  const InputInfoTextField({
    Key? key,
    required this.text,
    required this.icon, this.inType = TextInputType.text,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final TextInputType inType;

  @override
  Widget build(BuildContext context) {
    double devWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFF1D192C), borderRadius: BorderRadius.circular(6)),
      width: devWidth - 50,
      child: TextField(
        keyboardType: inType,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Color(0xFF7477A0),
            size: 18,
          ),
          hintText: text,
          hintStyle: TextStyle(
            fontFamily: 'CircularStd-Book',
            color: Color(0xFF7477A0),
            fontSize: 12,
          ),
        ),
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
