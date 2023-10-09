import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AttendancePage extends StatefulWidget {
  AttendancePage({super.key, required this.userId, this.isUserClickIn});

  String userId;
  bool? isUserClickIn;

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
                "UserId => ${widget.userId} and isUserClickIn => ${widget.isUserClickIn.toString()}"),
            ElevatedButton(
                onPressed: () {
                  context.pop(true);
                },
                child: const Text("Close"))
          ],
        ),
      ),
    );
  }
}
