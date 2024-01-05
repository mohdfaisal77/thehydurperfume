import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';

import 'bluetooth_controller.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GetBuilder<BluetoothController>(
      init: BluetoothController(),
      builder:(controller) {
        return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                height: 180,
                  width: double.infinity,
                  color: Colors.blue,
                  child:const Center(
                    child: Text("Bluetooth App",style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),),
                  )
                ),
                const SizedBox(height: 20,),
                Center(
                  child: ElevatedButton(
                      onPressed: () async {
                        // check adapter availability
                        if (await FlutterBluePlus.isAvailable == false) {
                          print("Bluetooth not supported by this device");
                          return;
                        }

                        controller.scanDevices();
                      },

                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                      minimumSize: const Size(350,55),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      )
                    )
                    ,
                      child:const Text("Scan",style:TextStyle(
                        fontSize: 18),
                      )),
                ),
                const SizedBox(height:20),
                StreamBuilder<List<ScanResult>>(
                    stream: controller.scanResult,
                    builder:( context,snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final data=snapshot.data![index];
                              return Card(
                                elevation: 2,
                                child: ListTile(
                                  title: Text(data.device.name.toString()),
                                  subtitle: Text(data.device.id.id),
                                  trailing: Text(data.rssi.toString()),
                                ),
                              );
                            });

                      }else{
                        return const Center(child: Text("No devices Found"),);
                      }
                    }
                ),
    ],
            )
        );
      }
      ),
    );
  }
}
