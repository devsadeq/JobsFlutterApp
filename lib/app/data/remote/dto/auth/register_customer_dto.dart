import 'package:jobs_flutter_app/app/data/remote/base/idto.dart';

class RegisterCustomerDto implements IDto {
  RegisterCustomerDto({
    this.name,
    this.email,
    this.phone,
    this.password,
  });

  RegisterCustomerDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
  }

  String? name;
  String? email;
  String? phone;
  String? password;

  RegisterCustomerDto copyWith({
    String? name,
    String? email,
    String? phone,
    String? password,
  }) =>
      RegisterCustomerDto(
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        password: password ?? this.password,
      );

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['password'] = password;
    return map;
  }
}
