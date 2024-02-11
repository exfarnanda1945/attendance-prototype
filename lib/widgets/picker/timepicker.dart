import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatelessWidget {
  const TimePicker(
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
      key: Key(timeStr()),
      maxLines: 1,
      validator: validator,
      onTap: () => callTimePicker(),
      readOnly: true,
      initialValue: timeStr(),
      decoration: InputDecoration(
          suffixIcon: const Icon(Icons.arrow_forward_ios),
          border: const OutlineInputBorder(),
          hintText: hintText,
          labelText: labelText),
    );
  }

  String timeStr() {
    final hour =
        value.hour.toString().length == 1 ? "0${value.hour}" : value.hour;
    final minute =
        value.minute.toString().length == 1 ? "0${value.minute}" : value.minute;
    return "$hour:$minute";
  }

  callTimePicker() {
    BottomPicker.time(
      title: 'Please choose a date',
      titleStyle: const TextStyle(
        fontSize: 15,
        color: Colors.black,
      ),
      onSubmit: (date) {
        final selectedDate = date as DateTime;
        onSelectTime(DateTime(value.year, value.month, value.day,
            selectedDate.hour, selectedDate.month));
      },
      iconColor: Colors.transparent,
      buttonText: "Confirm",
      buttonSingleColor: Colors.transparent,
      buttonTextStyle:
          const TextStyle(color: Colors.purple, fontWeight: FontWeight.w600),
      initialTime: Time(hours: value.hour, minutes: value.minute),
    ).show(context);
  }
}
