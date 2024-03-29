import 'package:attendance_prototype/widgets/appbar/custom-app-bar.dart';
import 'package:attendance_prototype/widgets/common/outlined_textfield.dart';
import 'package:attendance_prototype/widgets/picker/approver/approverpicker.dart';
import 'package:attendance_prototype/widgets/picker/datepicker.dart';
import 'package:attendance_prototype/widgets/picker/timepicker.dart';
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
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(
        title: "Manual Attendance",
        useArrowBack: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
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
                value: now,
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
              const ApproverPicker(),
              const SizedBox(
                height: 10
              ),
              ElevatedButton(style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
              ),onPressed: () {}, child: const Text("Add"))
            ],
          ),
        ),
      ),
    );
  }
}
