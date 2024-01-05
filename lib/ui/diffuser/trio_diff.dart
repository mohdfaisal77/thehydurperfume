import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hydur/ui/diffuser/diffuser_controller.dart';
import 'package:hydur/ui/diffuser/select_diffuser.dart';
import '../../utils/app_color.dart';
import '../../utils/app_styles.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';
import '../common_widget/check_box.dart';

class TrioDiff extends StatefulWidget {
  const TrioDiff({Key? key}) : super(key: key);

  @override
  _TrioDiffState createState() => _TrioDiffState();
}

class _TrioDiffState extends State<TrioDiff> {
  bool rememberPin = false; // Initial value for the checkbox

  // List to store the PIN values
  List<String> pinValues = ['', '', '', ''];

  // List of FocusNodes to manage focus for each TextField
  List<FocusNode>? pinFocusNodes;

  // List of TextEditingController to manage the content of each TextField
  List<TextEditingController>? pinControllers;

  @override
  void initState() {
    super.initState();

    // Initialize FocusNodes and TextEditingController
    pinFocusNodes = List.generate(4, (index) => FocusNode());
    pinControllers = List.generate(4, (index) => TextEditingController());
  }

  @override
  void dispose() {
    // Dispose FocusNodes and TextEditingController
    for (final node in pinFocusNodes!) {
      node.dispose();
    }
    for (final controller in pinControllers!) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> handlePasswordVerification(List<int> passwordBytes) async {
    await sendCommand([0x8F, ...passwordBytes]);
    List<int>? response = await waitForResponse();

    if (isPasswordCorrect(response)) {
      if (isNewMachine(response)) {
        await handleNewMachineCommunication();
      } else {
        await handleOldMachineCommunication();
      }
    } else {
      showError("Incorrect password");
    }
  }

  Future<List<int>?> waitForResponse() async {
    Completer<List<int>?> completer = Completer();
    // Implement waiting for a response and resolve the completer when response is received
    // Listen for incoming data using your Bluetooth library and resolve the completer
    // Example: bluetoothConnection.onDataReceived.listen((data) => completer.complete(data));
    return completer.future;
  }

  bool isPasswordCorrect(List<int>? response) {
    // Implement logic to parse the response and check if the password is correct
    // Return true if the password is correct, otherwise return false
    return true; // Replace with your implementation
  }

  bool isNewMachine(List<int>? response) {
    // Implement logic to check if the response indicates a new machine
    // Return true if it's a new machine, otherwise return false
    return true; // Replace with your implementation
  }

  Future<void> handleNewMachineCommunication() async {
    // Implement communication steps for a new machine as provided in the protocol
  }

  Future<void> handleOldMachineCommunication() async {
    // Implement communication steps for an old machine as provided in the protocol
  }

  Future<void> sendCommand(List<int> command) async {
    // Implement sending the command to the device over Bluetooth
    // Example: await bluetoothConnection.sendData(command);
  }

  void showError(String message) {
    // Implement displaying an error message to the user
   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Enter')));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Images.trio_diff_background),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 68),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SelectDiffuser()),
                      ); // Define your route or action for the first container
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 15, top: 10),
                      child: SvgPicture.asset(
                        Images.back_arrows,
                        width: 14.2,
                        height: 24.4,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Text(Strings.trio_diff,
                        style: AppStyles.headingTextStyle),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Container(
                width: 396,
                height: 136,
                decoration: AppStyles.largeBoxDecoration,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(Strings.default_pin,
                        style: AppStyles.mediumLightTextStyle),
                    const SizedBox(height: 6),
                    Text(Strings.pin, style: AppStyles.numberTextStyle),
                    const SizedBox(height: 6),
                    Text(
                      Strings.you_can,
                      style: AppStyles.mediumLightTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.26,  // Adjust the value as needed
                top: screenHeight * 0.1, // Adjust the value as needed
              ),
              child: Text(
                Strings.Enter_your_diffuser_pin,
                style: AppStyles.mediumLightTextStyle,
              ),
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int i = 0; i < 4; i++)
                  Column(
                    children: [
                      Container(
                        width: 65,
                        height: 58,
                        decoration: BoxDecoration(
                          color: AppColor.small_container_color, // Adjust the color
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            style: const TextStyle(
                              color: AppColor.color_white,
                              fontSize: 20,
                            ),
                            controller: pinControllers?[i],
                            focusNode: pinFocusNodes?[i],
                            onChanged: (value) {
                              // Move focus to the next field when a digit is entered
                              if (value.isNotEmpty) {
                                if (i < 3) {
                                  pinFocusNodes?[i]
                                      .unfocus(); // Remove focus from the current field
                                  pinFocusNodes?[i + 1]
                                      .requestFocus(); // Move focus to the next field
                                }
                              }
                            },
                            decoration: const InputDecoration(
                              counterText: '', // Hide the character counter
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 70), // Adjust the height as needed
                    ],
                  ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DiffuserController()),
                    ); // Define your route or action for the first container
                  },
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    child: SvgPicture.asset(
                      Images.arrows,
                      width: 15,
                      height: 15,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Row(
                children: [
                  CustomCheckbox(
                    value: rememberPin,
                    onChanged: (newValue) {
                      setState(() {
                        rememberPin = newValue;
                      });
                    },
                    width: 26, // Specify the width
                    height: 26, // Specify the height
                  ),
                  const SizedBox(width: 6),
                  Text(Strings.remember_pin,
                      style: AppStyles.verySmallTextStyle),
                ],
              ),
            ),
          ],
        ),
      ),
        ],
      ),
    );
  }
}

class CustomCircularRectangularField extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const CustomCircularRectangularField({
    super.key,
    required this.width,
    required this.height,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
