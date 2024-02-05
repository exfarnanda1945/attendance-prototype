import 'package:attendance_prototype/models/approver/approver_model.dart';
import 'package:attendance_prototype/widgets/common/outlined_textfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ApproverPicker extends StatelessWidget {
  const ApproverPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Approver",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
        const SizedBox(
          height: 14,
        ),
        ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isDismissible: false,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                builder: (context) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 16, left: 10, right: 10, bottom: 10),
                          child: OutlinedTextField(
                              labelText: "Approver",
                              prefixIcon: Icons.search,
                              onChanged: (value) {},
                              value: ""),
                        ),
                        SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: ListView.builder(
                            itemCount: listApprovers.length,
                            itemBuilder: (context, index) {
                              final approver = listApprovers[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(approver.name),
                                    Checkbox(
                                      value: true,
                                      onChanged: (value) {},
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    context.pop();
                                  },
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  )),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text(
                                  "Confirm",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            },
            child: const Text("Add Approver")),
        const SizedBox(
          height: 14,
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) {
            return const Card(
              child: ListTile(
                title: Text(
                  "Miko",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                trailing: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                subtitle: Text(
                  "Code: HR01",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
