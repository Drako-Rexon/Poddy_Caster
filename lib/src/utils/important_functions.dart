import 'dart:developer';

import 'package:flutter/material.dart';

navigateRoute(BuildContext context, Widget page) {
  return Navigator.push(context, MaterialPageRoute(builder: (_) => page));
}

navigateRemoveRoute(BuildContext ctx, Widget page) {
  return Navigator.pushAndRemoveUntil(
    ctx,
    MaterialPageRoute(builder: (_) => page),
    (_) => false,
  );
}

popScreen(BuildContext context) {
  return Navigator.pop(context);
}

void pPrintLog(String scrnName, dynamic data) {
  log('$data', name: scrnName);
}
