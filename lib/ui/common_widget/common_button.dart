import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_color.dart';
import '../../utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  final String? buttonText;
  final double height;
  final double width;
  final VoidCallback? onTap;

  CustomButton({
    this.buttonText,
    this.height = 43,
    this.width = 364,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Attach the onTap callback to the GestureDetector
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AppColor.color_white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: buttonText != null
              ? Text(
            buttonText!,
            style: AppStyles.buttonTextStyle,
          )
              : null,
        ),
      ),
    );
  }
}
