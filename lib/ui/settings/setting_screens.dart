import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hydur/ui/settings/predefined_settings.dart';

import '../../utils/app_color.dart';
import '../../utils/app_styles.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';
import '../common_widget/custom_day_selector.dart';
import '../common_widget/flutter_advanced_switch.dart';
import '../secret/secret_garden.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int intensityValue = 1; // Default intensity value
  TextEditingController intensityController = TextEditingController();
  final items = List<String>.generate(10, (i) => 'Item ${i + 1}');
  final _controller = ValueNotifier<bool>(true);

  @override
  void dispose() {
    intensityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Images.setting_screen_background,
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
                                    MaterialPageRoute(builder: (context) => SecretGarden()),
                                  ); // Define your route or action for the first container
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
                                ); // Define your route or action for the first container
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
                    height: 138,
                    decoration: AppStyles.gradientBoxDecoration,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            Strings.diffusion_schedule,
                            style: AppStyles.mediumLightTextStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            Strings.manage_the_diffusion_schedule,
                            style: AppStyles.verySmallTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 500,
                    padding: EdgeInsets.only(bottom: 50),
                    child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return Dismissible(
                            background: Container(
                              padding: EdgeInsets.only(right: 20),
                              decoration: const BoxDecoration(
                                color: AppColor.darkRedColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Delete",
                                    style: AppStyles.mediumBoldTextStyle,
                                  ),
                                ],
                              ),
                            ),
                            direction: DismissDirection.endToStart,
                            key: Key(item),
                            child: Container(
                              margin: const EdgeInsets.only(top: 15),
                              child: Column(
                                children: [
                                  Container(
                                    width: 378,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color:
                                          AppColor.home_lounge.withOpacity(0.5),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Text(
                                            '${Strings.intensity}: $intensityValue',
                                            style:
                                                AppStyles.whiteMediumTextStyle,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 20),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Start: ',
                                                style: AppStyles.greyTextStyle,
                                              ),
                                              Text(
                                                '00:00',
                                                style: AppStyles
                                                    .smalllightTextStyle, // Define the different text style
                                              ),
                                              const SizedBox(width: 10),
                                              // Add spacing between "Start" and "End"
                                              Text(
                                                'End: ',
                                                style: AppStyles.greyTextStyle,
                                              ),
                                              Text(
                                                '23:59',
                                                style: AppStyles
                                                    .smalllightTextStyle, // Define the different text style
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.9,
                                    height: 142.3,
                                    decoration: BoxDecoration(
                                      color: AppColor.set_about.withOpacity(0.2),
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 14, top: 10, right: 20),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                Strings.repeat,
                                                style: AppStyles.greyTextStyle,
                                              ),
                                              AdvancedSwitch(
                                                controller: _controller,
                                                activeColor: Colors.green,
                                                inactiveColor: Colors.grey,
                                                borderRadius: const BorderRadius.all(Radius.circular(15)),
                                                width: 40.0,
                                                height: 20.0,
                                                enabled: true,
                                                disabledOpacity: 0.5,
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: MediaQuery.of(context).size.width * 0.03,
                                          ),
                                          child: Row(
                                            children: [
                                              Wrap(
                                                alignment: WrapAlignment.start,
                                                spacing: 8,
                                                children: [
                                                  CustomDaySelector(day: 'Mon', isSelected: true, onPressed: () {}),
                                                  CustomDaySelector(day: 'Tue', isSelected: false, onPressed: () {}),
                                                  CustomDaySelector(day: 'Wed', isSelected: true, onPressed: () {}),
                                                  CustomDaySelector(day: 'Thu', isSelected: false, onPressed: () {}),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: MediaQuery.of(context).size.width * 0.03,
                                          ),
                                          child: Row(
                                            children: [
                                              Wrap(
                                                alignment: WrapAlignment.start,
                                                spacing: 8,
                                                children: [
                                                  CustomDaySelector(day: 'Fri', isSelected: true, onPressed: () {}),
                                                  CustomDaySelector(day: 'Sat', isSelected: true, onPressed: () {}),
                                                  CustomDaySelector(day: 'Sun', isSelected: false, onPressed: () {}),
                                                  Container(
                                                    padding: EdgeInsets.only(top:18,left: 50),
                                                  child:SvgPicture.asset(
                                                    Images.arrows,
                                                    width: 14.2,
                                                    height: 14.4,
                                                  ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 52,
        height: 52,
        child: FloatingActionButton(
          onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PredefinedSettingsScreen()),
              ); // Define your route or action for the first container

          },
          backgroundColor: Colors.transparent, // Set transparent background
          child: Container(
            width: 52,
            height: 52,
            decoration: AppStyles.circleBoxDecoration,
            child: const Center(
              child: Icon(
                Icons.add,
                size: 24,
                color: AppColor.color_white,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
