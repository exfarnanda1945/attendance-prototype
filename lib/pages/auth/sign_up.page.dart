import 'package:attendance_prototype/models/user/user_model.dart';
import 'package:attendance_prototype/utils/boxes.dart';
import 'package:attendance_prototype/widgets/forms/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String name = "";
  String email = "";
  String password = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: SignUpForm(
                  name: name,
                  email: email,
                  password: password,
                  onNameChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  onEmailChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  onPasswordChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  }),
            ),
            ElevatedButton(
              onPressed: registerUser,
              child: const Text(
                'Create Account',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account ? ",
                  style: TextStyle(fontSize: 15),
                ),
                GestureDetector(
                  onTap: () => context.pop(),
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Theme.of(context).primaryColor),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  registerUser() {
    final isValidate = _formKey.currentState!.validate();

    if (isValidate) {
      try {
        Boxes.getUserBox().add(UserModel(
            id: uuid.v4(), name: name, email: email, password: password));
        Fluttertoast.showToast(
          msg: "Register successfully, please login",
        );
        context.pop();
      } catch (e) {
        Fluttertoast.showToast(
          msg: "Failed to register...",
        );
      }
    }
  }
}
