import 'package:attendance_prototype/models/user/user_model.dart';
import 'package:attendance_prototype/models/user_login/user_login_model.dart';
import 'package:attendance_prototype/utils/boxes.dart';
import 'package:attendance_prototype/widgets/buttons/primary-button.dart';
import 'package:attendance_prototype/widgets/forms/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
                "Sign In",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: SignInForm(
                email: email,
                password: password,
                onEmailChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                onPasswordChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            PrimaryButton(
              title: "Login",
              onPressed: login,
              width: 190,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "don't have account yet ? ",
                  style: TextStyle(fontSize: 15),
                ),
                GestureDetector(
                  onTap: () => context.push('/signUp'),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  login() {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      List<UserModel> users = Boxes.getUserBox()
          .values
          .where((element) =>
              element.email == email && element.password == password)
          .toList();

      if (users.isEmpty) {
        Fluttertoast.showToast(msg: "Login Failed");
      }

      try {
        UserModel user = users[0];
        Boxes.getUserLoginBox().add(
            UserLoginModel(email: user.email, name: user.name, id: user.id));
        Fluttertoast.showToast(msg: "Welcome ${user.name}");
        context.go('/main');
      } catch (e) {
        Fluttertoast.showToast(
            msg: "Something went wrong, please try again...");
      }
    }
  }
}
