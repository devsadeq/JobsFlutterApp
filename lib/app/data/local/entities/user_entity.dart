import 'package:jobs_flutter_app/app/data/local/base/i_entity.dart';

class UserEntity implements IEntity {
  String? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? token;
  String? status;
  String? role;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.token,
    required this.status,
    required this.role,
  });

  @override
  UserEntity.fromMap(dynamic map) {
    id = map['id'];
    name = map['name'];
    email = map['email'];
    phoneNumber = map['phone'];
    token = map['token'];
    status = map['status'];
    role = map['role'];
  }

  @override
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phoneNumber;
    map['token'] = token;
    map['role'] = role;
    map['status'] = status;
    return map;
  }
}
