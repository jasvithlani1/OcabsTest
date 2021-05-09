import 'package:ocabstest/Widgets/helper.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ocabstest/Widgets/app_bars/app_bar.dart';
import 'package:ocabstest/Widgets/buttons/raised_button.dart';
import 'package:ocabstest/Screens/Auth/Login.dart';

class PermissionScreen extends StatefulWidget {
  @override
  _PermissionScreenState createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  int _locationPermissionCheck;
  // int _notificationPermissionCheck;
  Future<int> _locationPermissionChecker;
  // Future<int> _notificationPermissionChecker;

  Future<int> checkLoactionPermission() async {
    var resultLocation = await Permission.location.status;
    print("Checking loaction Permission : " + resultLocation.toString());
    setState(() {
      _locationPermissionCheck = 1;
    });
    if (resultLocation.isDenied) {
      return 0;
    } else if (resultLocation.isGranted) {
      return 1;
    } else {
      return 0;
    }
  }

  // Future<int> checkNotificationPermission() async {
  //   var resultNotification = await Permission.notification.status;

  //   print(
  //       "Checking Notification Permission : " + resultNotification.toString());
  //   setState(() {
  //     _notificationPermissionCheck = 1;
  //   });
  //   if (resultNotification.isDenied) {
  //     return 0;
  //   } else if (resultNotification.isGranted) {
  //     return 1;
  //   } else {
  //     return 0;
  //   }
  // }

  Map<Permission, PermissionStatus> resultLocation;
  Future<int> requestLocationPermission() async {
    resultLocation = await [
      Permission.location,
      Permission.notification,
    ].request();

    if (resultLocation[Permission.location].isDenied) {
      if (resultLocation[Permission.notification].isDenied) {
        return 0;
      }
      return 0;
    } else if (resultLocation[Permission.location].isGranted) {
      if (resultLocation[Permission.notification].isGranted) {
        return 1;
      }
      return 1;
    } else {
      return 0;
    }
  }

  // Map<Permission, PermissionStatus> resultNotification;
  // Future<int> requestNotificationPermission() async {
  //   resultNotification = await [Permission.notification].request();

  //   if (resultNotification[Permission.notification].isDenied) {
  //     return 0;
  //   } else if (resultNotification[Permission.notification].isGranted) {
  //     return 1;
  //   } else {
  //     return 0;
  //   }
  // }

  @override
  void initState() {
    super.initState();
    _locationPermissionChecker = (() async {
      int locationPermissionCheckInt;
      int finalLocationPermission;
      // checking for permisson is granted or not.
      if (_locationPermissionCheck == null || _locationPermissionCheck == 0) {
        _locationPermissionCheck = await checkLoactionPermission();
        print(
            "Initial Values of locationpermission is $_locationPermissionCheck");
      } else {
        _locationPermissionCheck = 1;
      }
      // if
      if (_locationPermissionCheck == 1) {
        locationPermissionCheckInt = 1;
      } else if (_locationPermissionCheck == 0) {
        setState(() {
          _locationPermissionChecker = requestLocationPermission();
        });
      } else {
        locationPermissionCheckInt = 0;
      }

      if (locationPermissionCheckInt == 1) {
        finalLocationPermission = 1;
      } else {
        finalLocationPermission = 0;
      }
      return finalLocationPermission;
    })();
    // notification permission
    // _notificationPermissionChecker = (() async {
    //   int notificationPermissionCheckInt;
    //   int finalNotifactionPermission;
    //   // checking for permisson is granted or not.
    //   if (_notificationPermissionCheck == null ||
    //       _notificationPermissionCheck == 0) {
    //     _notificationPermissionCheck = await checkNotificationPermission();
    //     print(
    //         "Initial Values of notification permission is $_locationPermissionCheck");
    //   } else {
    //     _notificationPermissionCheck = 1;
    //   }
    //   // if
    //   if (_notificationPermissionCheck == 1) {
    //     notificationPermissionCheckInt = 1;
    //   } else if (_notificationPermissionCheck == 0) {
    //     setState(() {
    //       _notificationPermissionChecker = requestLocationPermission();
    //     });
    //   } else {
    //     notificationPermissionCheckInt = 0;
    //   }

    //   if (notificationPermissionCheckInt == 1) {
    //     finalNotifactionPermission = 1;
    //   } else {
    //     finalNotifactionPermission = 0;
    //   }
    //   return finalNotifactionPermission;
    // })();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: _locationPermissionChecker,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            if (snapshot.data == 1) {
              return LoginScreen();
            } else {
              return ask(context, screenWidth, screenHeight);
            }
            // 2nd if
          }
          // 1st if
        }
        return ask(context, screenWidth, screenHeight);
      },
    );
  }

  Scaffold ask(BuildContext context, double screenWidth, double screenHeight) {
    return Scaffold(
      appBar: SimpleAppbar(context, isNavBack: false),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(child: Image.asset("assets/images/permission.png")),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Container(
              width: screenWidth,
              // color: Colors.green,
              // height: 200,
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Location Access",
                      style: subHeading(),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                        "Allow your location access to O cabs to find your exact locations."),
                  )
                ],
              ),
            ),
            Spacer(),
            ButtonRaised(
              text: "Allow",
              onPressed: () {
                setState(() {
                  _locationPermissionChecker = requestLocationPermission();
                  // _notificationPermissionChecker = _locationPermissionChecker;
                });
                if (resultLocation[Permission.location].isPermanentlyDenied) {
                  openAppSettings();
                  Navigator.of(context).pop();
                }
              },
            ),
            Text(
              "CANCEL",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            SizedBox(height: screenHeight * 0.05),
          ],
        ),
      ),
    );
  }
}
