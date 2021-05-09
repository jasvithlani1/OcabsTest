import 'package:flutter/material.dart';

class ButtonRaised extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Function onLongPressed;

  const ButtonRaised({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.onLongPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // shahbaj
    return ElevatedButton(
      onPressed: onPressed,
      onLongPress: onLongPressed,
      style: ElevatedButton.styleFrom(
        elevation: 10,
        padding: const EdgeInsets.all(0.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        textStyle: TextStyle(color: Colors.white),
      ),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
              Color(0xFFF38B10),
              Color(0xFFFDB23D),
            ], begin: Alignment.bottomLeft, end: Alignment.topRight),
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 20),
        child: Text(text, style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
