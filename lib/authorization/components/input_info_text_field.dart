import 'package:flutter/material.dart';

class InputInfoTextField extends StatefulWidget {
  const InputInfoTextField({
    Key? key,
    required this.text,
    required this.icon,
    this.inType = TextInputType.text,
    this.obsText = false,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final TextInputType inType;
  final bool obsText;

  @override
  State<InputInfoTextField> createState() => _InputInfoTextFieldState();
}

class _InputInfoTextFieldState extends State<InputInfoTextField> {
  final textController = TextEditingController();
  bool visiblePass = true;

  

  @override
  Widget build(BuildContext context) {
    double devWidth = MediaQuery.of(context).size.width;
    return Container();
  }
}
