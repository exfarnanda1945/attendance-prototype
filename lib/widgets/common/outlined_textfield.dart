import 'package:flutter/material.dart';

class OutlinedTextField extends StatefulWidget {
  OutlinedTextField({
    super.key,
    required this.labelText,
    required this.onChanged,
    required this.value,
    this.fieldType,
    this.hintText,
    this.prefixIcon,
    this.validator,
    this.maxLines,
  });

  int? maxLines;
  final String value;
  final String labelText;
  final ValueChanged<String> onChanged;
  String? hintText;
  IconData? prefixIcon;
  FieldType? fieldType = FieldType.regular;
  String? Function(String?)? validator;

  @override
  State<OutlinedTextField> createState() => _OutlinedTextFieldState();
}

class _OutlinedTextFieldState extends State<OutlinedTextField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines ?? 1,
      initialValue: widget.value,
      onChanged: widget.onChanged,
      obscureText: widget.fieldType == FieldType.password && !showPassword,
      validator: widget.validator,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        alignLabelWithHint: true,
          prefixIcon:
              widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
          suffixIcon: widget.fieldType == FieldType.password
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(
                      showPassword ? Icons.visibility : Icons.visibility_off))
              : null,
          border: const OutlineInputBorder(),
          hintText: widget.hintText,
          labelText: widget.labelText),
    );
  }
}

enum FieldType { regular, password, number }
