import 'package:flutter/material.dart';
import 'add-edit-sick-form.dart';

class SickAddEditPage extends StatefulWidget {
  const SickAddEditPage({super.key});

  @override
  State<SickAddEditPage> createState() => _SickAddEditPageState();
}

class _SickAddEditPageState extends State<SickAddEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Sick Approval"),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          child: Column(
            children: [
              const AddEditSickForm(),
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
