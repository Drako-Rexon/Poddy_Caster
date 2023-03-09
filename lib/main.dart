import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast_app/intro/intro.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Poddy Caster',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Intro(), // RedirectingPage(),
    );
  }
}
