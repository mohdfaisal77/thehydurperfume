import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_color.dart';
import '../../utils/app_styles.dart';
import '../../utils/strings.dart';
class PredefinedContainer extends StatefulWidget {
  @override
  _PredefinedContainerState createState() => _PredefinedContainerState();
}

class _PredefinedContainerState extends State<PredefinedContainer> {
  int number = 0;

  void incrementNumber() {
    setState(() {
      number++;
    });
  }

  void decrementNumber() {
    setState(() {
      if (number > 0) {
        number--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 378,
          height: 131,
          decoration: AppStyles.gradientBoxDecoration,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                Strings.set_the_intensity,
                style: AppStyles.verySmallTextStyle,
              ),
            ),
          ),
        ),
        // The second container is partially overlapping the first container
        Container(
          width: 378,
          height: 131,
          decoration: AppStyles.darkBoxDecoration,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: decrementNumber,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppStyles.darkBoxDecoration.color, // Use appropriate color from your AppStyles
                      borderRadius: BorderRadius.circular(10), // Half of the width/height to make it circular
                      border: Border.all(
                        color: Colors.white,
                        width: 0.3,
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(6.0), // Adjust the padding as needed
                        child: SvgPicture.asset(
                          'assets/images/minuss.svg', // Replace with the actual path
                          width: 31.1, // Adjust the width as needed
                          height: 20, // Adjust the height as needed
                        ),
                      ),
                    ),
                  ),
                ),



                Text(
                  number.toString(),
                  style: AppStyles.largeMediumTextStyle,
                ),
                GestureDetector(
                  onTap: incrementNumber,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppStyles.darkBoxDecoration.color, // Use appropriate color from your AppStyles
                      borderRadius: BorderRadius.circular(10), // Half of the width/height to make it circular
                      border: Border.all(
                        color: Colors.white,
                        width: 0.3,
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0), // Adjust the padding as needed
                        child: SvgPicture.asset(
                          'assets/images/plus.svg', // Replace with the actual path
                          width: 31.1, // Adjust the width as needed
                          height: 20, // Adjust the height as needed
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}






class CustomContainer extends StatefulWidget {
  @override
  _CustomContainerState createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  int number = 0;

  void incrementNumber() {
    setState(() {
      number++;
    });
  }

  void decrementNumber() {
    setState(() {
      if (number > 0) {
        number--;
      }
    });
  }
  int number1 = 0;

  void incrementNumber1() {
    setState(() {
      number1++;
    });
  }

  void decrementNumber1() {
    setState(() {
      if (number > 0) {
        number1--;
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    return Column(
    children:[
      Container(
      width: 378,
      height: 262,
      decoration: AppStyles.gradientBoxDecoration,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Text(
            Strings.custom_text,
            style: AppStyles.verySmallTextStyle,
          ),
        ),
      ),
    ),
      Container(
        width: 378,
        height: 131,
        decoration: AppStyles.darkBoxDecoration,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:15,bottom: 10,left: 40),
                child: Text(
                  Strings.duration1,
                  style: AppStyles.whiteMediumTextStyle,
                ),
              ),
              SizedBox(height: 15), // Add spacing between the text and the icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: decrementNumber,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppStyles.darkBoxDecoration.color, // Use appropriate color from your AppStyles
                        borderRadius: BorderRadius.circular(10), // Half of the width/height to make it circular
                        border: Border.all(
                          color: Colors.white,
                          width: 0.3,
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(6.0), // Adjust the padding as needed
                          child: SvgPicture.asset(
                            'assets/images/minuss.svg', // Replace with the actual path
                            width: 31.1, // Adjust the width as needed
                            height: 20, // Adjust the height as needed
                          ),
                        ),
                      ),
                    ),
                  ),

                  Text(
                    number.toString(),
                    style: AppStyles.largeMediumTextStyle,
                  ),

                  GestureDetector(
                    onTap: incrementNumber,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppStyles.darkBoxDecoration.color, // Use appropriate color from your AppStyles
                        borderRadius: BorderRadius.circular(10), // Half of the width/height to make it circular
                        border: Border.all(
                          color: Colors.white,
                          width: 0.3,
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0), // Adjust the padding as needed
                          child: SvgPicture.asset(
                            'assets/images/plus.svg', // Replace with the actual path
                            width: 31.1, // Adjust the width as needed
                            height: 20, // Adjust the height as needed
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Divider(height: 1,color: AppColor.inactiveColor,),
      Container(
        width: 378,
        height: 131,
        decoration: AppStyles.darkBoxDecoration,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:15,bottom: 10,left: 25),
                child: Text(
                  Strings.duration2,
                  style: AppStyles.whiteMediumTextStyle,
                ),
              ),
              SizedBox(height: 15), // Add spacing between the text and the icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: decrementNumber1,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppStyles.darkBoxDecoration.color, // Use appropriate color from your AppStyles
                        borderRadius: BorderRadius.circular(10), // Half of the width/height to make it circular
                        border: Border.all(
                          color: Colors.white,
                          width: 0.3,
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(6.0), // Adjust the padding as needed
                          child: SvgPicture.asset(
                            'assets/images/minuss.svg', // Replace with the actual path
                            width: 31.1, // Adjust the width as needed
                            height: 20, // Adjust the height as needed
                          ),
                        ),
                      ),
                    ),
                  ),

                  Text(
                    number1.toString(),
                    style: AppStyles.largeMediumTextStyle,
                  ),

                  GestureDetector(
                    onTap: incrementNumber1,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppStyles.darkBoxDecoration.color, // Use appropriate color from your AppStyles
                        borderRadius: BorderRadius.circular(10), // Half of the width/height to make it circular
                        border: Border.all(
                          color: Colors.white,
                          width: 0.3,
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0), // Adjust the padding as needed
                          child: SvgPicture.asset(
                            'assets/images/plus.svg', // Replace with the actual path
                            width: 31.1, // Adjust the width as needed
                            height: 20, // Adjust the height as needed
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
    );
  }
}
