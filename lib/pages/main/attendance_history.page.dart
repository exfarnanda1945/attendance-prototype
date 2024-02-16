import 'package:attendance_prototype/models/attendance/attendance_model.dart';
import 'package:attendance_prototype/models/user_login/user_login_model.dart';
import 'package:attendance_prototype/utils/boxes.dart';
import 'package:attendance_prototype/widgets/cards/attendance_card.dart';
import 'package:flutter/material.dart';

class AttendanceHistoryPage extends StatelessWidget {
  const AttendanceHistoryPage({super.key, required this.userLogin});

 final UserLoginModel userLogin;

  @override
  Widget build(BuildContext context) {
    final List<AttendanceModel> attendanceList = Boxes.getAttendanceBox()
        .values
        .where((element) => element.userId == userLogin.id)
        .toList();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: attendanceList.isEmpty
          ? const Center(
              child: Text("No Data Here,"),
            )
          : ListView.builder(
              itemCount: attendanceList.length,
              itemBuilder: (context, index) => AttendanceCard(
                attendanceItem: attendanceList[index],
              ),
            ),
    );
  }
}
