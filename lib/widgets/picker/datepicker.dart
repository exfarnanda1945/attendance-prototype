import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatelessWidget {
  const DatePicker(
      {super.key,
      required this.value,
      required this.hintText,
      required this.labelText,
      required this.context,
      required this.onSelectDate,
      this.validator});

  final DateTime value;
  final String hintText;
  final String labelText;
  final BuildContext context;
  final ValueChanged<DateTime> onSelectDate;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: Key(DateFormat.yMMMEd().format(value)),
      maxLines: 1,
      validator: validator,
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return CalendarDatePicker2(
              config: CalendarDatePicker2WithActionButtonsConfig(),
              value: [value],
              onValueChanged: (dates) {
                if (dates.isNotEmpty) {
                  onSelectDate(dates.first!);
                }
              },
            );
          },
        );
      },
      readOnly: true,
      initialValue: DateFormat.yMMMEd().format(value),
      decoration: InputDecoration(
          suffixIcon: const Icon(Icons.arrow_forward_ios),
          border: const OutlineInputBorder(),
          hintText: hintText,
          labelText: labelText),
    );
  }
}
