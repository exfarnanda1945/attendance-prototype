import 'package:hive/hive.dart';

part 'network_detail_model.g.dart';

@HiveType(typeId: 6)
class NetworkDetailModel {
  @HiveField(0)
  String name;

  @HiveField(1)
  String ip;

  NetworkDetailModel({required this.name, required this.ip});
}
