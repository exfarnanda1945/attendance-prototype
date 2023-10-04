import 'package:attendance_prototype/widgets/common/outlined_textfield.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm(
      {super.key,
      required this.name,
      required this.email,
      required this.password,
      required this.onNameChanged,
      required this.onEmailChanged,
      required this.onPasswordChanged});

  String name;
  String email;
  String password;
  ValueChanged<String> onNameChanged;
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
            value: name,
            labelText: "Name",
            onChanged: onNameChanged,
            hintText: "Enter name here....",
            prefixIcon: Icons.person,
            validator: (name) => name != null && name.isEmpty
                ? "Name cannot be empty"
                : null,
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 8, bottom: 16, left: 32, right: 32),
          child: OutlinedTextField(
            value: email,
            labelText: "Email",
            onChanged: onEmailChanged,
            hintText: "Enter email here....",
            prefixIcon: Icons.email,
            validator: (email) => email != null && !EmailValidator.validate(email)
                ? "Enter valid email"
                : null,
          ),
        ),
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
            validator: (password){
              if(password != null && password.isEmpty){
                return "Password cannot be empty";
              }

              if(password != null && password.length < 6){
                return "Password must be at least 6 character";
              }

              if(password != null && password.length < 6){
                return "Password must be at least 6 character";
              }

              if(password != null && !password.contains(RegExp(r'[0-9]'))){
                return "Password must be contain number";
              }

              if(password != null && !password.contains(RegExp(r'[A-Z]'))){
                return "Password must be contain uppercase";
              }

              return null;
            }
          ),
        ),
      ],
    );
  }
}
