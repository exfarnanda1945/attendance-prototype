import 'package:attendance_prototype/widgets/common/outlined_textfield.dart';
import 'package:attendance_prototype/widgets/picker/approval-type-picker.dart';
import 'package:attendance_prototype/widgets/picker/approver/approverpicker.dart';
import 'package:attendance_prototype/widgets/picker/datepicker.dart';
import 'package:attendance_prototype/widgets/picker/filepicker.dart';
import 'package:flutter/material.dart';

class OfwAddEditForm extends StatefulWidget {
  const OfwAddEditForm({super.key});

  @override
  State<OfwAddEditForm> createState() => _OfwAddEditFormState();
}

class _OfwAddEditFormState extends State<OfwAddEditForm> {
  String approvalType = "item 1";
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ApprovalTypePicker(
          value: approvalType,
          hintText: "Please choose a type...",
          labelText: "Type",
          context: context,
          onSelectType: (value) {},
        ),
        const SizedBox(
          height: 20,
        ),
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
        OutlinedTextField(
            maxLines: 5,
            labelText: "Reason",
            onChanged: (value) {},
            value: ""),
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
