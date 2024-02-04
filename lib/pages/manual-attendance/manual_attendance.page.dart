import 'package:attendance_prototype/widgets/common/outlined_textfield.dart';
import 'package:attendance_prototype/widgets/picker/approver/approverpicker.dart';
import 'package:attendance_prototype/widgets/picker/datepicker.dart';
import 'package:attendance_prototype/widgets/picker/timepicker.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/material.dart';

class ManualAttendancePage extends StatefulWidget {
  const ManualAttendancePage({super.key});

  @override
  State<ManualAttendancePage> createState() => _ManualAttendancePageState();
}

class _ManualAttendancePageState extends State<ManualAttendancePage> {
  late DateTime now;

  @override
  void initState() {
    super.initState();
    now = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manual Attendance"),
        leading: const Icon(Icons.arrow_back),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Column(
          children: [
            DatePicker(
              value: now,
              hintText: "Please choose a date...",
              labelText: "Choose date",
              context: context,
              onSelectDate: (date) {
                setState(() {
                  now = date;
                });
              },
            ),
            const SizedBox(
              height: 28,
            ),
            TimePicker(
              value: TimeOfDay.fromDateTime(now),
              hintText: "Please choose a time...",
              labelText: "Time",
              context: context,
              onSelectTime: (value) {
                setState(() {
                  now = value;
                });
              },
            ),
            const SizedBox(
              height: 28,
            ),
            OutlinedTextField(
                maxLines: 5,
                labelText: "Reason",
                onChanged: (value) {},
                value: ""),
            const SizedBox(
              height: 28,
            ),
            const ApproverPicker()
          ],
        ),
      ),
    );
  }
}
