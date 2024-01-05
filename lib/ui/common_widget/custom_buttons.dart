import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_color.dart';
import '../../utils/images.dart';

class CustomPredefinedButton extends StatefulWidget {
  final TextStyle textStyle;
  final BorderRadius borderRadius;
  final String predefinedText;
  final String customText;
  final Function()? onPredefinedPressed;
  final Function()? onCustomPressed;

  CustomPredefinedButton({
    required this.textStyle,
    required this.borderRadius,
    required this.predefinedText,
    required this.customText,
    this.onPredefinedPressed,
    this.onCustomPressed,
  });

  @override
  _CustomPredefinedButtonState createState() => _CustomPredefinedButtonState();
}

class _CustomPredefinedButtonState extends State<CustomPredefinedButton> {
  bool isPredefinedSelected = true;

  void _onPredefinedPressed() {
    setState(() {
      isPredefinedSelected = true;
      widget.onPredefinedPressed?.call();
    });
  }

  void _onCustomPressed() {
    setState(() {
      isPredefinedSelected = false;
      widget.onCustomPressed?.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: Container(
        width: 377,
        height: 36,
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: _onPredefinedPressed,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: isPredefinedSelected
                        ? const LinearGradient(
                      colors: [AppColor.b3, AppColor.b4],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )
                        : null,
                    color: isPredefinedSelected
                        ? null
                        : AppColor.small_container_color,
                  ),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 19), // Add spacing from left
                        SvgPicture.asset(
                          isPredefinedSelected
                              ? Images.green_tick
                              : Images.grey_tick,
                          width: 23,
                          height: 23,
                        ),
                        SizedBox(width: 10), // Add spacing between image and text
                        Text(
                          widget.predefinedText,
                          style: widget.textStyle.copyWith(
                            color: isPredefinedSelected
                                ? AppColor.color_white
                                : AppColor.home_lounge,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: _onCustomPressed,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: !isPredefinedSelected
                        ? const LinearGradient(
                      colors: [AppColor.b3, AppColor.b4],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )
                        : null,
                    color: isPredefinedSelected
                        ? AppColor.small_container_color
                        : null,
                  ),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 19), // Add spacing from left
                        SvgPicture.asset(
                          !isPredefinedSelected
                              ? Images.green_tick
                              : Images.grey_tick,
                          width: 23,
                          height: 23,
                        ),
                        SizedBox(width: 10), // Add spacing between image and text
                        Text(
                          widget.customText,
                          style: widget.textStyle.copyWith(
                            color: isPredefinedSelected
                                ? AppColor.home_lounge
                                : AppColor.color_white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
