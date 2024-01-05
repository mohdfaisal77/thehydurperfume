import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/app_color.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final String? svgIconPath;
  final Color? hintTextColor;
  final TextEditingController? controller; // Added optional hint text color parameter

  CustomTextField({this.hintText,  this.controller,  this.svgIconPath, this.hintTextColor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      // cursorColor: Colors.white,
      autofocus: false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintText != null
            ? GoogleFonts.montserrat(
                color: hintTextColor ??
                    AppColor
                        .set_about, // Use provided hintTextColor or default color
              )
            : null,
        // Only apply the hint style if hintText is provided
        fillColor: AppColor.text_field,
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 15.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: AppColor.text_field),
        ),
        border: OutlineInputBorder(

          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: AppColor.text_field),
        ),
        suffixIcon: svgIconPath != null
            ? Padding(
                padding: const EdgeInsets.only(right: 8.0, top: 10, bottom: 7),
                child: SvgPicture.asset(
                  svgIconPath!,
                  width: 14,
                  height: 14,
                  fit: BoxFit.scaleDown,
                ),
              )
            : null, // Only show the suffix icon if svgIconPath is provided
      ),
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
