import 'package:flutter/material.dart';

class SickPage extends StatelessWidget {
  const SickPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              buildCounterCard("Total", 32),
            ],
          )
        ],
      ),
    );
  }

  Widget buildCounterCard(String title, int count) => Column(

        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          )
        ],
      );
}
