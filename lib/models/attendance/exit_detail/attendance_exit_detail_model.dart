import 'package:attendance_prototype/models/base/attendance_detail/attendance_detail_base.dart';
import 'package:attendance_prototype/models/base/location/location_detail_model.dart';
import 'package:attendance_prototype/models/base/network/network_detail_model.dart';
import 'package:hive/hive.dart';

part 'attendance_exit_detail_model.g.dart';

@HiveType(typeId: 4)
class AttendanceExitDetailModel extends AttendanceDetailBase {
  AttendanceExitDetailModel(
      {required super.location, required super.network, required super.time});
}
