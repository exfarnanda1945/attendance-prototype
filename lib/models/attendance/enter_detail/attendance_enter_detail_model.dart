import 'package:attendance_prototype/models/base/attendance_detail/attendance_detail_base.dart';
import 'package:attendance_prototype/models/base/location/location_detail_model.dart';
import 'package:attendance_prototype/models/base/network/network_detail_model.dart';
import 'package:hive/hive.dart';

part 'attendance_enter_detail_model.g.dart';

@HiveType(typeId: 3)
class AttendanceEnterDetailModel extends AttendanceDetailBase {
  AttendanceEnterDetailModel(
      {required super.location, required super.network, required super.time});
}
