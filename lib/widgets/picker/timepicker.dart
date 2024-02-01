import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:time_picker_wheel/time_picker_wheel.dart';

class TimePickerText extends StatelessWidget {
  const TimePickerText(
      {super.key,
      required this.value,
      required this.hintText,
      required this.labelText,
      required this.context,
      required this.onSelectTime,
      this.validator});

  final DateTime value;
  final String hintText;
  final String labelText;
  final BuildContext context;
  final ValueChanged<DateTime> onSelectTime;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: Key(DateFormat('kk:mm').format(value)),
      maxLines: 1,
      validator: validator,
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return TimePicker(
                onChange: (timeOfDay) {},
                options: TimePickerOptions.byDefault(
                  height: 200,
                  itemExtent: 30,
                  diameterRatio: 1,
                  selectedRowHeight: 70,
                  fontOpacity: 1,
                  fontColor: Colors.purple,
                  labelSize: 25,
                  numberSize: 25,
                  amPmSize: 15,
                  amPmWidth: 25,
                  wheelWidth: 50,
                  selectedRowHorizontalPadding: double.maxFinite,
                  selectedRowHorizontalBorderRadius: 0,
                  selectedRowForegroundColor: Colors.black,
                  selectedRowBackgroundColor: Colors.amber,
                ),
              );
            });
      },
      readOnly: true,
      decoration: InputDecoration(
          suffixIcon: const Icon(Icons.arrow_forward_ios),
          border: const OutlineInputBorder(),
          hintText: hintText,
          labelText: labelText),
    );
  }
}
