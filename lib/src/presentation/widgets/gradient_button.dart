// import 'package:flutter/material.dart';
// import 'package:poddy_caster/src/utils/colors.dart';
// import 'package:poddy_caster/src/utils/data_for_dynamic.dart';
// import 'package:poddy_caster/src/utils/util_widgets.dart';

// class GradientButton extends StatefulWidget {
//   const GradientButton(
//     this.text, {
//     Key? key,
//     this.isLoading = false,
//     this.isDisable = true,
//     this.wid = 0.0,
//     this.hei = 0.0,
//     this.textSize = 18.0,
//     this.page,
//     this.function,
//   }) : super(key: key);

//   final String text;
//   final bool isLoading;
//   final bool isDisable;
//   final double wid;
//   final double hei;
//   final double textSize;
//   final Widget? page;
//   final Function? function;

//   @override
//   State<GradientButton> createState() => _GradientButtonState();
// }

// class _GradientButtonState extends State<GradientButton> {
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () => widget.function,
//       style: ButtonStyle(
//         overlayColor: MaterialStateProperty.all(trans),
//         minimumSize: MaterialStateProperty.all(
//           Size(AppConfig.screenWidth - AppConfig.width50,
//               AppConfig.height40 + AppConfig.height5),
//         ),
//       ),
//       child: widget.isLoading
//           ? const SizedBox(
//               width: 40,
//               height: 40,
//               child: CircularProgressIndicator(color: pWhite))
//           : Center(
//               child: NormalText(
//                 text: widget.text,
//                 textColor: pWhite,
//                 textSize: widget.textSize == 18.0 ? 18 : widget.textSize,
//                 isBold: true,
//               ),
//             ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:poddy_caster/src/utils/colors.dart';
import 'package:poddy_caster/src/utils/util_widgets.dart';

class GradientButton extends StatelessWidget {
  const GradientButton(
    this.text,
    this.func, {
    Key? key,
    this.isLoading = false,
    this.isDisable = true,
    this.wid = 0.0,
    this.hei = 0.0,
    this.textSize,
  }) : super(key: key);

  final String text;
  final bool isLoading;
  final Function func;
  final bool isDisable;
  final double wid;
  final double hei;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDisable ? disableGradient : gradientButton1,
        ),
      ),
      child: TextButton(
        onPressed: () {
          isDisable
              ? () {
                  return;
                }
              : func();
        },
        child: isLoading
            ? const Center(
                child:
                    SizedBox(child: CircularProgressIndicator(color: pWhite)))
            : Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: NormalText(
                    text: text,
                    textColor: pWhite,
                    textSize: textSize ?? 18,
                    isBold: true,
                  ),
                ),
              ),
      ),
    );
  }
}
