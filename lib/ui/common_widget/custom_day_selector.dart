import 'dart:ui';

import 'package:flutter/cupertino.dart';

import '../../utils/app_color.dart';
import '../../utils/app_styles.dart';

class CustomDaySelector extends StatelessWidget {
  final String day;
  final bool isSelected;
  final VoidCallback onPressed;

  const CustomDaySelector({
    required this.day,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    final boxColor = isSelected ? AppColor.select_diffuser_color2 : AppColor.home_lounge;
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      gradient: isSelected
          ? AppColor.b1b2Gradient
          : null, // No gradient for unselected days
      color: isSelected ? null : boxColor,
    );

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 68,
        height: 30.6,
        decoration: decoration,
        child: Center(
          child: Text(
            day,
            style: AppStyles.daysTextStyle,
          ),
        ),
      ),
    );
  }
}
