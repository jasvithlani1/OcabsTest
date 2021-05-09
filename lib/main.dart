import 'package:flutter/material.dart';
import 'package:ocabstest/Screens/Splash/splashscreen.dart';
import 'package:ocabstest/Screens/onbaording/onboarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ocabs test screens',
      home: Splash(),
    );
  }
}
