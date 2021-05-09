import 'package:flutter/material.dart';

AppBar SimpleAppbar(context, {bool isNavBack = true}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leadingWidth: 100,
    leading: isNavBack
        ? GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: Colors.orange,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Back",
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            ),
          )
        : Container(),
  );
}
