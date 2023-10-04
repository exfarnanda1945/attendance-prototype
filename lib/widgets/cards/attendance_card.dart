import 'package:attendance_prototype/models/attendance/attendance_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendanceCard extends StatelessWidget {
  AttendanceCard({super.key, required this.attendanceItem});

  AttendanceModel attendanceItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMMEEEEd().format(attendanceItem.enter),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Enter at ${attendanceItem.enter.hour}:${attendanceItem.enter.minute}",style: const TextStyle(fontSize: 16),),
                Text(
                    "Out at ${attendanceItem.out == null ? "--" : "${attendanceItem.out?.hour}:${attendanceItem.out?.minute}"}",style: const TextStyle(fontSize: 16),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
