import 'package:jobs_flutter_app/app/data/remote/base/idto.dart';

class LoginOutDto implements IDto {
  LoginOutDto({
    this.token,
    this.id,
    this.name,
    this.email,
    this.role,
  });

  LoginOutDto.fromJson(dynamic json) {
    token = json['token'] != null ? Token.fromJson(json['token']) : null;
    id = json['id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  Token? token;
  String? id;
  String? name;
  String? email;
  String? role;

  LoginOutDto copyWith({
    Token? token,
    String? id,
    String? name,
    String? email,
  }) =>
      LoginOutDto(
        token: token ?? this.token,
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (token != null) {
      map['token'] = token?.toJson();
    }
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }
}

class Token {
  Token({
    this.access,
  });

  Token.fromJson(dynamic json) {
    access = json['access'];
  }

  String? access;

  Token copyWith({
    String? access,
  }) =>
      Token(
        access: access ?? this.access,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access'] = access;
    return map;
  }
}
