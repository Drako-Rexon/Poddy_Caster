import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poddy_caster/firebase_options.dart';
import 'package:poddy_caster/splash_screen/spalsh_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      theme: ThemeData(
          primarySwatch: Colors.purple, fontFamily: 'CircularStd-Book'),
      home: const SplashScreen(), // const Intro(),
    );
  }
}


/*
Platform  Firebase App Id
web       1:129790523460:web:fea201beae0215aaf7a411
android   1:129790523460:android:34ecce37b3fb3955f7a411
ios       1:129790523460:ios:7a5930e68deddf8df7a411
macos     1:129790523460:ios:7a5930e68deddf8df7a411
*/

// 1//0gGBD9p0LRJWzCgYIARAAGBASNwF-L9IrJN6rYBaHjDNA7676P5TqHXDJP8apGS552zWN_wXw7eH_qGDI326FdhFAeuRxcROdLe0