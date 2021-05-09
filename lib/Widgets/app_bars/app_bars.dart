import 'package:flutter/material.dart';
import 'package:ocabstest/Utils/colors.dart';
import 'package:ocabstest/Utils/utils.dart';

class AppBars {
  static defaultAppBar({
    String title = Constants.appName,
    List<Widget> actions,
    BuildContext context,
  }) {
    return AppBar(
      // backgroundColor: Color(0xFF187800),
      backgroundColor: primaryColor,
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 0,
      actions: actions ?? [],
    );
  }
}
