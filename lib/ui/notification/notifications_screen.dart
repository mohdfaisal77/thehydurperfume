
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/app_color.dart';
import '../../utils/app_styles.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';
import '../secret/secret_garden.dart';
import 'notification_detail.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroud_color3,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60.0, right: 20), // Added right padding
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
                            MaterialPageRoute(builder: (context) => SecretGarden()),
                          ); // Define your route or action for the first container
                        },
                        child: SvgPicture.asset(
                          Images.back_arrows,
                          width: 24.2,
                          height: 24.4,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        Strings.notifications,
                        style: AppStyles.headingTextStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    // Implement your read all functionality here
                    // Notifications.markAllAsRead();
                  },
                  child: Text(
                    Strings.read_all,
                    style: AppStyles.underlinedTextStyle,
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    // Implement your delete all functionality here
                    // Notifications.deleteAll();
                  },
                  child: Text(
                    Strings.delete_all,
                    style: AppStyles.underlinedTextStyle,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with your actual number of notifications
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      // Navigate to the next screen or perform an action
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationDetail(), // Replace with the actual screen widget
                        ),
                      );
                    },
                child: Container(
                  height: 92,
                  width: 396,
                  decoration: AppStyles.notificationBoxDecoration,
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 12, 10, 10), // Add top padding
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Strings.notification,
                              style: AppStyles.mediumLightTextStyle,
                            ),
                            SizedBox(height: 5), // Add spacing between notification and below text
                            Text(
                              Strings.dummy_text, // Replace with your desired text
                              style: AppStyles.opacitySmallTextStyle,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                          children: [
                            GestureDetector(
                              onTap: () {
                                print("delete");
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return showConfirmationDialog(context);
                                  },
                                );
                              },
                              child: SvgPicture.asset(
                                Images.bin_icon,
                                width: 24, // Adjust the width as needed
                                height: 24, // Adjust the height as needed
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 20), // Add spacing from the right side
                      ],
                    ),
                  ),
                ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Dialog showConfirmationDialog(BuildContext dialogContext) {
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
    width: 302,
    height: 267,
    decoration: AppStyles.dialogBoxDecoration,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 20),
        Text(
          Strings.warning,
          style: AppStyles.mediumBoldTextStyle,
        ),
        SizedBox(height: 10),
        Text(
          Strings.delete_notification,
          style:AppStyles.smallBoldTextStyle
        ),
        SizedBox(height: 20),
        Text(
          Strings.are_you_sure,
          style: AppStyles.smalllightTextStyle
        ),
        SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {

          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(253, 50),
            backgroundColor: AppColor.color_white,
          ),
          child: Text(Strings.continu,
          style: AppStyles.blackMediumTextStyle,
          ),
        ),
        SizedBox(height: 10), // Add spacing between buttons
        ElevatedButton(
          onPressed: () {

          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(253, 50),
            backgroundColor: AppColor.color_white,
          ),
          child: Text(Strings.cancel,
            style: AppStyles.blackMediumTextStyle,
          ),
        ),
      ],
    ),
  );
}