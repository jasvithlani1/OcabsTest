import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final clickOnLogin;
  String hintText;
  CustomButton(this.clickOnLogin, this.hintText);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        clickOnLogin(context);
      },
      child: RaisedButton(
        onPressed: () => null,
        elevation: 10,
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
                Color(0xFFF38B10),
                Color(0xFFFDB23D),
              ], begin: Alignment.bottomLeft, end: Alignment.topRight),
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 20),
          child: Text(hintText, style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
