
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hydur/utils/strings.dart';

import '../../utils/app_color.dart';
import '../../utils/app_styles.dart';
import '../../utils/images.dart';
import '../diffuser/select_diffuser.dart';
import 'notifications_screen.dart';


class NotificationDetail extends StatefulWidget {
  const NotificationDetail({Key? key}) : super(key: key);

  @override
  _NotificationDetailState createState() => _NotificationDetailState();
}
class _NotificationDetailState extends State<NotificationDetail> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.backgroud_color3,
      body: Stack(
        children: [
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
                          );
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
                        child: Text(Strings.notification_detail,
                            style: AppStyles.headingTextStyle
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20), // Add spacing between texts
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align the text to the left
                  children: [
                    Padding(padding: EdgeInsets.only(top:10,left: 20),
                      child:Text(Strings.notification,
                          style: AppStyles.mediumLightTextStyle
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(padding: EdgeInsets.only(left: 20),// Add spacing between the consumption and the next text
                      child: Text(Strings.dummy_text,
                          style: AppStyles.opacitySmallTextStyle
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(padding: EdgeInsets.only(left: 20),
                      child:Text(Strings.august, style: AppStyles.opacitySmallTextStyle),
                    ),

                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30, // Adjust the bottom distance as needed
            width: screenWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue), // Blue border color
                    shape: BoxShape.circle,
                  ),
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NotificationScreen()),
                      );
                    },
                    backgroundColor: AppColor.backgroud_color3, // Button background color
                    child: const Icon(
                      Icons.close, // X icon
                      color: Colors.blue, // Blue icon color
                    ),
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

