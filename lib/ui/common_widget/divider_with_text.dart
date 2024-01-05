import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_styles.dart';



// Define the reusable widget
class DividerWithText extends StatelessWidget {
  final String text;
  final String quantity;

  const DividerWithText({
    required this.text,
    required this.quantity,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 6,right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: AppStyles.mediumLightTextStyle,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12, top: 5),
                child: Container(
                  width: 80,
                  height: 42,
                  decoration: const BoxDecoration(
                    color: AppColor.small_container_color,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
                  ),
                  child: Center(
                    child: Text(
                      quantity,
                      style: const TextStyle(
                        color: AppColor.color_white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 0),
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 25),
          child: Container(
            width: 360,
            height: 0.5,
            color: AppColor.divider_color,
          ),
        ),
      ],
    );
  }
}