import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class AppStyles {
  static TextStyle mediumLightTextWithOpacityStyle = GoogleFonts.montserrat(
    color: AppColor.color_white.withOpacity(0.2),
    fontSize: 15,
    fontWeight: FontWeight.w300,
  );
  static TextStyle mediumLightTextStyle = GoogleFonts.montserrat(
    color: AppColor.color_white,
    fontSize: 15,
    fontWeight: FontWeight.w300,
  );
  static TextStyle blackMediumTextStyle = GoogleFonts.montserrat(
    color: AppColor.color_black,
    fontSize: 15,
  );
  static TextStyle whiteMediumTextStyle = GoogleFonts.montserrat(
    color: AppColor.color_white,
    fontSize: 15,
  );
  static TextStyle largeMediumTextStyle = GoogleFonts.montserrat(
    color: AppColor.color_white,
    fontSize: 18,
  );

  static TextStyle mediumBoldTextStyle = GoogleFonts.montserrat(
    color: AppColor.color_white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle smallBoldTextStyle = GoogleFonts.montserrat(
    color: AppColor.color_white,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static TextStyle underlinedTextStyle = GoogleFonts.montserrat(
    color: AppColor.color_white,
    decoration: TextDecoration.underline,
    fontSize: 15,
  );

  static TextStyle homeTextStyle = GoogleFonts.montserrat(
    color: AppColor.home_lounge,
    fontSize: 12,
    fontWeight: FontWeight.w300,
  );

  static TextStyle verySmallTextStyle = GoogleFonts.montserrat(
    color: AppColor.color_white,
    fontSize: 12,
    fontWeight: FontWeight.w300,
  );

  static TextStyle opacitySmallTextStyle = GoogleFonts.montserrat(
    color: AppColor.color_white.withOpacity(0.1),
    fontSize: 12,
  );

  static TextStyle daysTextStyle = GoogleFonts.montserrat(
    color: AppColor.color_white,
    fontSize: 10,
  );

  static TextStyle smalllightTextStyle = GoogleFonts.montserrat(
    color: AppColor.color_white,
    fontSize: 12,
  );

  static TextStyle greyTextStyle = GoogleFonts.montserrat(
    color: AppColor.start_end,
    fontSize: 12,
  );

  static TextStyle smallTextStyle = GoogleFonts.montserrat(
    color: AppColor.color_white,
    fontSize: 12,
    fontWeight: FontWeight.w300,
  );

  static TextStyle headingTextStyle = GoogleFonts.prata(
    fontSize: 28,
    color: AppColor.color_white,
  );

  static TextStyle monsHeadingTextStyle = GoogleFonts.montserrat(
    fontSize: 20,
    color: AppColor.color_white,
  );

  static TextStyle numberTextStyle = GoogleFonts.quicksand(
    color: AppColor.color_white,
    fontSize: 30,
  );

  static BoxDecoration gradientColorBoxDecoration = BoxDecoration(
    gradient: const LinearGradient(
      colors: [
        AppColor.skyColor, // Adjust gradient colors
        AppColor.background_color_container1,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(6),
  );
  static BoxDecoration gradientBoxDecoration = BoxDecoration(
    gradient: const LinearGradient(
      colors: [
        AppColor.color_blue, // Adjust gradient colors
        AppColor.color_darkBlue,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(6),
  );
  static BoxDecoration darkColorBoxDecoration = BoxDecoration(
    color: AppColor.set_about.withOpacity(0.2),
    borderRadius: BorderRadius.circular(6),
  );

  static BoxDecoration darkBoxDecoration = BoxDecoration(
    color: AppColor.small_container_color,
    borderRadius: BorderRadius.circular(6),
  );

  static BoxDecoration saveBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
  );

  static BoxDecoration circleBoxDecoration = const BoxDecoration(
    gradient: AppColor.b3b4Gradient,
    shape: BoxShape.circle,
  );

  static BoxDecoration largeBoxDecoration = BoxDecoration(
    gradient: const LinearGradient(
      colors: [
        AppColor.color_blue, // Adjust gradient colors
        AppColor.color_darkBlue,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(17),
  );

  static BoxDecoration notificationBoxDecoration = BoxDecoration(
    gradient: const LinearGradient(
      colors: [
        AppColor.container_bottom1, // Adjust gradient colors
        AppColor.container_bottom2,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(17),
  );

  static BoxDecoration dialogBoxDecoration = BoxDecoration(
    gradient: const LinearGradient(
      colors: [
        AppColor.container_bottom1, // Adjust gradient colors
        AppColor.container_bottom2,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(12),
  );

  static BoxDecoration topRadiusBoxDecoration = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColor.color_blue,
        AppColor.color_darkBlue,
      ],
    ),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(44),
      topRight: Radius.circular(44),
    ),
  );


  static TextStyle buttonTextStyle= GoogleFonts.montserrat(
    color: AppColor.button_color_text.withOpacity(0.9),
    fontSize: 15,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0,
  );

}

// Strings.home_lounge,
// style:AppStyles.homeTextStyle,
// AppStyles.mediumLightTextStyle
// AppStyles.darkBoxDecoration,