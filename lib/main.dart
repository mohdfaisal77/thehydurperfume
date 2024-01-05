import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hydur/ui/welcome/welcome.dart';
import 'package:hydur/utils/app_color.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hydur App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
        fontFamily: GoogleFonts.montserrat().fontFamily,
        brightness: Brightness.light,
        primaryColor: AppColor.primaryColor,
        primaryColorDark: AppColor.primaryColor,
        primaryColorLight: AppColor.primaryColor,
      ),
      home: const WelcomeScreen(), // Set HomeScreen as the initial route
    );
  }
}
// Copyright 2023, Charles Weinberger & Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
//
// import 'dart:async';
// import 'dart:io';
// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_blue_plus/flutter_blue_plus.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// import 'widgets.dart';
//
// final snackBarKeyA = GlobalKey<ScaffoldMessengerState>();
// final snackBarKeyB = GlobalKey<ScaffoldMessengerState>();
// final snackBarKeyC = GlobalKey<ScaffoldMessengerState>();
// final Map<DeviceIdentifier, ValueNotifier<bool>> isConnectingOrDisconnecting = {};
//
// void main() {
//   if (Platform.isAndroid) {
//     WidgetsFlutterBinding.ensureInitialized();
//     [
//       Permission.location,
//       Permission.storage,
//       Permission.bluetooth,
//       Permission.bluetoothConnect,
//       Permission.bluetoothScan
//     ].request().then((status) {
//       runApp(const FlutterBlueApp2());
//     });
//   } else {
//     runApp(const FlutterBlueApp2());
//   }
// }
//
// class BluetoothAdapterStateObserver extends NavigatorObserver {
//   StreamSubscription<BluetoothAdapterState>? _btStateSubscription;
//
//   @override
//   void didPush(Route route, Route? previousRoute) {
//     super.didPush(route, previousRoute);
//     if (route.settings.name == '/deviceScreen') {
//       // Start listening to Bluetooth state changes when a new route is pushed
//       _btStateSubscription ??= FlutterBluePlus.adapterState.listen((state) {
//         if (state != BluetoothAdapterState.on) {
//           // Pop the current route if Bluetooth is off
//           navigator?.pop();
//         }
//       });
//     }
//   }
//
//   @override
//   void didPop(Route route, Route? previousRoute) {
//     super.didPop(route, previousRoute);
//     // Cancel the subscription when the route is popped
//     _btStateSubscription?.cancel();
//     _btStateSubscription = null;
//   }
// }