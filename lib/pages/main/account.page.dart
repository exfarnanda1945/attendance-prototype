import 'package:attendance_prototype/models/user_login/user_login_model.dart';
import 'package:attendance_prototype/utils/boxes.dart';
import 'package:attendance_prototype/widgets/buttons/primary-button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key, required this.user});

  final UserLoginModel user;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              user.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
          PrimaryButton(
              title: "Sign Out", width: 180, onPressed: () => logout(context))
        ],
      ),
    );
  }

  logout(BuildContext context) {
    Boxes.getUserLoginBox().clear();
    context.go('/signIn');
  }
}
