import 'package:attendance_prototype/models/attendance/attendance_model.dart';
import 'package:attendance_prototype/pages/boxes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AttendanceModel? latestUserAttendance;

  @override
  void initState() {
    super.initState();
    refreshAttendance();
  }

  @override
  Widget build(BuildContext context) {
    final isFinishToday = isUserClickInToday() && isUserClickOutToday();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          DateFormat.yMMMMEEEEd().format(DateTime.now()),
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        const SizedBox(
          height: 80,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Text(
                  "Enter",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                    isUserClickInToday()
                        ? "${latestUserAttendance?.enter.time.hour}:${latestUserAttendance?.enter.time.minute}"
                        : "--",
                    style: const TextStyle(fontSize: 18))
              ],
            ),
            Column(
              children: [
                const Text("Out",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                Text(
                    isUserClickOutToday()
                        ? "${latestUserAttendance?.exit?.time?.hour}:${latestUserAttendance?.exit?.time?.minute}"
                        : "--",
                    style: const TextStyle(fontSize: 18))
              ],
            )
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        !isFinishToday
            ? ElevatedButton(
                onPressed: () => isFinishToday ? null : upsertAttendance(),
                child: buildTextBtn())
            : const Text(""),
      ],
    );
  }

  AttendanceModel? getLatestAttendanceUser() {
    final getUserLogin = Boxes.getUserLoginBox().values.first;
    final getAttendances = Boxes.getAttendanceBox()
        .values
        .where((element) => element.userId == getUserLogin.id);

    if (getAttendances.isEmpty) {
      return null;
    }

    return getAttendances.toList().reversed.first;
  }

  Widget buildTextBtn() {
    String text = "";

    if (isUserClickInToday()) {
      text = "Click Out";
    }

    if (!isUserClickInToday() || isUserClickOutToday()) {
      text = "Click In";
    }

    return Text(text);
  }

  upsertAttendance() async {
    final userLogin = Boxes.getUserLoginBox().values.first;
    bool isUserClickIn = false;

    if (!isUserClickInToday()) {
      isUserClickIn = true;
    }

    if (isUserClickInToday() && !isUserClickOutToday()) {
      isUserClickIn = false;
    }

    final Map<String, String> params = {
      "userId": userLogin.id,
      "isUserClickIn": isUserClickIn.toString()
    };

    final result =
        await context.pushNamed<bool>("attendance", pathParameters: params);

    if (result == true) {
      refreshAttendance();
    }
  }

  // void updateAttendance() async {
  //   final isModelExist = Boxes.getAttendanceBox()
  //       .values
  //       .toList()
  //       .where((element) => element.id == latestUserAttendance?.id);

  //   if (isModelExist.isNotEmpty) {
  //     latestUserAttendance?.out = DateTime.now();
  //     await latestUserAttendance?.save();
  //     Fluttertoast.showToast(msg: "Click out successfully");
  //     refreshAttendance();
  //   }
  // }

  // void addAttendance(UserLoginModel userLogin) {
  //   Boxes.getAttendanceBox().add(AttendanceModel(
  //       userId: userLogin.id, enter: DateTime.now(), id: uuid.v4(), out: null));
  //   Fluttertoast.showToast(msg: "Click in successfully");
  //   refreshAttendance();
  // }

  refreshAttendance() {
    setState(() {
      latestUserAttendance = getLatestAttendanceUser();
    });
    Fluttertoast.showToast(msg: "yeay");
  }

  bool isUserClickInToday() {
    return latestUserAttendance != null &&
        DateUtils.isSameDay(latestUserAttendance?.enter.time, DateTime.now());
  }

  bool isUserClickOutToday() {
    return latestUserAttendance != null &&
        DateUtils.isSameDay(latestUserAttendance?.exit?.time, DateTime.now());
  }
}
