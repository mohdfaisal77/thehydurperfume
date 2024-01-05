import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hydur/ui/diffuser/trio_diff.dart';
import 'package:hydur/utils/app_color.dart';
import 'package:rotating_icon_button/rotating_icon_button.dart';
import '../../utils/app_styles.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class SelectDiffuser extends StatefulWidget {
  const SelectDiffuser({Key? key}) : super(key: key);

  @override
  State<SelectDiffuser> createState() => _SelectDiffuserState();
}

class _SelectDiffuserState extends State<SelectDiffuser>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  late FlutterBluePlus flutterBluePlus;
  late List<ScanResult> scanResults;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    animationController?.repeat();

    //flutterBluePlus = FlutterBluePlus.instance;
    scanResults = [];

    // Start Bluetooth scan
    _startScan();
  }

  void _startScan() async {
    try {
      await FlutterBluePlus.startScan(timeout: Duration(seconds: 10));
      FlutterBluePlus.scanResults.listen((results) {
        setState(() {
          scanResults = results;
        });
      });
    } catch (e) {
      print('Error starting scan: $e');
    }
  }

  void _stopScan() {
    FlutterBluePlus.stopScan();
  }

  @override
  void dispose() {
    _stopScan(); // Stop scanning when the widget is disposed
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        color: AppColor.backgroud_color3,
        // Replace with your desired background color
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 22, top: 35),
                    child: Text(Strings.select_diffuser,
                        style: AppStyles.headingTextStyle),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10, top: 15),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      color: AppColor.select_diffuser_color,
                      border: Border.all(width: 0.5, color: AppColor.skyColor),
                    ),
                    child: RotatingIconButton(
                      onTap: () {
                        showModalBottomSheet<void>(
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (BuildContext context) {
                              return Container(
                                height: 270,
                                decoration: AppStyles.topRadiusBoxDecoration,
                                padding: const EdgeInsets.only(left: 50,right: 50),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 15),
                                        child: Text(Strings.cant_find,
                                            style:
                                                AppStyles.mediumBoldTextStyle),
                                      ),
                                    ),
                                    const Align(
                                      alignment: Alignment.topCenter,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        // Add horizontal padding
                                        child: Text(
                                          Strings.make_sure_text,
                                          textAlign: TextAlign.center,
                                          // Center-align the text
                                          style: TextStyle(
                                            color: AppColor.color_white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                            height: 1.5
                                          ),

                                        ),
                                      ),
                                    ),

                                    const SizedBox(height: 20),
                                    GestureDetector(
                                      onTap: () {
                                        // Define your Bluetooth tap action here
                                      },
                                      child: SvgPicture.asset(
                                        Images.bluetooth,
                                        // Replace with your image asset path
                                        width: 67,
                                        height: 67,
                                      ),
                                    ),
                                    const SizedBox(height: 40),
                                  ],
                                ),
                              );
                            });
                      },
                      //elevation: 10.0,
                      shadowColor: AppColor.primaryColor,
                      borderRadius: 40.0,
                      rotateType: RotateType.full,
                      clockwise: true,
                      background: AppColor.skyColor,
                      child: const Padding(
                        padding: EdgeInsets.all(2),
                        child: Icon(
                          Icons.refresh,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // First Row of Containers
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  children: [
                    commonContainer(Strings.trio_diff),
                    const SizedBox(width: 10),
                    commonContainer(Strings.grandi_square),
                  ],
                ),
              ),

              // Second Row of Containers
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  children: [
                    commonContainer(Strings.trio_diff),
                    const SizedBox(width: 10),
                    commonContainer(Strings.trio_diff),
                  ],
                ),
              ),

              // Third Row of Containers
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  children: [
                    commonContainer(Strings.trio_diff),
                    const SizedBox(width: 10),
                    commonContainer(Strings.trio_diff),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget commonContainer(String text) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TrioDiff()),
          ); // Define your route or action for the first container
        },
        child: Container(
          width: 177,
          height: 83,
          child: Card(
            color: AppColor.small_container_color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 12.0),
                      child: Text(text, style: AppStyles.mediumLightTextStyle),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 6.0),
                      child: Text(
                        Strings.home_lounge,
                        style: AppStyles.homeTextStyle,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 16,
                  right: 18,
                  child: SvgPicture.asset(
                    Images.arrows,
                    width: 7.2,
                    height: 14.4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
