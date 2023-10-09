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
  DateTime? exit;

  @HiveField(4)
  double enterLatitude;

  @HiveField(5)
  double enterLongitude;

  @HiveField(6)
  String enterNetworkName;

  @HiveField(7)
  String enterNetworkIp;

  @HiveField(8)
  double? exitLatitude;

  @HiveField(9)
  double? exitLongitude;

  @HiveField(10)
  String? exitNetworkName;

  @HiveField(11)
  String? exitNetworkIp;

  AttendanceModel({
    required this.id,
    required this.userId,
    required this.enter,
    required this.enterLatitude,
    required this.enterLongitude,
    required this.enterNetworkName,
    required this.enterNetworkIp,
    this.exit,
    this.exitLatitude,
    this.exitLongitude,
    this.exitNetworkIp,
    this.exitNetworkName,
  });
}
