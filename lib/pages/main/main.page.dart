import 'package:attendance_prototype/models/user_login/user_login_model.dart';
import 'package:attendance_prototype/pages/boxes.dart';
import 'package:attendance_prototype/pages/main/account.page.dart';
import 'package:attendance_prototype/pages/main/attendance_history.page.dart';
import 'package:attendance_prototype/pages/main/home.page.dart';
import 'package:attendance_prototype/widgets/bottom_navigation/bottom_navigation.dart';
import 'package:attendance_prototype/widgets/bottom_navigation/navigation_bar_menu.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageNavigation = 0;
  late UserLoginModel user;

  @override
  void initState() {
    super.initState();
    user = Boxes.getUserLoginBox().values.toList()[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(
          currentPage: currentPageNavigation,
          onDestinationChange: (value) {
            setState(() {
              currentPageNavigation = value;
            });
          }),
      body: listNavigationBarMenu
          .map((page) => getPage(page))
          .toList()[currentPageNavigation],
    );
  }

  getPage(NavigationBarMenu page) {
    Widget? screen;

    switch (page.id) {
      case 'home':
        screen = const HomePage();
        break;
      case 'attendance':
        screen = AttendanceHistoryPage(
          userLogin: user,
        );
        break;
      case 'account':
        screen = AccountPage(
          user: user,
        );
        break;
      default:
        null;
    }

    return screen;
  }
}
