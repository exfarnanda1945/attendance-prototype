import 'package:hive/hive.dart';

part 'user_login_model.g.dart';

@HiveType(typeId: 1)
class UserLoginModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String email;

  UserLoginModel({required this.email, required this.name, required this.id});
}
