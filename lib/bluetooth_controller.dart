import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';

class BluetoothController extends GetxController {
  //FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

  Future scanDevices() async {
    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 1));
    FlutterBluePlus.stopScan();
  }

  Stream<List<ScanResult>> get scanResult => FlutterBluePlus.scanResults;

}
