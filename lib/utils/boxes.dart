import 'package:attendance_prototype/models/attendance/attendance_model.dart';
import 'package:attendance_prototype/models/user/user_model.dart';
import 'package:attendance_prototype/models/user_login/user_login_model.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<UserModel> getUserBox() => Hive.box<UserModel>("users");
  static Box<UserLoginModel> getUserLoginBox() =>
      Hive.box<UserLoginModel>("userLogin");
  static Box<AttendanceModel> getAttendanceBox() =>
      Hive.box<AttendanceModel>("attendance");
}
