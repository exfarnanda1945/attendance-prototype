import 'package:hive_flutter/hive_flutter.dart';

part 'attendance_model.g.dart';

@HiveType(typeId: 2)
class AttendanceModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String userId;

  @HiveField(2)
  DateTime enter;

  @HiveField(3)
  DateTime? out;

  AttendanceModel(
      {required this.userId, required this.enter, this.out, required this.id});
}
