import 'package:bottom_picker/bottom_picker.dart';
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
      onTap: () => callDatePicker(),
      readOnly: true,
      initialValue: DateFormat.yMMMEd().format(value),
      decoration: InputDecoration(
          suffixIcon: const Icon(Icons.arrow_forward_ios),
          border: const OutlineInputBorder(),
          hintText: hintText,
          labelText: labelText),
    );
  }

  callDatePicker() {
    BottomPicker.date(
      title: 'Please choose a date',
      titleStyle: const TextStyle(
        fontSize: 15,
        color: Colors.black,
      ),
      displaySubmitButton: true,
      onSubmit: (date) {
        onSelectDate(date);
      },
      buttonStyle: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      initialDateTime: value,
    ).show(context);
  }
}
