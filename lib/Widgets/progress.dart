import 'package:flutter/material.dart';

Container circularProgress() {
  return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      // padding: EdgeInsets.only(top: 10.0),
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.orange),
      ));
}

Container linearProgress() {
  return Container(
    padding: EdgeInsets.only(bottom: 10.0),
    child: LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.orange),
    ),
  );
}