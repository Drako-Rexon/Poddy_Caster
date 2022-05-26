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
  void initState() {
    // TODO: implement initState
    super.initState();

    textController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    double devWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF1D192C),
        borderRadius: BorderRadius.circular(6),
      ),
      width: devWidth - 50,
      child: TextField(
        style: TextStyle(color: Color(0xFF7477A0)),
        obscureText: visiblePass,
        keyboardType: widget.inType,
        decoration: InputDecoration(
          fillColor: Colors.white,
          border: InputBorder.none,
          prefixIcon: Icon(
            widget.icon,
            color: Color(0xFF7477A0),
            size: 18,
          ),
          // suffixIcon: textController.text.isEmpty
          //     ? Container(width: 0)
          //     : IconButton(
          //         icon: Icon(
          //           Icons.close,
          //           color: Colors.white /*Color(0xFF7477A0)*/,
          //         ),
          //         onPressed: () {
          //           textController.clear();
          //           print(textController.text.isEmpty);
          //         }),
          suffixIcon: IconButton(
            icon: visiblePass
                ? Icon(Icons.visibility)
                : Icon(Icons.visibility_off),
            onPressed: () {
              setState(() {
                visiblePass = !visiblePass;
              });
            },
          ),
          // suffixIcon: IconButton(
          //   icon: textController.text.isNotEmpty
          //       ? Container(width: 0)
          //       : Icon(Icons.close),
          //   onPressed: () {
          //     setState(() {
          //       visiblePass = !visiblePass;
          //     });
          //   },
          // ),
          hintText: widget.text,
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
