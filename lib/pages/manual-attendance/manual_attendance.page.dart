import 'package:attendance_prototype/widgets/picker/datepicker.dart';
import 'package:flutter/material.dart';

class ManualAttendancePage extends StatefulWidget {
  const ManualAttendancePage({super.key});

  @override
  State<ManualAttendancePage> createState() => _ManualAttendancePageState();
}

class _ManualAttendancePageState extends State<ManualAttendancePage> {
  final DateTime now = DateTime.now();

  late DateTime selectedDate;
  TimeOfDay initialEnterTime = const TimeOfDay(hour: 9, minute: 0);
  TimeOfDay initialExitTime = const TimeOfDay(hour: 17, minute: 0);

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime(2024, 1, 28);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DatePicker(
              value: selectedDate,
              hintText: "Please choose a date...",
              labelText: "Choose date",
              context: context,
              onSelectDate: (date) {
                setState(() {
                  selectedDate = date;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
