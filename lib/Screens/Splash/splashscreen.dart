import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ocabstest/Screens/onbaording/onboarding.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2b262c),
      body: Center(
        child: Image.asset(
          "assets/Logo.png",
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
