import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:podcast_app/_components/colors.dart';

void pPrintLog(String scrnName, dynamic data) {
  log('$data', name: scrnName);
}

Container enterArrow() {
  return Container(
    height: 20,
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
