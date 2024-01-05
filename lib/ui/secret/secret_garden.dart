import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hydur/ui/diffuser/diffuser_controller.dart';
import 'package:hydur/ui/settings/predefined_settings.dart';
import 'package:hydur/utils/app_color.dart';
import 'package:hydur/utils/app_styles.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';
import 'package:hydur/ui/common_widget/divider_with_text.dart';

import '../common_widget/flutter_advanced_switch.dart';
import '../settings/setting_screens.dart';

class SecretGarden extends StatefulWidget {
  const SecretGarden({super.key});

  @override
  State<SecretGarden> createState() => _SecretGardenState();
}

class _SecretGardenState extends State<SecretGarden> {
  bool switchValue = true;
  final _controller = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Images.back1,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
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
                                    MaterialPageRoute(builder: (context) => DiffuserController()),
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
                              child: Text(Strings.secret_garden,
                                  style: AppStyles.headingTextStyle),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PredefinedSettingsScreen()),
                            ); // Add you
                          },
                          child: Container(
                            width: 69,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                Strings.save,
                                style: AppStyles.blackMediumTextStyle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, top: 30, right: 30),
                    child: Container(
                      width: 360,
                      height: 42,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColor.small_container_color,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: Strings.secret_garden,
                                hintStyle: AppStyles.whiteMediumTextStyle,
                                contentPadding:
                                    const EdgeInsets.only(left: 10, bottom: 5),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: SvgPicture.asset(
                              Images.pen,
                              width: 18,
                              height: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                         child: SizedBox(
                            height: 165.7,
                            width: 165.7,
                            child:Align(
                              alignment: Alignment.center,
                            child: SfRadialGauge(axes: <RadialAxis>[
                              RadialAxis(
                                minimum: 0,
                                maximum: 100,
                                showLabels: false,
                                showTicks: false,
                                radiusFactor: 1,
                                startAngle: 0,
                                endAngle: 360,
                                axisLineStyle: const AxisLineStyle(
                                  thickness: 0.02,
                                  cornerStyle: CornerStyle.bothCurve,
                                  color: Color.fromARGB(30, 0, 169, 181),
                                  thicknessUnit: GaugeSizeUnit.factor,
                                ),
                                pointers: const <GaugePointer>[
                                  RangePointer(
                                    value: 70,
                                    sizeUnit: GaugeSizeUnit.factor,
                                    cornerStyle: CornerStyle.bothCurve,
                                    width: 0.02,
                                    gradient: SweepGradient(
                                      colors: <Color>[
                                        AppColor.color_blue,
                                        AppColor.skyColor,
                                      ],
                                      stops: <double>[
                                        0.25,
                                        0.75,
                                      ],
                                    ),
                                    enableAnimation: true,
                                    animationDuration: 100,
                                    animationType: AnimationType.linear,
                                  ),
                                  MarkerPointer(
                                    value: 70,
                                    markerHeight: 15,
                                    markerWidth: 15,
                                    markerType: MarkerType.circle,
                                    color: AppColor.primaryColor,
                                  ),
                                ],
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                    angle: 90,
                                    widget: InkWell(
                                      onTap: () {
                                        print("recalibrated");
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return recalibratedDialog(context);
                                          },
                                        );
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.all(20),
                                        padding: const EdgeInsets.all(5),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(80)),
                                          color: AppColor.skyColor,
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "70%",
                                              style: TextStyle(fontSize: 20, color: Colors.white),
                                            ),
                                            const Text(
                                              Strings.refil_scent_calibrated,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 15, color: Colors.white),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            SvgPicture.asset(
                                              Images.rightarrow,
                                              width: 16,
                                              height: 16,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]
                            ),),
                          )

                      ),
                      Positioned(
                        right: 20,
                        child: AdvancedSwitch(
                          controller: _controller,
                          activeColor: Colors.green,
                          inactiveColor: Colors.grey,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          width: 50.0,
                          height: 25.0,
                          enabled: true,
                          disabledOpacity: 0.5,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),

                  Padding(
                    padding: EdgeInsets.only(left: 14,right: 10), // Adjust the padding as needed
                    child: const DividerWithText(
                      text: 'Consumption:',
                      quantity: '2.62 ml',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 14,right: 10), // Adjust the padding as needed
                    child: const DividerWithText(
                      text: 'Scenting Oil Capacity:',
                      quantity: '100 ml',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 14,right: 10), // Adjust the padding as needed
                    child: const DividerWithText(
                      text: 'Remaining:',
                      quantity: '35 Days',
                    ),
                  ),

                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 17, right: 17),
                    child: Container(
                      width: 396,
                      height: 103,
                      decoration: AppStyles.largeBoxDecoration,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 21,
                            left: 26,
                            child: Text(Strings.scent_intensity_setting,
                                style: AppStyles.mediumLightTextStyle),
                          ),
                          Positioned(
                            top: 46,
                            left: 26,
                            child: Text(
                              Strings.manage_the_intensity_of_the_scenting,
                              style: AppStyles.smalllightTextStyle,
                              textAlign: TextAlign.right,
                            ),
                          ),
                          Positioned(
                            top: 58,
                            left: 26,
                            child: Text(
                              Strings.experience_to_suit_your_preference,
                              style: AppStyles.smalllightTextStyle,
                              textAlign: TextAlign.right,
                            ),
                          ),
                          Positioned(
                            bottom: 30,
                            right: 24.7,
                            top: 30,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SettingsScreen()),
                                  ); // Add your onTap logic here
                                },
                                child: SvgPicture.asset(
                                  Images.arrows,
                                  // Replace with your arrow image
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Dialog recalibratedDialog(BuildContext dialogContext) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(dialogContext),
    );
  }

  contentBox(dialogContext) {
    return Container(
      padding: const EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 15),
      decoration: AppStyles.gradientColorBoxDecoration,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            Strings.scenting_oil_top_up,
            style: AppStyles.largeMediumTextStyle,
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              Strings.scenting_oil_top_up_detail,
              style: AppStyles.whiteMediumTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.balance_in_diffuser,
                      style: AppStyles.mediumLightTextWithOpacityStyle,
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        child: Text(
                          "120ml",
                          style: AppStyles.mediumLightTextWithOpacityStyle,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  width: 360,
                  height: 0.5,
                  color: AppColor.color_white.withOpacity(0.3),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        Strings.refil_amount,
                        style: AppStyles.mediumLightTextStyle,
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                            color: AppColor.color_white.withOpacity(0.3),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8))),
                        child: Text(
                          "100ml",
                          style: AppStyles.mediumLightTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  height: 0.5,
                  color: AppColor.color_white.withOpacity(0.3),
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.color_white,
                        onPrimary: AppColor.color_white,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      onPressed: () {
                        Navigator.pop(dialogContext);
                      },
                      child: Text(Strings.recalibrate,
                          style: AppStyles.buttonTextStyle)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
