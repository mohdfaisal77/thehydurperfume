import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydur/ui/change_pin/change_pin.dart';
import 'package:hydur/ui/diffuser/select_diffuser.dart';
import 'package:hydur/ui/secret/secret_garden.dart';

import 'package:hydur/utils/app_styles.dart';

import '../../utils/app_color.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';
import '../common_widget/CustomIconContainer.dart';
import '../common_widget/common_button.dart';
import '../common_widget/custom_text_field.dart';
import '../notification/notifications_screen.dart';

// ... (previous imports and class definition)

class DiffuserController extends StatefulWidget {
  const DiffuserController({Key? key});

  @override
  _DiffuserControllerState createState() => _DiffuserControllerState();
}

class _DiffuserControllerState extends State<DiffuserController>
    with TickerProviderStateMixin {
  late TabController _tabController;
  bool _isPowerOn = true;
  bool _isButton1Selected = true; // Initial state
  bool _isButton2Selected = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.index == 0) {
        _isButton1Selected = true;
        _isButton2Selected = false;
      } else if (_tabController.index == 1) {
        _isButton1Selected = false;
        _isButton2Selected = true;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> sendCommand(List<int> command) async {
    // Implement sending the command to the device over Bluetooth
    // Example: await bluetoothConnection.sendData(Uint8List.fromList(command));
  }

  Future<List<int>?> waitForResponse() async {
    Completer<List<int>?> completer = Completer();
    // Implement waiting for a response and resolve the completer when response is received
    // Listen for incoming data using your Bluetooth library and resolve the completer
    // Example: bluetoothConnection.onDataReceived.listen((data) => completer.complete(data));
    return completer.future;
  }

  Future<void> getDeviceInformation() async {
    // Request device information
    await sendCommand([0x40]);
    List<int>? response = await waitForResponse();

    if (response != null && response.isNotEmpty && response[0] == 0x40) {
      int numberOfPackets = response[1]; // XX represents the number of packets
      for (int i = 0; i < numberOfPackets; i++) {
        // Request each packet individually and handle the response
        await sendCommand([0x40]);
        List<int>? packetResponse = await waitForResponse();
        // Process the packetResponse data
      }
    }
  }

  Future<void> getCurrentTime() async {
    // Request current time
    await sendCommand([0x41]);
    List<int>? response = await waitForResponse();

    if (response != null && response.length == 8 && response[0] == 0x41) {
      int year = response[1];
      int month = response[2];
      int day = response[3];
      int hour = response[4];
      int minute = response[5];
      int second = response[6];
      // Process the time information
    }
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
          Padding(
            padding: const EdgeInsets.only(
              top: 40,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Row(
                  children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SelectDiffuser()),
                            ); // Define your route or action for the first container
                          },
                          child: SvgPicture.asset(
                            Images.back_arrows,
                            width: 14.2,
                            height: 24.4,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(Strings.diffuser_control,
                            style: AppStyles.headingTextStyle),
                      ),
                  ],
                  ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NotificationScreen()),
                          ); // Define your route or action for the first container
                        },
                        child: SvgPicture.asset(
                          Images.bell_icon,
                          width: 23.2,
                          height: 30.4,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(screenHeight * 0.010)),
                Container(
                  width: screenWidth * 0.88,
                  height: screenHeight * 0.04,
                  decoration: BoxDecoration(
                    color: AppColor.about_color, // Use the #F1F1F1 color
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _tabController.animateTo(0);
                            setState(() {
                              _isButton1Selected = true;
                              _isButton2Selected = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              gradient: _isButton1Selected
                                  ? LinearGradient(
                                      colors: [
                                        AppColor.set.withOpacity(0.9),
                                        AppColor.about.withOpacity(0.9),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    )
                                  : null,
                            ),
                            child: Center(
                              child: Text(
                                Strings.set,
                                style: GoogleFonts.montserrat(
                                  color: _isButton1Selected
                                      ? AppColor.color_white
                                      : AppColor.set_about,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _tabController.animateTo(1);
                            setState(() {
                              _isButton1Selected = false;
                              _isButton2Selected = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              gradient: _isButton2Selected
                                  ? LinearGradient(
                                      colors: [
                                        AppColor.set.withOpacity(0.9),
                                        AppColor.about.withOpacity(0.9),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    )
                                  : null,
                            ),
                            child: Center(
                              child: Text(
                                Strings.about,
                                style: GoogleFonts.montserrat(
                                  color: _isButton2Selected
                                      ? AppColor.color_white
                                      : AppColor.set_about,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildSetPage(),
                      _buildAboutPage(),
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

  Widget _buildSetPage() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: screenHeight * 0.01,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    Strings.diffuser_name,
                    style: AppStyles.mediumLightTextStyle,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  height: 41,
                  child: CustomTextField(
                    hintText: Strings.trio_diff,
                    svgIconPath: Images.edit,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 22)),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    Strings.diffuser_location,
                    style: AppStyles.mediumLightTextStyle,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  height: 41,
                  decoration: BoxDecoration(
                    color: AppColor.text_field.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: CustomTextField(
                    hintText: Strings.trio_diff,
                    svgIconPath: Images.edit,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.030),
                  // Adjust the factor as needed
                  width: MediaQuery.of(context).size.width * 0.88,
                  // Adjust the factor as needed
                  height: MediaQuery.of(context).size.height * 0.050,
                  // Adjust the factor as needed
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.035),
                  // Adjust the factor as needed
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColor.diffuser_control.withOpacity(0.9),
                        AppColor.diffuser_control2.withOpacity(0.9),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width *
                            0.038), // Adjust the factor as needed
                  ),
                  child: Text(
                    Strings.turn_off,
                    style: AppStyles.verySmallTextStyle,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 3),
            // Adjust the margin value as needed
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isPowerOn = !_isPowerOn;
                });
              },
              child: Container(
                child: SvgPicture.asset(
                  _isPowerOn
                      ? Images.power
                      : Images.power_off, // Use your grey power image asset
                  width: 73,
                  height: 73,
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.039,
            width: 2,
            color: Colors.grey,
          ),
          Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.01,
                left: MediaQuery.of(context).size.width * 0.09,
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      CustomIconContainer(
                        width: MediaQuery.of(context).size.width * 0.19,
                        // Adjust the factor as needed
                        height: MediaQuery.of(context).size.height * 0.085,
                        bgColor: AppColor.button_red.withOpacity(0.2),
                        borderColor: AppColor.button_red.withOpacity(0.1),
                        isPowerOn: _isPowerOn,
                        svgImagePath: Images.arrows,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SecretGarden()),
                          ); // Define your route or action for the first container
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        Strings.secret_garden,
                        style: AppStyles.verySmallTextStyle,
                      ),
                      Text(
                        Strings.sixty,
                        style: AppStyles.verySmallTextStyle,
                      )
                    ],
                  ),
// Padding(padding: EdgeInsets.only(bottom: 10)),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height *
                          0.048, // Adjust the factor as needed
                      left: MediaQuery.of(context).size.width *
                          0.006, // Adjust the factor as needed
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height *
                          0.002, // Adjust the factor as needed
                      width: MediaQuery.of(context).size.width *
                          0.089, // Adjust the factor as needed
                      color: Colors.grey,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 4)),
                  Column(
                    children: [
                      CustomIconContainer(
                        width: MediaQuery.of(context).size.width * 0.19,
                        // Adjust the factor as needed
                        height: MediaQuery.of(context).size.height * 0.085,
                        // Adjust the factor as needed
                        bgColor: AppColor.button_green.withOpacity(0.2),
                        borderColor: AppColor.button_green.withOpacity(0.1),
                        isPowerOn: _isPowerOn,
                        svgImagePath: Images.arrows,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        Strings.Blossom,
                        style: AppStyles.verySmallTextStyle,
                      ),
                      Text(
                        Strings.hundered,
                        style: AppStyles.verySmallTextStyle,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height *
                          0.048, // Adjust the factor as needed
                      left: MediaQuery.of(context).size.width *
                          0.009, // Adjust the factor as needed
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height *
                          0.002, // Adjust the factor as needed
                      width: MediaQuery.of(context).size.width *
                          0.089, // Adjust the factor as needed
                      color: Colors.grey,
                    ),
                  ),

                  Column(
                    children: [
                      CustomIconContainer(
                        width: MediaQuery.of(context).size.width * 0.19,
                        // Adjust the factor as needed
                        height: MediaQuery.of(context).size.height * 0.085,
                        bgColor: AppColor.button_brown.withOpacity(0.2),
                        borderColor: AppColor.button_brown.withOpacity(0.1),
                        isPowerOn: _isPowerOn,
                        svgImagePath: Images.arrows,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        Strings.relax_unwind,
                        style: AppStyles.verySmallTextStyle,
                      ),
                      Text(
                        Strings.fourty,
                        style: AppStyles.verySmallTextStyle,
                      )
                    ],
                  ),
                ],
              )),
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.017),
            // Adjust the factor as needed
            width: MediaQuery.of(context).size.width * 0.845,
            // Adjust the factor as needed
            height: MediaQuery.of(context).size.height * 0.069,
            // Adjust the factor as needed
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.032),
            // Adjust the factor as needed
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColor.container_bottom1.withOpacity(0.9),
                  AppColor.container_bottom2.withOpacity(0.9)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width *
                      0.027), // Adjust the factor as needed
              // boxShadow: [...],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  Strings.turn_on_off,
                  style: AppStyles.verySmallTextStyle,
                ),
                Text(
                  Strings.schedule_text,
                  style: AppStyles.verySmallTextStyle,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget commonBar(text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.all(12.5),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: AppColor.text_field,
            border: Border.all(width: 0.5, color: AppColor.text_field),
          ),
          child: Text(text, style: AppStyles.whiteMediumTextStyle)),
    );
  }

  Widget _buildAboutPage() {
    return Column(
      children: [
        SizedBox(height: 18),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              commonBar(Strings.psb_version, () {
                print("object");
              }),
              commonBar(Strings.diffuser_version, () {
                print("object");
              }),
              commonBar(Strings.app_version, () {
                print("object");
              }),
              Padding(padding: EdgeInsets.only(top: 272)),
              GestureDetector(
                onTap: () {
                  // Add your button click functionality here
                },
                child: CustomButton(
                  buttonText: Strings.change_pin,
                  onTap: () {
                    // Navigate to the new screen when the button is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChangePIN()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
