import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydur/utils/app_styles.dart';

import '../../utils/app_color.dart';

class TimePickerContainer extends StatelessWidget {
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final Function(TimeOfDay) onStartTimeSelected;
  final Function(TimeOfDay) onEndTimeSelected;

  const TimePickerContainer({
    required this.startTime,
    required this.endTime,
    required this.onStartTimeSelected,
    required this.onEndTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 378,
      height: 182.2,
      decoration: BoxDecoration(
        color: AppColor.small_container_color, // Green color
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildTimePickerColumn("Start Time", startTime, onStartTimeSelected),
          ),
          Expanded(
            child: _buildTimePickerColumn("End Time", endTime, onEndTimeSelected),
          ),
        ],
      ),
    );
  }

  Widget _buildTimePickerColumn(
      String title,
      TimeOfDay initialTime,
      Function(TimeOfDay) onTimeSelected,
      ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20),
          child: Text(
            title,
            style: AppStyles.whiteMediumTextStyle,
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: Row(
            children: [
              _buildTimePickerWheel(
                'hours',
                initialTime.hour % 12,
                    (value) {
                  final selectedTimeOfDay = TimeOfDay(
                    hour: value,
                    minute: initialTime.minute,
                  );
                  onTimeSelected(selectedTimeOfDay);
                },
              ),
              _buildTimePickerWheel(
                'minutes',
                initialTime.minute,
                    (value) {
                  final selectedTimeOfDay = TimeOfDay(
                    hour: initialTime.hour % 12,
                    minute: value,
                  );
                  onTimeSelected(selectedTimeOfDay);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimePickerWheel(
      String type,
      int initialValue,
      Function(int) onValueChanged,
      ) {
    final int maxItemCount = type == 'hours' ? 12 : 60;
    final FixedExtentScrollController scrollController = FixedExtentScrollController(initialItem: initialValue);

    return Expanded(
      child: CupertinoPicker.builder(
        scrollController: scrollController,
        itemExtent: 40.0,
        onSelectedItemChanged: (selectedIndex) {
          final adjustedIndex = selectedIndex % maxItemCount;
          onValueChanged(adjustedIndex + 1);
        },
        itemBuilder: (BuildContext context, int index) {
          final displayValue = (index % maxItemCount) + 1;
          final valueText = type == 'hours' ? displayValue.toString() : displayValue.toString().padLeft(2, '0');
          return Center(
            child: Text(
              valueText,
              style: AppStyles.whiteMediumTextStyle,
            ),
          );
        },
      ),
    );
  }



}