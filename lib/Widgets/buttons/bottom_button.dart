import 'package:flutter/material.dart';
import 'package:ocabstest/Utils/colors.dart';

class ButtonBottom extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;

  ButtonBottom({
    @required this.text,
    @required this.onPressed,
    this.color = primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          color: color,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: color == primaryColor ? whiteColor : primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
