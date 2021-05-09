import 'package:flutter/material.dart';
import 'package:ocabstest/Widgets/buttons/raised_Button.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = "/onboarding";

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "image": "assets/images/Onboard1.png",
      "title": "Request a trip",
      "disc":
          "Need to go somewhere? A friendly cabbie is just a few taps away.",
    },
    {
      "image": "assets/images/Onboard2.png",
      "title": "Choose destination",
      "disc": "We operate all over NZ. You pick the place and we ride.",
    },
    {
      "image": "assets/images/Onboard3.png",
      "title": "Enjoy your journey",
      "disc":
          "You just have to sit there. Our cabbies are certified & are trained to create an enjoyable experiance.",
    },
  ];
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: splashData.length,
              itemBuilder: (context, index) => SplashContent(
                image: splashData[index]["image"],
                disc: splashData[index]["disc"],
                title: splashData[index]["title"],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    splashData.length,
                    (index) => bulidDot(index: index),
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                ButtonRaised(
                    text: "Get started",
                    onPressed: () {
                      print("get started");
                      Navigator.pushReplacementNamed(context, null);
                    }),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer bulidDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 0),
      margin: EdgeInsets.only(right: 10, left: 10),
      height: currentPage == index ? 20 : 6,
      width: currentPage == index ? 40 : 6,
      decoration: currentPage == index
          ? BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/dotcar.png"), fit: BoxFit.cover),
            )
          : BoxDecoration(
              color: Colors.orange[100],
              borderRadius: BorderRadius.circular(3),
            ),
    );
  }
}

class SplashContent extends StatelessWidget {
  final String image;
  final String title;
  final String disc;

  const SplashContent({
    Key key,
    this.image,
    this.title,
    this.disc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Spacer(),
        Image.asset(
          "assets/Logo.png",
          width: screenWidth * 0.4,
          fit: BoxFit.contain,
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenHeight * 0.05,
            vertical: screenWidth * 0.05,
          ),
          child: Image.asset(
            image,
            width: screenWidth,
          ),
        ),
        Spacer(),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            disc,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
