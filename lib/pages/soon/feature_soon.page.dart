import 'package:flutter/material.dart';

class FeatureSoonPage extends StatelessWidget {
  const FeatureSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.engineering,size: 64,),
            SizedBox(height: 20,),
            Text("Still work in progress ...",style: TextStyle(
              fontSize: 16,
            ),)
          ],
        ),
      ),
    );
  }
}
