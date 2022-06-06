import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast_app/authorization/sign_in/sign_in.dart';
import 'package:podcast_app/redirecting_page/redirecting_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Poddy Caster',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RedirectingPage(),
    );
  }
}
