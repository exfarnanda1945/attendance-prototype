import 'package:hive/hive.dart';

import '../../base/location/location_detail_model.dart';
import '../../base/network/network_detail_model.dart';

part 'attendance_exit_detail_model.g.dart';

@HiveType(typeId: 4)
class AttendanceExitDetailModel {
  @HiveField(0)
  LocationDetailModel? location;

  @HiveField(1)
  NetworkDetailModel? network;

  @HiveField(3)
  DateTime? time;

  AttendanceExitDetailModel({this.location, this.network, this.time});
}
