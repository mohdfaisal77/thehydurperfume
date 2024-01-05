import 'package:flutter/material.dart';

import '../../utils/app_color.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double width;
  final double height;

  const CustomCheckbox({
    required this.value,
    required this.onChanged,
    required this.width,  // Specify the width for the checkbox
    required this.height, // Specify the height for the checkbox
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: SizedBox(
        width: width,
        height: height,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(width: 0.5, color: AppColor.check_box),
            color: AppColor.backgroud_color3 ,
          ),
            child: value
                ? const Icon(
              Icons.check,
              color: AppColor.color_white,
              size: 20.0,
            )
                : Container(),
          ),
        ),
    );
  }
}
