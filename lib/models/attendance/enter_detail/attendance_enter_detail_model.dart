import 'package:hive/hive.dart';

import '../../base/location/location_detail_model.dart';
import '../../base/network/network_detail_model.dart';

part 'attendance_enter_detail_model.g.dart';

@HiveType(typeId: 3)
class AttendanceEnterDetailModel {
  @HiveField(0)
  LocationDetailModel location;

  @HiveField(1)
  NetworkDetailModel network;

  @HiveField(3)
  DateTime time;

  AttendanceEnterDetailModel(
      {required this.location, required this.network, required this.time});
}
