import '../../base/idto.dart';

class LoginInDto implements IDto {
  LoginInDto({
    this.emailOrPhone,
    this.password,
  });

  String? emailOrPhone;
  String? password;

  LoginInDto.fromJson(dynamic json) {
    emailOrPhone = json['email_or_phone'];
    password = json['password'];
  }

  LoginInDto copyWith({
    String? email,
    String? password,
  }) =>
      LoginInDto(
        emailOrPhone: email ?? this.emailOrPhone,
        password: password ?? this.password,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email_or_phone'] = emailOrPhone;
    map['password'] = password;
    return map;
  }
}
