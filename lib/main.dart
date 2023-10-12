import 'dart:io';

import 'package:attendance_prototype/models/attendance/attendance_model.dart';
import 'package:attendance_prototype/models/attendance/enter_detail/attendance_enter_detail_model.dart';
import 'package:attendance_prototype/models/attendance/exit_detail/attendance_exit_detail_model.dart';
import 'package:attendance_prototype/models/base/location/location_detail_model.dart';
import 'package:attendance_prototype/models/base/network/network_detail_model.dart';
import 'package:attendance_prototype/models/user/user_model.dart';
import 'package:attendance_prototype/models/user_login/user_login_model.dart';
import 'package:attendance_prototype/pages/boxes.dart';
import 'package:attendance_prototype/routes/app-router.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  runApp(const MyApp());
}

Future<void> initHive() async {
  registerAllAdapter();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  await openAllBox();
}

Future<void> openAllBox() async {
  await Hive.openBox<UserLoginModel>("userLogin");
  await Hive.openBox<UserModel>("users");
  await Hive.openBox<AttendanceModel>("attendance");
}

void registerAllAdapter() {
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(UserLoginModelAdapter());
  Hive.registerAdapter(LocationDetailModelAdapter());
  Hive.registerAdapter(NetworkDetailModelAdapter());
  Hive.registerAdapter(AttendanceEnterDetailModelAdapter());
  Hive.registerAdapter(AttendanceExitDetailModelAdapter());
  Hive.registerAdapter(AttendanceModelAdapter());
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
