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

  @HiveField(4)
  int latitude;

  @HiveField(5)
  int longitude;

  @HiveField(6)
  String networkName;

  @HiveField(7)
  String networkIp;

  AttendanceModel(
      {required this.userId,
      required this.enter,
      this.out,
      required this.id,
      required this.latitude,
      required this.longitude,
      required this.networkIp,
      required this.networkName});
}
