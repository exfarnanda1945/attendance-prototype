import 'package:hive_flutter/hive_flutter.dart';

import 'enter_detail/attendance_enter_detail_model.dart';
import 'exit_detail/attendance_exit_detail_model.dart';

part 'attendance_model.g.dart';

@HiveType(typeId: 2)
class AttendanceModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String userId;

  @HiveField(2)
  AttendanceEnterDetailModel enter;

  @HiveField(3)
  AttendanceExitDetailModel? exit;

  AttendanceModel({
    required this.id,
    required this.userId,
    required this.enter,
    this.exit,
  });
}
