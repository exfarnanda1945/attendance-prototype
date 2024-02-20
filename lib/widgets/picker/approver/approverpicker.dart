import 'package:attendance_prototype/models/approver/approver_model.dart';
import 'package:attendance_prototype/widgets/buttons/primary-button.dart';
import 'package:attendance_prototype/widgets/common/outlined_textfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ApproverPicker extends StatefulWidget {
  const ApproverPicker({super.key});

  @override
  State<ApproverPicker> createState() => _ApproverPickerState();
}

class _ApproverPickerState extends State<ApproverPicker> {
  late List<ApproverModel> selectedApprover;

  @override
  void initState() {
    super.initState();
    selectedApprover = [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Approver",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            PrimaryButton(
                textStyle: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.normal),
                width: 150,
                height: 30,
                onPressed: () {
                  showApproverModal(context);
                },
                title: "Add Approver"),
          ],
        ),
        const SizedBox(
          height: 14,
        ),
        const SizedBox(
          height: 14,
        ),
        selectedApprover.isNotEmpty ?
        ListView.builder(
          shrinkWrap: true,
          itemCount: selectedApprover.length,
          itemBuilder: (context, index) {
            final item =selectedApprover[index];
            return  Card(
              child: ListTile(
                title: Text(
                  item.name,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                trailing: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                subtitle: Text(
                  "Code: ${item.name}",
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
              ),
            );
          },
        ) : const Text(""),
      ],
    );
  }

  void showApproverModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
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
                          vertical: 6, horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(approver.name),
                          Checkbox(
                            value: selectedApprover.contains(approver),
                            onChanged: (value) {
                              selectedApprover.add(approver);
                              // final List<ApproverModel> x = [];
                              // x.add(approver);
                              // setState(() {
                              //   selectedApprover = x;
                              // });
                            },
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: const Text(
                      "Cancel",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    )),
              )
            ],
          ),
        );
      },
    );
  }
}
