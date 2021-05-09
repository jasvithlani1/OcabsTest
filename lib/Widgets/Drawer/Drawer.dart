import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        _createHeader(),
        _createDrawerItem(icon: Icons.power, text: "Performance"),
        _createDrawerItem(icon: Icons.file_copy, text: "Document"),
        _createDrawerItem(icon: Icons.settings, text: "Settings"),
        _createDrawerItem(icon: Icons.help, text: "Help"),
        Spacer(),
        _createDrawerItem(icon: Icons.logout, text: "Logout"),
      ]),
    );
  }
}

Widget _createHeader() {
  return DrawerHeader(
    margin: EdgeInsets.zero,
    padding: EdgeInsets.zero,
    decoration: BoxDecoration(
      color: Colors.white54,
    ),
    child: Stack(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 15, 0, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/profilepic.png"),
              ),
              Text(
                "John Smith Doe",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        Text(
          "Edit Profile",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}

Widget _createDrawerItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: [
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}
