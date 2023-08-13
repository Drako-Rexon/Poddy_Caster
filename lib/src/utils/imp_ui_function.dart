import 'package:flutter/material.dart';
import 'package:poddy_caster/src/utils/data_for_dynamic.dart';
import 'package:poddy_caster/src/utils/colors.dart';

Container enterArrow() {
  return Container(
    height: AppConfig.height20,
    width: 20,
    decoration: const BoxDecoration(
      color: pBackground,
      shape: BoxShape.circle,
    ),
    child: const Center(
      child: Icon(
        Icons.arrow_forward_ios_sharp,
        color: pWhite,
        size: 14,
      ),
    ),
  );
}
