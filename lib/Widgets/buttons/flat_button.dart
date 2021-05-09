import 'package:flutter/material.dart';
import 'package:ocabstest/Utils/colors.dart';

class ButtonDefault extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;
  final bool fullWidth;

  ButtonDefault({
    @required this.text,
    @required this.onPressed,
    this.color = primaryColor,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      padding: fullWidth
          ? EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0)
          : EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      width: fullWidth ? double.infinity : screenSize.width * 0.45,
      child: FlatButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          child: Text(
            text,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: color,
        textColor: color == primaryColor ? whiteColor : primaryColor,
      ),
    );
  }
}
