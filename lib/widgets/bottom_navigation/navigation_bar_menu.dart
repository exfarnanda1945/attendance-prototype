import 'package:flutter/material.dart';

class NavigationBarMenu {
  final String id;
  final String title;
  final IconData icon;
  final IconData iconWhenSelected;

  NavigationBarMenu(this.title, this.icon, this.iconWhenSelected, this.id);
}

List<NavigationBarMenu> listNavigationBarMenu = [
  NavigationBarMenu('Home', Icons.home_outlined, Icons.home, 'home'),
  NavigationBarMenu(
      'Attendance', Icons.task_outlined, Icons.task, 'attendance'),
  NavigationBarMenu(
      'Account', Icons.account_circle_outlined, Icons.account_circle, 'account')
];
