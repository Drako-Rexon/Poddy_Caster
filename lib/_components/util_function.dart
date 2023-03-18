import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:poddy_caster/_components/colors.dart';
import 'package:poddy_caster/_components/data_for_dynamic.dart';

void pPrintLog(String scrnName, dynamic data) {
  log('$data', name: scrnName);
}

Container enterArrow() {
  return Container(
    height: AppConfig.height20,
    width: 20,
    decoration: BoxDecoration(
      color: pBackground,
      shape: BoxShape.circle,
    ),
    child: Center(
      child: Icon(
        Icons.arrow_forward_ios_sharp,
        color: pWhite,
        size: 14,
      ),
    ),
  );
}
