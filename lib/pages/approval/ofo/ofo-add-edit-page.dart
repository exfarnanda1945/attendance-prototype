import 'package:attendance_prototype/pages/approval/ofo/ofo-add-edit-form.dart';
import 'package:flutter/material.dart';

class OfoAddEditPage extends StatelessWidget {
  const OfoAddEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Out From Office Approval"),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          child: Column(
            children: [
              const OfoAddEditForm(),
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
    );;
  }
}
