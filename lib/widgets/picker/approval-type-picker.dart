import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ApprovalTypePicker extends StatelessWidget {
  const ApprovalTypePicker(
      {super.key,
      required this.value,
      required this.hintText,
      required this.labelText,
      required this.context,
      required this.onSelectType,
      this.validator});

  final String value;
  final String hintText;
  final String labelText;
  final BuildContext context;
  final ValueChanged<String> onSelectType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const Key(""),
      maxLines: 1,
      validator: validator,
      onTap: () => callTypePicker(),
      readOnly: true,
      initialValue: "",
      decoration: InputDecoration(
          suffixIcon: const Icon(Icons.arrow_forward_ios),
          border: const OutlineInputBorder(),
          hintText: hintText,
          labelText: labelText),
    );
  }

  callTypePicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 250,
          child: ListWheelScrollView(
              itemExtent: 42,
              children: ["Item 1", "Item 2", "Item 3", "Item 4","Item 1", "Item 2", "Item 3", "Item 4"]
                  .map((e) => GestureDetector(
                        child: Text(e),
                        onTap: () {
                          context.pop();
                        },
                      ))
                  .toList()),
        );
      },
    );
  }
}
