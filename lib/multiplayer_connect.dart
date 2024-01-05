// import 'package:flutter/material.dart';
// import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
// import 'dart:async';
//
// class MultiplayerConnect extends StatefulWidget {
//   @override
//   _MultiplayerConnectState createState() => _MultiplayerConnectState();
// }
//
// class _MultiplayerConnectState extends State<MultiplayerConnect> {
//   ReactiveBle? _reactiveBle;
//   BluetoothDevice? _selectedDevice;
//   List<ScanResult> _scanResults = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _getReactiveBle();
//   }
//
//   Future<void> _getReactiveBle() async {
//     _reactiveBle = await FlutterReactiveBle.instance;
//   }
//
//   Future<void> _scanForDevices() async {
//     _reactiveBle?.scanForDevices().listen((scanResult) {
//       setState(() {
//         _scanResults.add(scanResult);
//       });
//     });
//   }
//
//   Future<void> _connectToDevice(ScanResult device) async {
//     final connection = await _reactiveBle?.connect(device.device);
//     _connection = connection;
//     _sendMessage("Connected");
//   }
//
//   void _sendMessage(String message) {
//     _connection?.writeCharacteristic(
//       message.codeUnits,
//       serviceUUID: "YOUR_SERVICE_UUID",
//       characteristicUUID: "YOUR_CHARACTERISTIC_UUID",
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Bluetooth Example")),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: _scanResults.length,
//               itemBuilder: (context, index) {
//                 final device = _scanResults[index];
//                 return ListTile(
//                   title: Text(device.device.name),
//                   subtitle: Text(device.device.id),
//                   onTap: () {
//                     _connectToDevice(device);
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: MultiplayerConnect(),
//   ));
// }