import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../utils/app_color.dart';
import '../../utils/app_styles.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';
import '../common_widget/common_button.dart';
import '../common_widget/custom_text_field.dart';
import '../diffuser/diffuser_controller.dart';

class ChangePIN extends StatefulWidget {
  @override
  _ChangePINState createState() => _ChangePINState();
}

class _ChangePINState extends State<ChangePIN> {
  final TextEditingController _confirmNewPinController = TextEditingController();

  Future<void> _updatePin() async {
    final newPin = _confirmNewPinController.text;

    if (newPin.isNotEmpty) {
      final newPasswordBytes = newPin.runes
          .map((rune) => rune.toRadixString(16).padLeft(2, '0'))
          .join(' ');

      final response = await simulateDeviceCommunication(newPasswordBytes);

      if (response == "success") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("PIN updated successfully."),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Failed to update PIN. Please try again."),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter a new PIN."),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<String> simulateDeviceCommunication(String newPasswordBytes) async {
    // Simulate sending bytes to the device
    print("Sending new PIN bytes to device: $newPasswordBytes");

    // Simulate receiving response from device
    await Future.delayed(Duration(seconds: 2)); // Simulate device processing
    final deviceResponse = "success"; // Simulated device response

    return deviceResponse;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Images.diffuser,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DiffuserController()),
                            );
                          },
                          child: SvgPicture.asset(
                            Images.back_arrows,
                            width: screenWidth * 0.06,
                            height: screenHeight * 0.035,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Container(
                          child: Text(
                            Strings.change_pin,
                            style: AppStyles.headingTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.02,
                    left: screenWidth * 0.06,
                    right: screenWidth * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: screenHeight * 0.04),
                          height: screenHeight * 0.059,
                          decoration: BoxDecoration(
                            color: AppColor.text_field.withOpacity(0.3),
                            borderRadius:
                            BorderRadius.circular(screenWidth * 0.044),
                          ),
                          child: CustomTextField(
                            hintTextColor: AppColor.color_white,
                            hintText: Strings.enter_pin,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: screenHeight * 0.023),
                          height: screenHeight * 0.059,
                          decoration: BoxDecoration(
                            color: AppColor.text_field.withOpacity(0.3),
                            borderRadius:
                            BorderRadius.circular(screenWidth * 0.044),
                          ),
                          child: CustomTextField(
                            hintTextColor: AppColor.color_white,
                            hintText: Strings.Re_enter_new_pin,
                            controller: _confirmNewPinController,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.049),
                          child: GestureDetector(
                            onTap: _updatePin,
                            child: CustomButton(buttonText: Strings.update),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
