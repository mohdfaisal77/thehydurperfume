import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_color.dart';

class CustomIconContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color? bgColor;
  final Color? borderColor;
  final bool isPowerOn;
  final String svgImagePath;
  final VoidCallback? onTap; // Optional onTap property

  CustomIconContainer({
    required this.width,
    required this.height,
    this.bgColor,
    this.borderColor,
    required this.isPowerOn,
    required this.svgImagePath,
    this.onTap, // Optional onTap property
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Use the provided onTap callback
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: isPowerOn
              ? (bgColor ?? AppColor.button_red.withOpacity(0.2))
              : AppColor.button_color_text,
          border: Border.all(
            color: isPowerOn
                ? (borderColor ?? AppColor.button_red.withOpacity(0.1))
                : AppColor.button_color_text.withOpacity(0.1),
            width: 1.0,
          ),
        ),
        padding: EdgeInsets.all(23),
        child: SvgPicture.asset(
          svgImagePath,
          width: 19,
          height: 10,
        ),
      ),
    );
  }
}

