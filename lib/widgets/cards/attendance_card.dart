import 'package:attendance_prototype/models/attendance/attendance_model.dart';
import 'package:attendance_prototype/widgets/cards/attendance_card_detail.dart';
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
              DateFormat.yMMMMEEEEd().format(attendanceItem.enter.time),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 8,
            ),
            AttendanceCardDetail(
                attendanceDetailItem: attendanceItem.enter, isEnter: true),
            attendanceItem.exit != null
                ? AttendanceCardDetail(
                    attendanceDetailItem: attendanceItem.exit!,
                    isEnter: false,
                  )
                : const Text("")
          ],
        ),
      ),
    );
  }
}
