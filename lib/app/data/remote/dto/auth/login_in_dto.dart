import '../../base/idto.dart';

class LoginInDto implements IDto {
  LoginInDto({
    this.email,
    this.password,
  });

  LoginInDto.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
  }

  String? email;
  String? password;

  LoginInDto copyWith({
    String? email,
    String? password,
  }) =>
      LoginInDto(
        email: email ?? this.email,
        password: password ?? this.password,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    return map;
  }
}
