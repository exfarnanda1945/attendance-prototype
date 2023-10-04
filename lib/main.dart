import 'package:attendance_prototype/models/attendance/attendance_model.dart';
import 'package:attendance_prototype/models/user/user_model.dart';
import 'package:attendance_prototype/models/user_login/user_login_model.dart';
import 'package:attendance_prototype/pages/boxes.dart';
import 'package:attendance_prototype/routes/app-router.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(UserLoginModelAdapter());
  Hive.registerAdapter(AttendanceModelAdapter());
  await Hive.initFlutter();
  await Hive.openBox<UserLoginModel>("userLogin");
  await Hive.openBox<UserModel>("users");
  await Hive.openBox<AttendanceModel>("attendance");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isUserAlreadyLogin = Boxes.getUserLoginBox().values.isNotEmpty;

    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: AppRouter.getRoutes(isUserAlreadyLogin),
    );
  }
}
