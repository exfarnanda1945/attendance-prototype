import 'package:attendance_prototype/widgets/picker/datepicker.dart';
import 'package:attendance_prototype/widgets/picker/timepicker.dart';
import 'package:flutter/material.dart';

class ManualAttendancePage extends StatefulWidget {
  const ManualAttendancePage({super.key});

  @override
  State<ManualAttendancePage> createState() => _ManualAttendancePageState();
}

class _ManualAttendancePageState extends State<ManualAttendancePage> {
  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
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
              height: 16,
            ),
            TimePickerText(
              value: now,
              hintText: "Please choose a time...",
              labelText: "Time",
              context: context,
              onSelectTime: (value) {
                final updateTime = DateTime(now.year, now.month, now.day,
                    value.hour, value.minute, value.second);
                setState(() {
                  now = updateTime;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
