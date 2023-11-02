import 'package:attendance_prototype/models/base/location/location_detail_model.dart';
import 'package:attendance_prototype/models/base/network/network_detail_model.dart';
import 'package:hive/hive.dart';

class AttendanceDetailBase {
  @HiveField(0)
  LocationDetailModel location;

  @HiveField(1)
  NetworkDetailModel network;

  @HiveField(3)
  DateTime time;

  AttendanceDetailBase(
      {required this.location, required this.network, required this.time});
}
