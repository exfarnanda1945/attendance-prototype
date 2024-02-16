import 'package:flutter/material.dart';

class ErrorMapsAttendance extends StatelessWidget {
  const ErrorMapsAttendance(
      {super.key, required this.onRefresh, required this.message});

  final VoidCallback onRefresh;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              message,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          ElevatedButton(onPressed: onRefresh, child: const Text("Refresh"))
        ],
      ),
    );
  }
}
