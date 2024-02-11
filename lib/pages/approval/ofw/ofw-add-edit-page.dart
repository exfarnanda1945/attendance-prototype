import 'package:attendance_prototype/pages/approval/ofw/ofw-add-edit-form.dart';
import 'package:flutter/material.dart';

class OfwAddEditPage extends StatelessWidget {
  const OfwAddEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Out From Work Approval"),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          child: Column(
            children: [
              const OfwAddEditForm(),
              const SizedBox(height: 16,),
              ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Add"))
            ],
          ),
        ),
      ),
    );
  }
}
