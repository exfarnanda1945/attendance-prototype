import 'package:attendance_prototype/models/base/attendance_detail/attendance_detail_base.dart';
import 'package:attendance_prototype/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class AttendanceCardDetail extends StatelessWidget {
  AttendanceCardDetail(
      {super.key, required this.attendanceDetailItem, required this.isEnter});

  AttendanceDetailBase attendanceDetailItem;
  bool isEnter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          color: isEnter ? CustomColors.greenAccent : CustomColors.redAccent,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${isEnter ? "Enter" : "Exit"} at ${attendanceDetailItem.time.hour}:${attendanceDetailItem.time.minute}",
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w600),
                ),
                Text(
                  "LatLong (${attendanceDetailItem.location.lat}, ${attendanceDetailItem.location.long})",
                  style: const TextStyle(fontSize: 12),
                ),
                Text(
                  "SSID: ${attendanceDetailItem.network.name}",
                  style: const TextStyle(fontSize: 12),
                ),
                Text(
                  "Ip Address: ${attendanceDetailItem.network.ip}",
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
