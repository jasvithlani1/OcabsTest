import 'package:flutter/material.dart';
import 'package:ocabstest/Utils/colors.dart';

class ButtonIcon extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;
  final bool fullWidth;
  final Widget iconWidget;

  ButtonIcon({
    @required this.text,
    @required this.onPressed,
    @required this.iconWidget,
    this.color = primaryColor,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
      width: fullWidth ? double.infinity : screenSize.width * 0.5,
      child: FlatButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: <Widget>[
              ConstrainedBox(
                constraints:
                    BoxConstraints(maxHeight: screenSize.height * 0.03),
                child: iconWidget,
              ),
              SizedBox(
                width: 32,
              ),
              Flexible(
                child: Text(
                  text,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: color,
        textColor: whiteColor,
      ),
    );
  }
}
