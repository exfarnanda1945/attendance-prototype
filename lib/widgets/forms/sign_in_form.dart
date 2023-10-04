import 'package:attendance_prototype/widgets/common/outlined_textfield.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatelessWidget {
  SignInForm({
    super.key,
    required this.email,
    required this.password,
    required this.onEmailChanged,
    required this.onPasswordChanged,
  });

  String email;
  String password;
  ValueChanged<String> onEmailChanged;
  ValueChanged<String> onPasswordChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding:
                const EdgeInsets.only(top: 16, bottom: 8, left: 32, right: 32),
            child: OutlinedTextField(
              value: email,
              labelText: "Email",
              onChanged: onEmailChanged,
              hintText: "Enter email here....",
              prefixIcon: Icons.email,
              validator: (email) => email != null && !EmailValidator.validate(email)
                  ? "Enter valid email"
                  : null,
            )),
        Padding(
          padding:
              const EdgeInsets.only(top: 8, bottom: 16, left: 32, right: 32),
          child: OutlinedTextField(
            value: password,
            labelText: "Password",
            onChanged: onPasswordChanged,
            fieldType: FieldType.password,
            hintText: "Enter password here....",
            prefixIcon: Icons.lock,
            validator: (password) => password != null && password.isEmpty
                ? "Password cannot be empty"
                : null,
          ),
        ),
      ],
    );
  }
}
