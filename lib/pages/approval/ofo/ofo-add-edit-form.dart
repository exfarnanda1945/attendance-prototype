import 'package:attendance_prototype/widgets/common/outlined_textfield.dart';
import 'package:attendance_prototype/widgets/picker/approver/approverpicker.dart';
import 'package:attendance_prototype/widgets/picker/datepicker.dart';
import 'package:attendance_prototype/widgets/picker/filepicker.dart';
import 'package:attendance_prototype/widgets/picker/timepicker.dart';
import 'package:flutter/material.dart';

class OfoAddEditForm extends StatefulWidget {
  const OfoAddEditForm({super.key});

  @override
  State<OfoAddEditForm> createState() => _OfoAddEditFormState();
}

class _OfoAddEditFormState extends State<OfoAddEditForm> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DatePicker(
          value: startDate,
          hintText: "Please choose a start date...",
          labelText: "Start date",
          context: context,
          onSelectDate: (date) {
            setState(() {
              startDate = date;
            });
          },
        ),
        const SizedBox(
          height: 20,
        ),
        TimePicker(
          value: startDate,
          hintText: "Please choose a time...",
          labelText: "Start Time",
          context: context,
          onSelectTime: (value) {
            setState(() {
              startDate = value;
            });
          },
        ),
        const SizedBox(
          height: 20,
        ),
        DatePicker(
          value: endDate,
          hintText: "Please choose a end date...",
          labelText: "End date",
          context: context,
          onSelectDate: (date) {
            setState(() {
              endDate = date;
            });
          },
        ),
        const SizedBox(
          height: 20,
        ),
        TimePicker(
          value: endDate,
          hintText: "Please choose a time...",
          labelText: "End Time",
          context: context,
          onSelectTime: (value) {
            setState(() {
              endDate = value;
            });
          },
        ),
        const SizedBox(
          height: 20,
        ),
        OutlinedTextField(
            maxLines: 5, labelText: "Reason", onChanged: (value) {}, value: ""),
        const SizedBox(
          height: 20,
        ),
        const FilePicker(),
        const SizedBox(
          height: 20,
        ),
        const ApproverPicker()
      ],
    );
  }
}
