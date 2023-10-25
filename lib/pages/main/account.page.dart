import 'package:attendance_prototype/models/user_login/user_login_model.dart';
import 'package:attendance_prototype/utils/boxes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key, required this.user});
  UserLoginModel user;

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
          OutlinedButton(
              onPressed: () => logout(context),
              style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Theme.of(context).primaryColor)),
              child: const Text("Sign Out"))
        ],
      ),
    );
  }

  logout(BuildContext context) {
    Boxes.getUserLoginBox().clear();
    context.go('/signIn');
  }
}
