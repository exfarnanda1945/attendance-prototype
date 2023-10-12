import 'package:hive/hive.dart';

part 'location_detail_model.g.dart';

@HiveType(typeId: 5)
class LocationDetailModel {
  @HiveField(0)
  double lat;

  @HiveField(1)
  double long;

  LocationDetailModel({required this.lat, required this.long});
}
