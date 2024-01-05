import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hydur/ui/common_widget/time_picker.dart';
import 'package:hydur/ui/settings/setting_screens.dart';
import '../../utils/app_color.dart';
import '../../utils/app_styles.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';
import '../common_widget/custom_buttons.dart';
import '../common_widget/predefined_custom_containers.dart';
import '../secret/secret_garden.dart';

class PredefinedSettingsScreen extends StatefulWidget {
  const PredefinedSettingsScreen({super.key});

  @override
  _PredefinedSettingsScreenState createState() => _PredefinedSettingsScreenState();
}

class _PredefinedSettingsScreenState extends State<PredefinedSettingsScreen> {
  int intensityValue = 1; // Default intensity value
  TextEditingController intensityController = TextEditingController();
  List<bool> selectedDays = [false, false, false, false, false, false, false]; // Track selected days
  TimeOfDay startTime = const TimeOfDay(hour: 0, minute: 0);
  TimeOfDay endTime = const TimeOfDay(hour: 0, minute: 0);
  bool showPredefinedContainer = true;
  bool showCustomContainer = false;
  @override
  void dispose() {
    intensityController.dispose();
    super.dispose();
  }
  void updateSelectedDays(int index, bool isSelected) {
    setState(() {
      selectedDays[index] = isSelected;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Images.predefined_setting_background,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
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
                                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                                );
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
                              Strings.secret_garden,
                              style: AppStyles.headingTextStyle,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 69,
                        height: 32,
                        decoration: AppStyles.saveBoxDecoration,
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SecretGarden()),
                              );
                            },
                            child: Text(
                              Strings.save,
                              style: AppStyles.blackMediumTextStyle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 46), // Add spacing between the rows
                Container(
                  width: 378,
                  height: 30,
                  decoration: AppStyles.gradientBoxDecoration,
                  child: Center(
                    child: Text(
                      Strings.give_your_schedule_a_name_for_quick_referenc,
                      style: AppStyles.verySmallTextStyle,
                    ),
                  ),
                ),
                Container(
                  width: 378,
                  height: 42,
                  decoration: AppStyles.darkBoxDecoration,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          '${Strings.intensity}: $intensityValue',
                          style: AppStyles.whiteMediumTextStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: GestureDetector(
                          onTap: () {
                            // Handle SVG image tap to edit intensity value
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: AppColor.small_container_color,
                                  title: Text(
                                    Strings.intensity,
                                    style: AppStyles.whiteMediumTextStyle,
                                  ),
                                  content: TextFormField(
                                    cursorColor: Colors.white,
                                    controller: intensityController,
                                    keyboardType: TextInputType.number,
                                    style: AppStyles.whiteMediumTextStyle,
                                    onChanged: (value) {
                                      setState(() {
                                        intensityValue = int.tryParse(value) ?? 1;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      // Set the text form field color to white
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(color: AppColor.color_white),
                                      ),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(color: AppColor.color_white),
                                      ),
                                      hintStyle: AppStyles.whiteMediumTextStyle,
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        Strings.cancel,
                                        style: AppStyles.smalllightTextStyle,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          intensityValue =
                                              int.tryParse(intensityController.text) ?? 1;
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        Strings.ok,
                                        style: AppStyles.smalllightTextStyle,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: SvgPicture.asset(
                            Images.pen,
                            width: 18.2,
                            height: 18.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: 378,
                  height: 35,
                  decoration: AppStyles.gradientBoxDecoration,
                  child: Center(
                    child: Text(
                      Strings.click_on_the_days_you_want_this_schedule_to_run,
                      style: AppStyles.verySmallTextStyle,
                    ),
                  ),
                ),
                Container(
                  width: 378,
                  height: 100.2,
                  decoration: AppStyles.darkColorBoxDecoration,
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            _DaySelector("Mon", 0, selectedDays, updateSelectedDays),
                            SizedBox(width: 8), // Add spacing between days
                            _DaySelector("Tue", 1, selectedDays, updateSelectedDays),
                            SizedBox(width: 8), // Add spacing between days
                            _DaySelector("Wed", 2, selectedDays, updateSelectedDays),
                            SizedBox(width: 8), // Add spacing between days
                            _DaySelector("Thu", 3, selectedDays, updateSelectedDays),
                          ],
                        ),
                        const SizedBox(height: 8), // Spacing between the rows
                        Row(
                          children: [
                            _DaySelector("Fri", 4, selectedDays, updateSelectedDays),
                            SizedBox(width: 8), // Add spacing between days
                            _DaySelector("Sat", 5, selectedDays, updateSelectedDays),
                            SizedBox(width: 8), // Add spacing between days
                            _DaySelector("Sun", 6, selectedDays, updateSelectedDays),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  width: 378,
                  height: 48,
                  decoration: AppStyles.gradientBoxDecoration,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Strings.now_select_the_times,
                          style: AppStyles.verySmallTextStyle,
                        ),
                        Text(
                          Strings.want_the_diffusion_to_start_and_end,
                          style: AppStyles.verySmallTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                        width: 378,
                        height: 182.2,
                        decoration: AppStyles.darkBoxDecoration,
                        child: Row(
                          children: [
                            Expanded(
                              child: TimePickerContainer(
                                startTime: startTime,
                                endTime: endTime,
                                onStartTimeSelected: (selectedTime) {
                                  setState(() {
                                    startTime = selectedTime;
                                  });
                                  },
                                onEndTimeSelected: (selectedTime) {
                                  setState(() {
                                    endTime = selectedTime;
                                  });
                                  },
                              ),
                            ),
                          ],
                        ),
                      ),
                const SizedBox(height: 28),
                CustomPredefinedButton(
                  textStyle: AppStyles.whiteMediumTextStyle,
                  borderRadius: BorderRadius.circular(8),
                  predefinedText: 'Predefined',
                  customText: 'Custom',
                  onPredefinedPressed: () {
                    setState(() {
                      showPredefinedContainer = true;
                      showCustomContainer = false;
                    });
                    // Handle predefined button press
                  },
                  onCustomPressed: () {
                    setState(() {
                      showPredefinedContainer = false;
                      showCustomContainer = true;
                    });
                    // Handle custom button press
                  },
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                if (showPredefinedContainer)
                  PredefinedContainer(), // Show predefined container if selected

                if (showCustomContainer)
                  CustomContainer(),
                const SizedBox(height: 17),
              ],
            ),
          ),
          ), ],
      ),
    );
  }
}


class _DaySelector extends StatelessWidget {
  final String day;
  final int index;
  final List<bool> selectedDays;
  final Function(int, bool) onUpdate;

  const _DaySelector(this.day, this.index, this.selectedDays, this.onUpdate);

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedDays[index];
    final boxColor = isSelected ? AppColor.select_diffuser_color2 : AppColor.home_lounge;

    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      gradient: isSelected
          ? AppColor.b1b2Gradient
          : null, // No gradient for unselected days
      color: isSelected ? null : boxColor,
    );

    return GestureDetector(
      onTap: () {
        onUpdate(index, !isSelected);
      },
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



